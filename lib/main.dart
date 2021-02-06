import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:escala_ministeria/app/app_module.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await loadEnv();
  runApp(ModularApp(module: AppModule()));
}

Future<Void> loadEnv() async {
  const isProduction = bool.fromEnvironment('dart.vm.product');
  await DotEnv().load(isProduction ? '.env' : '.env_dev');
}
