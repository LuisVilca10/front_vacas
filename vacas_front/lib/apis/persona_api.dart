import 'package:vacas_front/modelo/UsuarioModelo.dart';
import 'package:vacas_front/modelo/GenericModelo.dart';
import 'package:vacas_front/util/UrlApi.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'persona_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class PersonaApi {
  factory PersonaApi(Dio dio, {String baseUrl}) = _PersonaApi;

  static PersonaApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return PersonaApi(dio);
  }

  @GET("/user/list")
  Future<List<UsuarioModelo>> getUsuario(@Header("Authorization") String token);

  @POST("/user/crear")
  Future<UsuarioModelo> crearUsuario(@Header("Authorization") String token, @Body() UsuarioModelo usuario);

  @GET("/user/buscar/{id}")
  Future<UsuarioModelo> findUsuario(
      @Header("Authorization") String token, @Path("id") int id);

  @DELETE("/user/eliminar/{id}")
  Future<GenericModelo> deleteUsuario(
      @Header("Authorization") String token, @Path("id") int id);

  @PUT("/user/editar/{id}")
  Future<UsuarioModelo> updateUsuario(@Header("Authorization") String token,
      @Path("id") int id, @Body() UsuarioModelo usuario);
}
