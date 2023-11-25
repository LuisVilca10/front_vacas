import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:vacas_front/modelo/VacaModelo.dart';

class SaludVacaModelo {
  late int id = 0;
  late final String fechaRegistro;
  late final String peso;
  late final int frecuenciaCardiaca;
  late final String vacunaciones;
  //late final String ultimaRevisionVeterinaria;
  late final String sintomas;
  late final int vacaId;

  SaludVacaModelo({
    required this.id,
    required this.fechaRegistro,
    required this.peso,
    required this.frecuenciaCardiaca,
    required this.vacunaciones,
    //required this.ultimaRevisionVeterinaria,
    required this.sintomas,
    required this.vacaId,
  });

  SaludVacaModelo.unlaunched();

  SaludVacaModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fechaRegistro = json['fechaRegistro'];
    peso = json['peso'];
    frecuenciaCardiaca = json['frecuenciaCardiaca'];
    vacunaciones = json['vacunaciones'];
    //ultimaRevisionVeterinaria = json['ultimaRevisionVeterinaria'];
    sintomas = json['sintomas'];
    vacaId = json['vacaId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fechaRegistro'] = fechaRegistro;
    _data['peso'] = peso;
    _data['frecuenciaCardiaca'] = frecuenciaCardiaca;
    _data['vacunaciones'] = vacunaciones;
    //_data['ultimaRevisionVeterinaria'] = ultimaRevisionVeterinaria;
    _data['sintomas'] = sintomas;
    _data['vacaId'] = vacaId;
    return _data;
  }
}

class SaludVacaRespModelo {
  SaludVacaRespModelo({
    required this.id,
    required this.fechaRegistro,
    required this.peso,
    required this.frecuenciaCardiaca,
    required this.vacunaciones,
    //required this.ultimaRevisionVeterinaria,
    required this.sintomas,
    required this.vacaId,
  });
  late final int id;
  late final String fechaRegistro;
  late final String peso;
  late final int frecuenciaCardiaca;
  late final String vacunaciones;
  // late final String ultimaRevisionVeterinaria;
  late final String sintomas;
  late final VacaRespModelo vacaId;

  SaludVacaRespModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fechaRegistro = json['fechaRegistro'];
    peso = json['peso'];
    frecuenciaCardiaca = json['frecuenciaCardiaca'];
    vacunaciones = json['vacunaciones'];
    //ultimaRevisionVeterinaria = json['ultimaRevisionVeterinaria'];
    sintomas = json['sintomas'];
    vacaId = VacaRespModelo.fromJson(json['vacaId']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fechaRegistro'] = fechaRegistro;
    _data['peso'] = peso;
    _data['frecuenciaCardiaca'] = frecuenciaCardiaca;
    _data['vacunaciones'] = vacunaciones;
    //_data['ultimaRevisionVeterinaria'] = ultimaRevisionVeterinaria;
    _data['sintomas'] = sintomas;
    _data['vacaId'] = vacaId.toJson();
    return _data;
  }
}
