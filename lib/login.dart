import 'package:flutter/material.dart';
import 'package:vacas_front/animation/FadeAnimation.dart';
import 'package:vacas_front/pagina2ejemplo.dart';
import 'package:vacas_front/rem_pass.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  late TextEditingController _controller;
  late TextEditingController _controller2;
  @override
  void initState() {
    _controller = TextEditingController(text: '');
    _controller2 = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 241, 235, 235), // Color de fondo
        ),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FadeAnimation(
                1,
                Image.asset(
                  'assets/login.jpeg',
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
                          controller: _controller,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'ejemplo@ejemplo.com',
                              label: Text('Email')),
                          validator: (value) {
                            if (value == null || value.isEmpty || value == '') {
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
                            controller: _controller2,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                border: OutlineInputBorder(),
                                //hintText: '******',
                                label: Text('Contraseña')),
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
                            fontWeight: FontWeight.w600, fontSize: 18),
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
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SegundaPagina()));
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
        ),
      ),
    );
  }
}
