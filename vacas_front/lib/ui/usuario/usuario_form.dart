import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacas_front/animation/FadeAnimation.dart';
import 'package:vacas_front/apis/finca_api.dart';
import 'package:vacas_front/bloc/finca/finca_bloc.dart';
import 'package:vacas_front/componets/DropDownFormField.dart';
import 'package:vacas_front/modelo/FincaModelo.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacas_front/theme/AppTheme.dart';
import 'package:vacas_front/ui/finca/finca_main.dart';
import 'package:vacas_front/util/TokenUtil.dart';

class UsuarioForm extends StatefulWidget {
  @override
  _UsuarioFormState createState() => _UsuarioFormState();

}

class _UsuarioFormState extends State<UsuarioForm> {
  bool showProfileInfo = false;
  late String _nombreFinca = "";
  late String _area = "";
  late String _telefono = "";

  TextEditingController _fecha = new TextEditingController();
  //DateTime? selectedDate;

  //TextEditingController _horai = new TextEditingController();
  //TimeOfDay? selectedTime;

  late String _proposito = "";
  late String _meleche = "B";
  late String _usario = "";

  Position? currentPosition;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  late String _medida = "H";

  late String _userCreate;
  var _data = [];

  /*List<Map<String, String>> listaUser = [
    {'value': 'PF', 'display': 'Producción Juan'},
    {'value': 'MC', 'display': 'Producción Micaela'},
  ];*/
  List<Map<String, String>> listapro = [
    {'value': 'PL', 'display': 'Producción Leche'},
    {'value': 'PC', 'display': 'Producción Carne'},
  ];

  List<Map<String, String>> listaMedi = [
    {'value': 'H', 'display': 'Hectáreas'},
    {'value': 'F', 'display': 'Fanegadas'},
    {'value': 'C', 'display': 'Cuadras'},
    {'value': 'M^2', 'display': 'Metros Cuadrados'},
    {'value': 'MA', 'display': 'Manzana'}
  ];
  List<Map<String, String>> listaMele = [
    {'value': 'B', 'display': 'Botella'},
    {'value': 'L', 'display': 'Litro'},
    {'value': 'G', 'display': 'Galón'},
  ];

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );

  void capturaNombreFinca(valor) {
    this._nombreFinca = valor;
  }

  void capturaArea(valor) {
    this._area = valor;
  }

  void capturaTelefono(valor) {
    this._telefono = valor;
  }

  void capturaProposito(valor) {
    this._proposito = valor;
  }

  void capturaMedidaLeche(valor) {
    this._meleche = valor;
  }

  void capturaUsuario(valor) {
    this._usario = valor;
  }

  void capturaMedida(valor) {
    this._medida = valor;
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
                        "Form. Reg. Finca",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoNombreFinca(
                          capturaNombreFinca, "Nombre Finca:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoNumber(capturaArea, "Area total Finca"),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: _buildDatoLista(
                                capturaMedida, _medida, "Medida:", listaMedi),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: _buildDatoPhone(capturaTelefono, "Celular:"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoLista(
                          capturaProposito, _proposito, "Proposito:", listapro),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoNombreFinca(capturaUsuario, "Usuario:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoLista(capturaMedidaLeche, _meleche,
                          "Medida de leche:", listaMele),
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
                                  FincaModelo mp = new FincaModelo.unlaunched();
                                  mp.nombreFinca = _nombreFinca;
                                  //print(DateFormat('yyyy-MM-dd').format(currentTime));
                                  mp.telefono = _telefono;
                                  //mp.are = _horai.value.text;
                                  // mp.latitud = _minToler.value.text;
                                  mp.latitud =
                                      currentPosition!.latitude.toString();
                                  mp.longitud =
                                      currentPosition!.longitude.toString();
                                  mp.are = _area;
                                  mp.rol = _proposito;
                                  mp.medida = _medida;

                                  //mp.rol = _evaluar;
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  //mp.userCreate =
                                  //   "${prefs.getString('usernameLogin')}";
                                  //  mp.asistenciaxs = [];
                                  //   mp.mater = _materiales;
                                  //  // mp.validInsc = _validarInsc;
                                  //   mp.asisSubact = _asisSubAct;
                                  //   mp.entsal = _entSal;
                                  //   mp.offlinex = _offlienex;

                                  //print("NA:${_nombreFinca}, E:${_telefono}, "
                                  //   "F:${_fecha.value.text}  "
                                  //   "La: ${currentPosition!.latitude}, Lo:${currentPosition!.longitude} ");
                                  //"U:${prefs.getString('usernameLogin')} EV:${_evaluar}"

                                  var api = await Provider.of<FincaApi>(context,
                                          listen: false)
                                      .crearFinca(TokenUtil.TOKEN, mp);
                                  print("ver: ${api.toJson()}");
                                  if (api.toJson() != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainFinca()),
                                    );
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
                                  }
                                  // BlocProvider.of<FincaBloc>(context)
                                  //     .add(CreateFincaEvent(mp));
                                  // Navigator.pop(context, () {
                                  //   //setState(() {});
                                  // });
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

  Widget _buildDatoNombreFinca(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
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

  Widget _buildDatoNumber(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Area es campo Requerido';
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

  /*Future<void> _selectDate(BuildContext context, Function obtValor) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        obtValor(selectedDate.toString());
      });
    }
  }*/

  /*Widget _buildDatoFecha(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: _fecha,
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
  }*/

  /*Future<void> _selectTime(BuildContext context, Function obtValor) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        });
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        obtValor(
            "${(selectedTime!.hour) < 10 ? "0" + (selectedTime!.hour).toString() : selectedTime!.hour}:${(selectedTime!.minute) < 10 ? "0" + (selectedTime!.minute).toString() : selectedTime!.minute}:00");
        //_horai.text="${selectedTime!.hour}:${selectedTime!.minute}";
      });
    }
  }*/

  /* Widget _buildDatoHora(Function obtValor, Function capControl, String label) {
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
  }*/

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
