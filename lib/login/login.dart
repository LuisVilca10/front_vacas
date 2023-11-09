import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacaspruebas/animation/FadeAnimation.dart';
import 'package:vacaspruebas/apis/usuario_api.dart';
import 'package:vacaspruebas/drawer/navigation_home_screen.dart';
import 'package:vacaspruebas/modelo/UsuarioModelo.dart';
import 'package:vacaspruebas/util/TokenUtil.dart';

class MainLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<UsuarioApi>(
      create: (_) => UsuarioApi.create(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  late TextEditingController _controller;
  late TextEditingController _controller2;
  var tokenx;

  bool passwordVisible = false;
  @override
  void initState() {
    _controller = TextEditingController(text: '');
    _controller2 = TextEditingController(text: '');
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpeg'), // Imagen de fondo
            fit: BoxFit.cover, // Ajuste de la imagen
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    elevation: 5,
                    color: const Color.fromARGB(249, 249, 249, 249)
                        .withOpacity(0.4),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              FadeAnimation(
                                1,
                                Image.asset(
                                  'assets/login.png',
                                ),
                              ),
                              FadeAnimation(
                                  1,
                                  const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              Form(
                                key: _formkey,
                                child: Column(
                                  children: [
                                    FadeAnimation(
                                      1.2,
                                      TextFormField(
                                          cursorColor: Colors.black,
                                          controller: _controller,
                                          decoration: const InputDecoration(
                                              filled: true,
                                              prefixIcon: Icon(
                                                Icons.email,
                                                color: Colors.black,
                                              ),
                                              border: OutlineInputBorder(),
                                              hintText: 'ejemplo@ejemplo.com',
                                              label: Text('Email'),
                                              labelStyle: TextStyle(
                                                  color: Colors.black)),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value == '') {
                                              return 'El correo es obligatorio';
                                            }
                                            return null;
                                          }),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    FadeAnimation(
                                        1.3,
                                        TextFormField(
                                            cursorColor: Colors.black,
                                            obscureText: passwordVisible,
                                            controller: _controller2,
                                            decoration: InputDecoration(
                                              filled: true,
                                              prefixIcon: Icon(
                                                Icons.password,
                                                color: Colors.black,
                                              ),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.black,
                                                ),
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      passwordVisible =
                                                          !passwordVisible;
                                                    },
                                                  );
                                                },
                                              ),
                                              border: OutlineInputBorder(),
                                              //hintText: '******',
                                              label: Text('Contraseña'),
                                              labelStyle: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty ||
                                                  value == '') {
                                                return 'La contraseña es obligatorio';
                                              }
                                              return null;
                                            }))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              FadeAnimation(
                                  1.5,
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Olvidaste tu contraseña?"),
                                      Text(
                                        "Recordar",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              FadeAnimation(
                                1.4,
                                MaterialButton(
                                  minWidth: double.infinity,
                                  height: 60,
                                  onPressed: () async {
                                    if (_formkey.currentState!.validate()) {
                                      /* Navigator.push(
                                          context,
                                         MaterialPageRoute(
                                              builder: (context) =>
                                                  NavigationHomeScreen()));*/
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      final api = Provider.of<UsuarioApi>(
                                          context,
                                          listen: false);
                                      final user = UsuarioModelo.login(
                                          _controller.text, _controller2.text);
                                      bool ingreso = false;
                                      api.login(user).then((value) {
                                        tokenx = "Bearer " + value.token;
                                        prefs.setString("token", tokenx);
                                        TokenUtil.TOKEN = tokenx;
                                        ingreso = true;
                                        if (ingreso == true) {
                                          prefs.setString("usernameLogin",
                                              _controller.text);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NavigationHomeScreen()));
                                        }
                                      }).catchError((onError) {
                                        print(onError.toString());
                                      });
                                    }
                                  },
                                  color: Colors.grey.shade700,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    "Iniciar Sección",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
