import 'package:json_annotation/json_annotation.dart';
import 'package:vacas_front/modelo/VacaModelo.dart';

@JsonSerializable()
class ProLecheModelo {
  late int id = 0;
  late final String fechaRegistro;
  late final String cantidadLeche;
  late final String calidadLeche;
  late final String registroOrdeno;
  late final String observaciones;
  late final int vacaId;
  ProLecheModelo({
    required this.id,
    required this.fechaRegistro,
    required this.cantidadLeche,
    required this.calidadLeche,
    required this.registroOrdeno,
    required this.observaciones,
    required this.vacaId,
  });

  ProLecheModelo.unlaunched();

  ProLecheModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fechaRegistro = json['fechaRegistro'];
    cantidadLeche = json['cantidadLeche'];
    calidadLeche = json['calidadLeche'];
    registroOrdeno = json['registroOrdeno'];
    observaciones = json['observaciones'];
    vacaId = json['vacaId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fechaRegistro'] = fechaRegistro;
    _data['cantidadLeche'] = cantidadLeche;
    _data['calidadLeche'] = calidadLeche;
    _data['registroOrdeno'] = registroOrdeno;
    _data['observaciones'] = observaciones;
    _data['vacaId'] = vacaId;
    return _data;
  }
}

class ProLecheRespModelo {
  ProLecheRespModelo({
    required this.id,
    required this.fechaRegistro,
    required this.cantidadLeche,
    required this.calidadLeche,
    required this.registroOrdeno,
    required this.observaciones,
    required this.vacaId,
  });
  late final int id;
  late final String fechaRegistro;
  late final String cantidadLeche;
  late final String calidadLeche;
  late final String registroOrdeno;
  late final String observaciones;
  late final VacaRespModelo vacaId;

  ProLecheRespModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fechaRegistro = json['fechaRegistro'];
    cantidadLeche = json['cantidadLeche'];
    calidadLeche = json['calidadLeche'];
    registroOrdeno = json['registroOrdeno'];
    observaciones = json['observaciones'];
    vacaId = VacaRespModelo.fromJson(json['vacaId']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fechaRegistro'] = fechaRegistro;
    _data['cantidadLeche'] = cantidadLeche;
    _data['calidadLeche'] = calidadLeche;
    _data['registroOrdeno'] = registroOrdeno;
    _data['observaciones'] = observaciones;
    _data['vacaId'] = vacaId.toJson();
    return _data;
  }
}
