import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacas_front/animation/FadeAnimation.dart';
import 'package:vacas_front/apis/proleche_api.dart';
import 'package:vacas_front/apis/vaca_api.dart';

import 'package:vacas_front/componets/DropDownFormField.dart';
import 'package:intl/intl.dart';
import 'package:vacas_front/modelo/ProLecheModelo.dart';
import 'package:vacas_front/ui/analitica/leche/pro_main.dart';
import 'package:vacas_front/util/TokenUtil.dart';

class ProLecheForm extends StatefulWidget {
  @override
  _ProLecheFormState createState() => _ProLecheFormState();
}

class _ProLecheFormState extends State<ProLecheForm> {
  bool showProfileInfo = false;
  //late String _nombrefinca = "";
  //late String _nombreVaca = "";
  //late String _nroVaca = "";
  late String _cantidadLeche = "";
  late String _calidad = "";
  late String _observaciones = "";
  late String _registo = "";
  //late String _sexo = "";

  TextEditingController _fechaOrdeno = new TextEditingController();
  DateTime? selectedDate;

  //TextEditingController _horai = new TextEditingController();
  //TimeOfDay? selectedTime;

  late int _vaca;
  String vacaString = '0';
  List<Map<String, String>> user = [
    {'value': '0', 'display': 'Seleccione'},
  ];
//  late String _raza = "";
//  late String _estado = "Activo";
//late String _offlinex = "Si";
// late String _perfil_prin = "Todo";

  Position? currentPosition;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  @override
  void initState() {
    super.initState();
    _jalarvaca();
  }

  late VacaApi personapi;
  _jalarvaca() async {
    setState(() {
      personapi = VacaApi.create();
      Provider.of<VacaApi>(context, listen: false)
          .getVaca(TokenUtil.TOKEN)
          .then((value) {
        value.forEach((element) {
          user.add(
              {'value': element.id.toString(), 'display': element.nombreVaca});
        });
      });
    });
    await Future.delayed(Duration(seconds: 1));
  }

  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = true;
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );
  void capturaFecha(valor) {
    this._fechaOrdeno.text = valor;
  }

  void capturaCalidad(valor) {
    this._calidad = valor;
  }

  void capturaCantidad(valor) {
    this._cantidadLeche = valor;
  }

  void capturaObeservaciones(valor) {
    this._observaciones = valor;
  }

  void capturaRegistro(valor) {
    this._registo = valor;
  }

  void capturVaca(valor) {
    this.vacaString = valor;
  }

  @override
  Widget build(BuildContext context) {
    getCurrentLocation();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        /*title: const Text(
          "Form. Reg. Finca",
          style: TextStyle(color: Colors.black),
        ),*/
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: FadeAnimation(
        0.5,
        SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(24),
                //color: AppTheme.nearlyWhite,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Form. Produccion Leche",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoFecha(capturaFecha, "Fecha de Ordeño:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoCalidd(capturaCantidad, "Cantidad Leche:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoCalidd(capturaCalidad, "Calidad Leche:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoCalidd(
                          capturaObeservaciones, "Obeservaciones:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoNombre(capturaRegistro, "Registro Ordeño:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoLista(capturVaca, vacaString, "Vaca ID:", user),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Text('Cancelar')),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Processing Data'),
                                    ),
                                  );
                                  _formKey.currentState!.save();
                                  ProLecheModelo mp =
                                      new ProLecheModelo.unlaunched();
                                  mp.id = 0;
                                  mp.fechaRegistro = DateFormat('yyyy-MM-dd')
                                      .format(DateTime.parse(
                                          _fechaOrdeno.value.text));
                                  //print(DateFormat('yyyy-MM-dd').format(currentTime));
                                  mp.cantidadLeche = _cantidadLeche;
                                  mp.calidadLeche = _calidad;
                                  mp.observaciones = _observaciones;
                                  mp.registroOrdeno = _registo;
                                  //FincaModelo finca=FincaModelo.unlaunched();
                                  //finca.id=_finca;
                                  mp.vacaId = int.parse(vacaString);

                                  /*final prefs =
                                      await SharedPreferences.getInstance();
                                  print("ver: ${mp.toJson()}");*/
                                  var api = await Provider.of<ProLecheApi>(
                                          context,
                                          listen: false)
                                      .crearProLeche(TokenUtil.TOKEN, mp);

                                  if (api.toJson() != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainProLeche()),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'No estan bien los datos de los campos!'),
                                    ),
                                  );
                                }
                              },
                              child: const Text('Guardar'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }

  Widget _buildDatoEntero(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.home),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true),
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

  Widget _buildDatoTipoUser(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.person_2),
        hintText: 'Ej: admin',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Tipo es requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Widget _buildDatoCalidd(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.numbers),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Este campo es requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Widget _buildDatoNombre(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.pest_control_rodent_sharp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre es requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Widget _buildDatoRaza(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.category_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Correo Requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Widget _buildDatoFinca(
    Function obtValor,
    String label,
  ) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.add_business),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Finca es Requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        //FincaModelo finca = FincaModelo(nombre: value!);
        obtValor(_vaca);
      },
    );
  }

  Widget _buildDatosexo(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.swipe_left_alt),
        labelText: label,
        hintText: "Ej. Perez Perez",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Apellido Requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Widget _buildDatoNumber(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.picture_as_pdf_outlined),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'DNI es Requerido';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Widget _buildDatoPhone(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Telefono es Requerido';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Widget _buildDatoLista(
      Function obtValor, _dato, String label, List<dynamic> listaDato) {
    return DropDownFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
      ),
      titleText: label,
      hintText: 'Seleccione',
      value: _dato,
      onSaved: (value) {
        setState(() {
          obtValor(value);
        });
      },
      onChanged: (value) {
        setState(() {
          obtValor(value);
        });
      },
      dataSource: listaDato,
      textField: 'display',
      valueField: 'value',
    );
  }

  Widget _buildDatoFecha(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.date_range),
          labelText: label,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      controller: _fechaOrdeno,
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Este campo es requerido!';
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

  Future<void> _selectDate(BuildContext context, Function obtValor) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        String formattedDate =
            "${selectedDate?.year}-${selectedDate?.month.toString().padLeft(2, '0')}-${selectedDate?.day.toString().padLeft(2, '0')}";
        _fechaOrdeno.text = formattedDate;
        obtValor(formattedDate);
      });
    }
  }

  Future<bool> permiso() async {
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
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        currentPosition = position;
        //getCurrentLocationAddress();
      });
    }).catchError((e) {
      print(e);
    });
  }
}
