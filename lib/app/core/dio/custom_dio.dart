import 'package:dio/dio.dart';
import 'package:escala_ministeria/app/core/dio/auth_interceptor_wrapper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomDio {
  static CustomDio _simpleInstace;
  static CustomDio _authInstace;
  Dio _dio;
  BaseOptions options = BaseOptions(
    baseUrl: DotEnv().env['base_url'],
    connectTimeout: int.parse(DotEnv().env['dio_connectTimeout']),
    receiveTimeout: int.parse(DotEnv().env['dio_receivetTimeout']),
  );

  CustomDio._() {
    _dio = Dio(options);
  }
  CustomDio._auth() {
    _dio = Dio(options);
    _dio.interceptors.add(AuthInterceptorWrapper());
  }

  static Dio get instance {
    _simpleInstace ??= CustomDio._();
    return _simpleInstace._dio;
  }

  static Dio get authInstance {
    _authInstace ??= CustomDio._auth();
    return _authInstace._dio;
  }
}
