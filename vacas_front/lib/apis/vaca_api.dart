import 'package:vacas_front/modelo/VacaModelo.dart';
import 'package:vacas_front/modelo/GenericModelo.dart';
import 'package:vacas_front/util/UrlApi.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'vaca_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class VacaApi {
  factory VacaApi(Dio dio, {String baseUrl}) = _VacaApi;

  static VacaApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return VacaApi(dio);
  }

  @GET("/vaca/list")
  Future<List<VacaRespModelo>> getVaca(@Header("Authorization") String token);

  @POST("/vaca/crear")
  Future<VacaRespModelo> crearVaca(
      @Header("Authorization") String token, @Body() VacaModelo vaca);

  @GET("/vaca/buscar/{id}")
  Future<VacaModelo> findVaca(
      @Header("Authorization") String token, @Path("id") int id);

  @DELETE("/vaca/eliminar/{id}")
  Future<GenericModelo> deleteVaca(
      @Header("Authorization") String token, @Path("id") int id);

  @PUT("/vaca/editar/{id}")
  Future<VacaRespModelo> updateFinca(@Header("Authorization") String token,
      @Path("id") int id, @Body() VacaModelo vaca);
}
