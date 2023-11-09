import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:vacaspruebas/animation/FadeAnimation.dart';

class EmailLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmailLoginPageState();
  }
}

class EmailLoginPageState extends State<EmailLoginPage> {
  List<String> pa = [
    'Hectáreas',
    'Fanegadas',
    'Cuadras',
    'Metros cuadrado',
    'Manzana'
  ];
  final _formkey = GlobalKey<FormState>();

  late TextEditingController _controller;
  late TextEditingController _controller2;
  late String? pais;
  late bool seleccion;
  late String carrera;

  final baseUrl = 'https://test-usuarios.herokuapp.com/api';

  @override
  void initState() {
    _controller = TextEditingController(text: '');
    _controller2 = TextEditingController(text: '');
    seleccion = false;
    carrera = '';
    pais = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getCurrentLocation();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Agregar Finca",
          style: TextStyle(color: Colors.black45, fontSize: 30),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black45,
          ),
          onPressed: () {
            Navigator.pop(context); //retrocedemos a la ruta anterior
            //Naviagtor.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              //padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(24),
              //color: AppTheme.nearlyWhite,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                        controller: _controller,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.home_work,
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(color: Colors.black54),
                            labelStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.yellow, width: 100.0)),
                            hintText: 'Ej: Finca San Agustin',
                            label: Text('Nombre de la finca')),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return 'El Nombre es obligatorio';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: _controller2,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.crop,
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(color: Colors.black45),
                            labelStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.yellow, width: 100.0)),
                            hintText: 'Ej: 1000',
                            label: Text('Area de la Finca')),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return 'El Areá es obligatorio';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    const Text("Selleciona tu medida"),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      // color: Colors.black26,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black26),
                      child: DropdownButton<String>(
                          value: pais,
                          items:
                              pa.map<DropdownMenuItem<String>>((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              if (value != null) {
                                pais = value;
                              }
                            });
                          }),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                        //controller: _controller2,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(color: Colors.black45),
                            labelStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(),
                            hintText: 'Ej: 992-123-123',
                            label: Text('Telefonó de la Finca')),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return 'El Telefonó es obligatorio';
                          }
                          return null;
                        }),
                  ],
                ),
              ))),
    );
  }

  Widget _buildDatoEntero(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Id es campo Requerido';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(int.parse(value!));
      },
    );
  }

  Widget _buildDatoCadena(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Future<void> _selectDate(BuildContext context, Function obtValor) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
  }

  Widget _buildDatoFecha(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      // controller: _fecha,
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onTap: () {
        _selectDate(context, obtValor);
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Future<void> _selectTime(BuildContext context, Function obtValor) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        });
  }

  Widget _buildDatoHora(Function obtValor, Function capControl, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: capControl(),
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onTap: () {
        _selectTime(context, obtValor);
      },
      onSaved: (String? value) {
        obtValor(value!);
        //_horai.text=value!;
      },
    );
  }

  /*Future<bool> permiso() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> getCurrentLocation() async {
    final hasPermission = await permiso();
    if (!hasPermission) {
      return;
    }
    if (mounted) {
      Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best,
              forceAndroidLocationManager: true)
          .then((Position position) {
        if (mounted) {
          setState(() {
            currentPosition = position;
            //getCurrentLocationAddress();
          });
        }
      }).catchError((e) {
        print(e);
      });
    }
  }*/
}
