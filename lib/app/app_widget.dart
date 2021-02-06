import 'package:escala_ministeria/app/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.addKey(Modular.navigatorKey),
      title: 'Flutter Slidy',
      theme: ThemeApp.theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      navigatorObservers: [GetObserver()],
    );
  }
}
