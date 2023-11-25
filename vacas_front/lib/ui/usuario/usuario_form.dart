import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacas_front/animation/FadeAnimation.dart';
import 'package:vacas_front/apis/finca_api.dart';
import 'package:vacas_front/apis/persona_api.dart';
import 'package:vacas_front/apis/rol_api.dart';
import 'package:vacas_front/bloc/finca/finca_bloc.dart';
import 'package:vacas_front/componets/DropDownFormField.dart';
import 'package:vacas_front/modelo/FincaModelo.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacas_front/modelo/UsuarioModelo.dart';
import 'package:vacas_front/theme/AppTheme.dart';
import 'package:vacas_front/ui/finca/finca_main.dart';
import 'package:vacas_front/ui/usuario/usuario_main.dart';
import 'package:vacas_front/util/TokenUtil.dart';

class UsuarioForm extends StatefulWidget {
  @override
  _UsuarioFormState createState() => _UsuarioFormState();
}

class _UsuarioFormState extends State<UsuarioForm> {
  bool showProfileInfo = false;
  late String _nombreUsuario = "";
  late String _apellido = "";
  late String _telefono = "";
  String rolString = '0';

  TextEditingController _fecha = new TextEditingController();
  DateTime? selectedDate;

  //TextEditingController _horai = new TextEditingController();
  //TimeOfDay? selectedTime;

  late String _tipousuario = "";
  late String _password = "";
  late String _correo = "";
  late String _estado = "Activo";
  late String _offlinex = "Si";
  late String _perfil_prin = "Todo";

  Position? currentPosition;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  late String _dni = "";

  late String _userCreate;
  var _data = [];

  List<Map<String, String>> listaUser = [
    {'value': '0', 'display': 'Seleccionar'},
    {'value': '1', 'display': 'ROLE_ADMIN'},
    {'value': '2', 'display': 'ROLE_USER'},
    {'value': '3', 'display': 'ROLE_EMPLOYEE'},
  ];

  List<Map<String, String>> listapro = [
    {'value': 'PL', 'display': 'Producción Leche'},
    {'value': 'PC', 'display': 'Producción Carne'},
  ];

  @override
  void initState() {
    super.initState();
    _jalarrol();
  }

  late RolApi personapi;
  _jalarrol() async {
    setState(() {
      personapi = RolApi.create();
      Provider.of<RolApi>(context, listen: false)
          .getRol(TokenUtil.TOKEN)
          .then((value) {
        value.forEach((element) {
          listaUser.add({
            'value': element.id.toString(),
            'display': element.id.toString()
          });
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

  void capturaNombreUsuario(valor) {
    this._nombreUsuario = valor;
  }

  void capturaFecha(valor) {
    this._fecha.text = valor;
  }

  void capturaApellido(valor) {
    this._apellido = valor;
  }

  void capturaTelefono(valor) {
    this._telefono = valor;
  }

  void capturaTipoUsuario(valor) {
    this.rolString = valor;
  }

  void capturaMedidaLeche(valor) {
    this._password = valor;
  }

  void capturaCorreo(valor) {
    this._correo = valor;
  }

  void capturaDNI(valor) {
    this._dni = valor;
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
                        "Form. Reg. Usuario",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoNombre(
                          capturaNombreUsuario, "Nombre Completo:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoApellidoUsuario(
                          capturaApellido, "Apellidos Completo:"),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: _buildDatoNumber(capturaDNI, "DNI:"),
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
                      _buildDatoFecha(capturaFecha, "Fecha Nacimiento:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoCorreo(capturaCorreo, "Correo:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoPassword(capturaMedidaLeche, "Contraseña:"),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDatoLista(capturaTipoUsuario, rolString,
                          "Tipo de Usuario:", listaUser),
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
                                  UsuarioModelo mp =
                                      new UsuarioModelo.unlaunched();
                                  mp.nombres = _nombreUsuario;

                                  mp.apellidos = _apellido;
                                  mp.dni = _dni;

                                  mp.correo = _correo;
                                  //mp.fecha = DateFormat('yyyy-MM-dd').format(
                                  //   DateTime.parse(_fecha.value.text));
                                  mp.password = _password;
                                  mp.token = rolString;
                                  mp.telefono = _telefono;
                                  mp.perfilPrin = _perfil_prin;
                                  mp.offlinex = _offlinex;
                                  mp.estado = _estado;

                                  final prefs =
                                      await SharedPreferences.getInstance();

                                  var api = await Provider.of<PersonaApi>(
                                          context,
                                          listen: false)
                                      .crearUsuario(TokenUtil.TOKEN, mp);
                                  print("ver: ${api.toJson()}");
                                  if (api.toJson() != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainUser()),
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

  Widget _buildDatoTipoUser(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.person_2),
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

  Widget _buildDatoNombre(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.person_2),
        hintText: 'Ej: Juan Lucas',
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

  Widget _buildDatoCorreo(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.alternate_email_outlined),
        hintText: 'Ej: ejemplo@ejemplo.com',
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

  Widget _buildDatoPassword(Function obtValor, String label) {
    return TextFormField(
      obscureText: passwordVisible,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password),
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(
              () {
                passwordVisible = !passwordVisible;
              },
            );
          },
        ),
        labelText: label,
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

  Widget _buildDatoApellidoUsuario(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_2),
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
      controller: _fecha,
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
        _fecha.text = formattedDate;
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
