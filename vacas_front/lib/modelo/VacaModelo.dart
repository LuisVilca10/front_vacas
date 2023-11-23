import 'package:json_annotation/json_annotation.dart';
import 'package:vacas_front/modelo/FincaModelo.dart';

@JsonSerializable()
class VacaModelo {
  late int id = 0;
  late final String nombreVaca;
  late final String sexo;
  late final String feNacimiento;
  late final String raza;
  late final String noArete;
  late final int fincaId; //cambiamos aqui

  VacaModelo({
    required this.id,
    required this.nombreVaca,
    required this.sexo,
    required this.feNacimiento,
    required this.raza,
    required this.noArete,
    required this.fincaId,
  });

  VacaModelo.unlaunched();

  VacaModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombreVaca = json['nombreVaca'];
    sexo = json['sexo'];
    feNacimiento = json['feNacimiento'];
    raza = json['raza'];
    noArete = json['noArete'];
    fincaId = json['fincaId']; //aqui tambien
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombreVaca'] = nombreVaca;
    _data['sexo'] = sexo;
    _data['feNacimiento'] = feNacimiento;
    _data['raza'] = raza;
    _data['noArete'] = noArete;
    _data['fincaId'] = fincaId;
    return _data;
  }
}

class VacaRespModelo {
  VacaRespModelo({
    required this.id,
    required this.nombreVaca,
    required this.sexo,
    required this.feNacimiento,
    required this.raza,
    required this.noArete,
    required this.fincaId,
  });

  //VacaModelo.unlaunched();

  late final int id;
  late final String nombreVaca;
  late final String sexo;
  late final String feNacimiento;
  late final String raza;
  late final String noArete;
  late final FincaModelo fincaId;

  VacaRespModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombreVaca = json['nombreVaca'];
    sexo = json['sexo'];
    feNacimiento = json['feNacimiento'];
    raza = json['raza'];
    noArete = json['noArete'];
    fincaId = FincaModelo.fromJson(json['fincaId']);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombreVaca'] = nombreVaca;
    _data['sexo'] = sexo;
    _data['feNacimiento'] = feNacimiento;
    _data['raza'] = raza;
    _data['noArete'] = noArete;
    _data['fincaId'] = fincaId.toJson();
    return _data;
  }
}
