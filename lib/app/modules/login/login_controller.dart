import 'package:escala_ministeria/app/services/usuario_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UsuarioService _service;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @observable
  bool obscureText = true;
  _LoginControllerBase(this._service);
  @action
  void mostrarSenhaUsuario() {
    obscureText = !obscureText;
  }

  @action
  void login() async {
    if (formKey.currentState.validate()) {
      try {
        await _service.login(loginController.text, senhaController.text);
        Modular.to.pushReplacementNamed('/');
      } catch (e) {
        Get.snackbar('Erro', 'Erro ao realizar login');
      }
    }
  }
}
