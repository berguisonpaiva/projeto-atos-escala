import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:escala_ministeria/app/shared/auth_store.dart';
import 'package:escala_ministeria/app/shared/theme_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/screenutil.dart';

class MainPage extends StatelessWidget {
  MainPage() {
    WidgetsBinding.instance.addPostFrameCallback((Timestamp) async {
      final authStore = Modular.get<AuthStore>();
      final isLogged = await authStore.isLogged();
      if (isLogged) {
        Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
      } else {
        Modular.to.pushNamedAndRemoveUntil('/login', (_) => false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ThemeUtils.init(context);
    return Scaffold(
      body: Center(
          child: Container(
              width: 200,
              height: 200,
              child: Image.asset('lib/assets/images/logo.png'))),
    );
  }
}
