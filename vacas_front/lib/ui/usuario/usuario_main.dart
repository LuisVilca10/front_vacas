import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacas_front/animation/FadeAnimation.dart';
import 'package:vacas_front/apis/finca_api.dart';
import 'package:vacas_front/apis/persona_api.dart';
import 'package:vacas_front/apis/usuario_api.dart';
import 'package:vacas_front/componets/TabItem.dart';
import 'package:vacas_front/modelo/FincaModelo.dart';
import 'package:vacas_front/modelo/UsuarioModelo.dart';
import 'package:vacas_front/theme/AppTheme.dart';
import 'package:vacas_front/ui/analitica/analitica_main.dart';
import 'package:vacas_front/ui/finca/finca_main.dart';
import 'package:vacas_front/ui/help_screen.dart';
import 'package:vacas_front/ui/usuario/usuario_edit.dart';
import 'package:vacas_front/ui/usuario/usuario_form.dart';
import 'package:vacas_front/ui/vacas/vaca_main.dart';
import 'package:vacas_front/util/TokenUtil.dart';
//por un momento

class MainUser extends StatelessWidget {
  const MainUser({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PersonaApi>(
          create: (_) => PersonaApi.create(),
        ),
        // Provider<AsistenciapaApi>(create: (_) => AsistenciapaApi.create(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
        theme: AppTheme.themeDataLight,
        darkTheme: AppTheme.themeDataDark,
        home: UsuarioUI(),
      ),
    );
  }
}

class UsuarioUI extends StatefulWidget {
  @override
  _UsuarioUIState createState() => _UsuarioUIState();
}

class _UsuarioUIState extends State<UsuarioUI> {
  Future onGoBack(dynamic value) async {
    setState(() {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.themeDataLight,
      darkTheme: AppTheme.themeDataDark,
      home: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: FutureBuilder<List<UsuarioModelo>>(
          future: Provider.of<PersonaApi>(context, listen: true)
              .getUsuario(TokenUtil.TOKEN)
              .then((value) => value),
          builder: (BuildContext context,
              AsyncSnapshot<List<UsuarioModelo>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<UsuarioModelo> persona = snapshot.data!!;
              print(persona.length);
              return _buillistView(context, persona);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        bottomNavigationBar: _buildBottomTab1(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UsuarioForm()),
            );
          },
          backgroundColor: Colors.grey.shade500,
          child: Icon(Icons.add, size: 35),
        ),
      ),
    );
  }

  Widget _buillistView(BuildContext context, List<UsuarioModelo> persona) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Column(
        children: [
          SizedBox(
            height: 3,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 40,
                    width: double.infinity,
                    child: FadeAnimation(
                        0.5,
                        TextField(
                          cursorColor: Color.fromARGB(124, 124, 124, 124),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black54,
                              size: 30,
                            ),
                            hintText: "Search",
                            fillColor: Color.fromARGB(217, 217, 217, 217),
                            filled: true,
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ))),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    FadeAnimation(
                      0.5,
                      Text(
                        "Usuarios",
                        style:
                            TextStyle(color:Colors.black, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              UsuarioModelo personax = persona[index];
              return Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: FadeAnimation(
                    0.5,
                    Card(
                      child: Container(
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.darkColorSchemeBlue.onSurfaceVariant,
                        ),
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                                title: Row(
                                  children: [
                                    Container(
                                      child: Text(personax.nombres,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    )
                                  ],
                                ),
                                subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: AppTheme.themeData
                                                .colorScheme.primaryContainer),
                                        child: Text(
                                          personax.apellidos,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: AppTheme.themeData
                                                .colorScheme.primaryContainer),
                                        child: Text(
                                          //personax.asistenciaxs.isEmpty? personax.evaluar:personax.asistenciaxs.first.horaReg,
                                          personax.estado,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ]),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/imagen/man-icon.png"),
                                ),
                                trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Expanded(
                                                child: IconButton(
                                                    icon: Icon(Icons.edit),
                                                    iconSize: 24,
                                                    padding: EdgeInsets.zero,
                                                    constraints:
                                                        BoxConstraints(),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                UsuarioFormEdit(
                                                                  modelU:
                                                                      personax,
                                                                )),
                                                      );
                                                    })),
                                            Expanded(
                                                child: IconButton(
                                                    icon: Icon(Icons.delete),
                                                    iconSize: 24,
                                                    padding: EdgeInsets.zero,
                                                    constraints:
                                                        BoxConstraints(),
                                                    //color: AppTheme.themeData.colorScheme.inversePrimary,
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          barrierDismissible:
                                                              true,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  "Mensaje de confirmacion"),
                                                              content: Text(
                                                                  "Desea Eliminar?"),
                                                              actions: [
                                                                FloatingActionButton(
                                                                  child: const Text(
                                                                      'CANCEL'),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(
                                                                            'Failure');
                                                                  },
                                                                ),
                                                                FloatingActionButton(
                                                                    child: const Text(
                                                                        'ACCEPT'),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(
                                                                              'Success');
                                                                    })
                                                              ],
                                                            );
                                                          }).then((value) {
                                                        if (value.toString() ==
                                                            "Success") {
                                                          print("personax.id");
                                                          Provider.of<PersonaApi>(
                                                                  context,
                                                                  listen: false)
                                                              .deleteUsuario(
                                                                  TokenUtil
                                                                      .TOKEN,
                                                                  personax.id)
                                                              .then((value) =>
                                                                  onGoBack(
                                                                      value));
                                                          //var onGoBack = onGoBack;
                                                          //BlocProvider.of<ProductosBloc>(context).add(DeleteProductoEvent(producto: state.productosList[index]));
                                                        }
                                                      });
                                                    }))
                                          ],
                                        ),
                                      ),
                                    ])),
                          ],
                        ),
                      ),
                    ),
                  ));
            },
            itemCount: persona.length,
          ))
        ],
      ),
    );
  }

  int selectedPosition = 0;
  final tabs = ['Finca', 'Usuarios', 'Vacas', 'Informe'];
  _buildBottomTab1() {
    return BottomAppBar(
      //color: AppTheme.themeData.colorScheme.primaryContainer,

      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TabItem(
            icon: Icons.home,
            text: tabs[0],
            isSelected: selectedPosition == 0,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainFinca();
              }));
            },
          ),
          TabItem(
            icon: Icons.person,
            text: tabs[1],
            isSelected: selectedPosition == 1,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainUser();
              }));
            },
          ),
          TabItem(
            text: tabs[2],
            icon: Icons.help,
            isSelected: selectedPosition == 2,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainVaca();
              }));
            },
          ),
          TabItem(
            text: tabs[3],
            icon: Icons.assignment,
            isSelected: selectedPosition == 3,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainAnalitic();
              }));
            },
          ),
        ],
      ),
    );
  }
}
