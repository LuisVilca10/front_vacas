import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:vacas_front/modelo/GenericModelo.dart';
import 'package:vacas_front/modelo/SaludVaca.dart';
import 'package:vacas_front/util/UrlApi.dart';

part 'saludvaca_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class SaludVacaApi {
  factory SaludVacaApi(Dio dio, {String baseUrl}) = _SaludVacaApi;

  static SaludVacaApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return SaludVacaApi(dio);
  }

  @GET("/salud/list")
  Future<List<SaludVacaRespModelo>> getSaludVaca(
      @Header("Authorization") String token);

  @POST("/salud/crear")
  Future<SaludVacaRespModelo> crearSaludVaca(
      @Header("Authorization") String token, @Body() SaludVacaModelo saludvaca);

  @GET("/salud/buscar/{id}")
  Future<SaludVacaModelo> findSaludVaca(
      @Header("Authorization") String token, @Path("id") int id);

  @DELETE("/salud/eliminar/{id}")
  Future<GenericModelo> deleteSaludVaca(
      @Header("Authorization") String token, @Path("id") int id);

  @PUT("/salud/editar/{id}")
  Future<SaludVacaModelo> updateSaludVaca(@Header("Authorization") String token,
      @Path("id") int id, @Body() SaludVacaModelo saludvaca);
}
