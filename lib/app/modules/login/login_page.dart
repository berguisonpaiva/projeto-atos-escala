import 'package:escala_ministeria/app/core/dio/custom_dio.dart';
import 'package:escala_ministeria/app/shared/auth_store.dart';
import 'package:escala_ministeria/app/shared/theme_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  AuthStore _authController;
  FirebaseAuth firebaseAuth;
  @override
  void initState() {
    _authController = Modular.get<AuthStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeUtils.primaryColor,
        resizeToAvoidBottomPadding: false,
        body: Container(
          width: ScreenUtil.screenWidthDp,
          height: ScreenUtil.screenHeightDp,
          child: Stack(
            children: [
              Container(
                width: ScreenUtil.screenWidthDp,
                height: ScreenUtil.screenHeightDp < 700
                    ? 800
                    : ScreenUtil.screenHeightDp * .95,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'lib/assets/images/login_background.png'),
                        fit: BoxFit.fill)),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil.statusBarHeight),
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/images/logo.png',
                      width: ScreenUtil().setWidth(400),
                      fit: BoxFit.fill,
                    ),
                    _buildForm()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.loginController,
              decoration: InputDecoration(
                  labelText: 'Login',
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50), gapPadding: 0)),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Login Obrigatorio';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Observer(builder: (_) {
              return TextFormField(
                controller: controller.senhaController,
                obscureText: controller.obscureText,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50), gapPadding: 0),
                  suffixIcon: IconButton(
                      onPressed: () => controller.mostrarSenhaUsuario(),
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                      )),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Senha Obrigatoria';
                  } else if (value.length < 6) {
                    return 'Senha precisa ter pelo menos 6 caracteres';
                  }
                  return null;
                },
              );
            }),
            Container(
              padding: EdgeInsets.all(10),
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                onPressed: () => controller.login(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: ThemeUtils.primaryColor,
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Cadastre-se'),
            )
          ],
        ),
      ),
    );
  }
}
