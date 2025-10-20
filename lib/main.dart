import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oli/0_presentation/core/app_widget.dart';
import 'package:oli/3_infrastructure/core/dependency.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await injectDependencies();
  runApp(const AppWidget());
}
