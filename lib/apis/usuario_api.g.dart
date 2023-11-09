// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _UsuarioApi implements UsuarioApi {
  _UsuarioApi(
    this._dio, {
    this.baseUrl,
  }) {
<<<<<<< HEAD
    baseUrl ??= 'http://192.168.0.100:8083';
=======
    baseUrl ??= 'http://192.168.56.1:8083';
>>>>>>> 6fac0a550ff4b02b5324cf66f8273fedcd064f7c
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RespUsuarioModelo> login(UsuarioModelo usuario) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RespUsuarioModelo>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RespUsuarioModelo.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
