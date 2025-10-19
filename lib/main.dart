import 'package:flutter/material.dart';
import 'package:oli/0_presentation/core/app_widget.dart';
import 'package:oli/3_infrastructure/core/dependency.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const AppWidget());
}
