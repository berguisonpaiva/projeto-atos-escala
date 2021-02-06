import 'package:escala_ministeria/app/core/dio/custom_dio.dart';
import 'package:escala_ministeria/app/models/access_token_model.dart';

class UsuarioRepository {
  Future<AccessTokenModel> login(String email, String password,
      {String avata = ''}) {
    CustomDio.instance.post('/api/auth', data: {
      'login': email,
      'senha': password,
      'avata': avata
    }).then((res) => AccessTokenModel.fromJson(res.data));
  }
}
