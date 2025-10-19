import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:oli/2_domain/core/i_connection.dart';
import 'package:oli/3_infrastructure/core/environment.dart';

class HttpConnection implements IConnection {
  HttpConnection();

  final Map<int, void Function()> _statusCodeCallbacks = {};
  final Map<String, void Function(dynamic data)> _eventCallbacks = {};
  String? _authToken;

  Uri _resolveUri(String uri) {
    if (uri.startsWith('http://') || uri.startsWith('https://')) {
      return Uri.parse(uri);
    }
    final normalizedBase = EnvironmentConfig.backEndUrl.endsWith('/')
        ? EnvironmentConfig.backEndUrl.substring(
            0, EnvironmentConfig.backEndUrl.length - 1)
        : EnvironmentConfig.backEndUrl;
    final normalizedPath = uri.startsWith('/') ? uri : '/$uri';
    return Uri.parse('$normalizedBase$normalizedPath');
  }

  Map<String, String> _headers({Map<String, String>? extra}) {
    final baseHeaders = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      if (_authToken != null)
        HttpHeaders.authorizationHeader: 'Bearer $_authToken',
    };
    if (extra != null) {
      baseHeaders.addAll(extra);
    }
    return baseHeaders;
  }

  void _handleStatusCode(int statusCode) {
    final callback = _statusCodeCallbacks[statusCode];
    if (callback != null) {
      callback();
    }
  }

  Future<http.Response> _send(
    String method,
    String uri, {
    String? data,
    Map<String, String>? headers,
  }) async {
    final resolvedUri = _resolveUri(uri);
    final mergedHeaders = _headers(extra: headers);

    late final http.Response response;
    switch (method) {
      case 'GET':
        response = await http.get(resolvedUri, headers: mergedHeaders);
        break;
      case 'POST':
        response = await http.post(
          resolvedUri,
          headers: mergedHeaders,
          body: data,
        );
        break;
      case 'PATCH':
        response = await http.patch(
          resolvedUri,
          headers: mergedHeaders,
          body: data,
        );
        break;
      case 'DELETE':
        response = await http.delete(
          resolvedUri,
          headers: mergedHeaders,
          body: data,
        );
        break;
      default:
        throw UnsupportedError('HTTP method $method is not supported');
    }
    _handleStatusCode(response.statusCode);
    return response;
  }

  @override
  Future<http.Response> delete(String uri, {String? data}) {
    return _send('DELETE', uri, data: data);
  }

  @override
  Future<http.Response> get(String uri) {
    return _send('GET', uri);
  }

  @override
  Future<http.Response> patch(String uri, {String? data}) {
    return _send('PATCH', uri, data: data);
  }

  @override
  Future<http.Response> post(String uri, {String? data}) {
    return _send('POST', uri, data: data);
  }

  @override
  void removeCallback(int statusCode) {
    _statusCodeCallbacks.remove(statusCode);
  }

  @override
  void setCallback(int statusCode, void Function() callback) {
    _statusCodeCallbacks[statusCode] = callback;
  }

  @override
  void setEvent(String event, void Function(dynamic data) callback) {
    _eventCallbacks[event] = callback;
  }

  @override
  Future<http.Response> uploadFile(String uri, {required File file}) async {
    final resolvedUri = _resolveUri(uri);
    final request = http.MultipartRequest('POST', resolvedUri);
    request.headers.addAll(
      _headers(
        extra: {HttpHeaders.contentTypeHeader: 'multipart/form-data'},
      ),
    );
    request.files
        .add(await http.MultipartFile.fromPath('file', file.path));
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    _handleStatusCode(response.statusCode);
    return response;
  }

  @override
  Map<String, dynamic> getJsonMapOrCrash(String body, {String? key}) {
    final decoded = json.decode(body);
    if (decoded is Map<String, dynamic>) {
      if (key == null) {
        return decoded;
      }
      final nested = decoded[key];
      if (nested is Map<String, dynamic>) {
        return nested;
      }
    }
    throw const FormatException('Invalid json map body');
  }

  @override
  Iterable<dynamic> getIterableOrCrash(String body) {
    final decoded = json.decode(body);
    if (decoded is Iterable<dynamic>) {
      return decoded;
    }
    throw const FormatException('Invalid json iterable body');
  }

  @override
  void logOut() {
    _authToken = null;
    _eventCallbacks.clear();
  }

  @override
  void removeAuthToken() {
    _authToken = null;
  }

  @override
  void setAuthToken(String token) {
    _authToken = token;
  }
}
