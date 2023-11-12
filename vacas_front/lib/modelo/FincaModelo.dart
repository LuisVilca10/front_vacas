import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FincaModelo {
  FincaModelo({
    required this.id,
    required this.nombreFinca,
    required this.are,
    required this.medida,
    required this.telefono,
    required this.latitud,
    required this.longitud,
    required this.rol,
  });

  FincaModelo.unlaunched();

  late int id = 0;
  late final String nombreFinca;
  late final String are;
  late final String medida;
  late final String telefono;
  late final String latitud;
  late final String longitud;
  late final String rol;

  FincaModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombreFinca = json['nombreFinca'];
    are = json['are'];
    medida = json['medida'];
    telefono = json['telefono'];
    latitud = json['latitud'];
    longitud = json['longitud'];
    rol = json['rol'];
  }

  factory FincaModelo.fromJsonModelo(Map<String, dynamic> json) {
    return FincaModelo(
        id: json['id'],
        nombreFinca: json['nombreFinca'],
        are: json['are'],
        medida: json['medida'],
        telefono: json['telefono'],
        latitud: json['latitud'],
        longitud: json['longitud'],
        rol: json['rol']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombreFinca'] = nombreFinca;
    _data['are'] = are;
    _data['medida'] = medida;
    _data['telefono'] = telefono;
    _data['latitud'] = latitud;
    _data['longitud'] = longitud;
    _data['rol'] = rol;
    return _data;
  }
}
