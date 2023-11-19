import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:vacas_front/modelo/GenericModelo.dart';
import 'package:vacas_front/modelo/ProLecheModelo.dart';
import 'package:vacas_front/util/UrlApi.dart';

part 'proleche_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class ProLecheApi {
  factory ProLecheApi(Dio dio, {String baseUrl}) = _ProLecheApi;

  static ProLecheApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ProLecheApi(dio);
  }

  @GET("/pLeche/list")
  Future<List<ProLecheRespModelo>> getProLeche(
      @Header("Authorization") String token);

  @POST("/pLeche/crear")
  Future<ProLecheRespModelo> crearProLeche(
      @Header("Authorization") String token, @Body() ProLecheModelo proleche);

  @GET("/pLeche/buscar/{id}")
  Future<ProLecheModelo> findProLeche(
      @Header("Authorization") String token, @Path("id") int id);

  @DELETE("/pLeche/eliminar/{id}")
  Future<GenericModelo> deleteProLeche(
      @Header("Authorization") String token, @Path("id") int id);

  @PUT("/pLeche/editar/{id}")
  Future<ProLecheModelo> updateProLeche(@Header("Authorization") String token,
      @Path("id") int id, @Body() ProLecheModelo proleche);
}
