import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:oli/2_domain/core/i_connection.dart';

class MockConnection implements IConnection {
  MockConnection();

  final Map<int, void Function()> _callbacks = {};
  String? _authToken;

  @override
  Future<http.Response> delete(String uri, {String? data}) async => _response();

  @override
  Future<http.Response> get(String uri) async => _response();

  @override
  Future<http.Response> patch(String uri, {String? data}) async => _response();

  @override
  Future<http.Response> post(String uri, {String? data}) async => _response();

  @override
  Future<http.Response> uploadFile(String uri, {required File file}) async =>
      _response();

  @override
  Map<String, dynamic> getJsonMapOrCrash(String body, {String? key}) {
    final decoded = jsonDecode(body);
    if (decoded is Map<String, dynamic>) {
      if (key == null) {
        return decoded;
      }
      final nested = decoded[key];
      if (nested is Map<String, dynamic>) {
        return nested;
      }
    }
    throw const FormatException('Invalid json map');
  }

  @override
  Iterable<dynamic> getIterableOrCrash(String body) {
    final decoded = jsonDecode(body);
    if (decoded is Iterable) {
      return decoded;
    }
    throw const FormatException('Invalid json iterable');
  }

  @override
  void logOut() {
    _authToken = null;
    _callbacks[401]?.call();
  }

  @override
  void removeAuthToken() {
    _authToken = null;
  }

  @override
  void removeCallback(int statusCode) {
    _callbacks.remove(statusCode);
  }

  @override
  void setAuthToken(String token) {
    _authToken = token;
  }

  @override
  void setCallback(int statusCode, void Function() callback) {
    _callbacks[statusCode] = callback;
  }

  @override
  void setEvent(String event, void Function(dynamic data) callback) {}

  http.Response _response() => http.Response(
        jsonEncode({
          'ok': true,
          'token': _authToken,
        }),
        200,
        headers: const {'content-type': 'application/json'},
      );
}
