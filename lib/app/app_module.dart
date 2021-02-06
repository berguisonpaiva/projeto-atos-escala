import 'package:escala_ministeria/app/modules/home/home_module.dart';
import 'package:escala_ministeria/app/modules/login/login_module.dart';
import 'package:escala_ministeria/app/modules/main/main_page.dart';
import 'package:escala_ministeria/app/repository/usuario_repository.dart';
import 'package:escala_ministeria/app/services/usuario_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:escala_ministeria/app/app_widget.dart';
import 'package:escala_ministeria/app/shared/auth_store.dart';
import 'package:escala_ministeria/app/app_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthStore()),
        Bind((i) => UsuarioRepository()),
        Bind((i) => UsuarioService(i.get()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (contex, args) => MainPage()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
