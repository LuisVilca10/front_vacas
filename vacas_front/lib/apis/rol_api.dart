import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:vacas_front/modelo/RolModelo.dart';
import 'package:vacas_front/util/UrlApi.dart';

part 'rol_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class RolApi {
  factory RolApi(Dio dio, {String baseUrl}) = _RolApi;

  static RolApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return RolApi(dio);
  }

  @GET("/rol/list")
  Future<List<RolModelo>> getRol(@Header("Authorization") String token);

  @GET("/rol/buscar/{id}")
  Future<RolModelo> findSaludVaca(
      @Header("Authorization") String token, @Path("id") int id);
}
