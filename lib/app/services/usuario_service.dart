import 'package:escala_ministeria/app/repository/shared_prefs_repository.dart';
import 'package:escala_ministeria/app/repository/usuario_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UsuarioService {
  final UsuarioRepository _repository;
  UsuarioService(this._repository);
  Future<void> login(String email, String password, {String avata = ''}) async {
    try {
      final accessTokenModel =
          await _repository.login(email, password, avata: avata);

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final prefs = await SharedPrefsRepository.instance;
      prefs.registerAccesToken(accessTokenModel.accessToken);
    } on PlatformException catch (e) {
      print('erro ao fazer login');
      rethrow;
    } catch (e) {
      print('erro ao fazer login');
      rethrow;
    }
  }
}
