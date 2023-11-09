<<<<<<< HEAD
import 'package:vacaspruebas/modelo/UsuarioModelo.dart';
import 'package:vacaspruebas/util/UrlApi.dart';
=======
import 'package:vacas_front/modelo/UsuarioModelo.dart';
import 'package:vacas_front/util/UrlApi.dart';
>>>>>>> 6fac0a550ff4b02b5324cf66f8273fedcd064f7c
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'usuario_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class UsuarioApi {
  factory UsuarioApi(Dio dio, {String baseUrl}) = _UsuarioApi;

  static UsuarioApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return UsuarioApi(dio);
  }

<<<<<<< HEAD
  @POST("/auth/login")
=======
  @POST("/auth/login") //davidmpx@upeu.edu.pe //D123456
>>>>>>> 6fac0a550ff4b02b5324cf66f8273fedcd064f7c
  Future<RespUsuarioModelo> login(@Body() UsuarioModelo usuario);
}
