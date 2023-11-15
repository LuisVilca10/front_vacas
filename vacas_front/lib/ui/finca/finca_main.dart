import 'dart:io';

//import 'package:asistencia_app/modelo/AsistenciapaxModelo.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacas_front/animation/FadeAnimation.dart';
import 'package:vacas_front/apis/finca_api.dart';
import 'package:vacas_front/componets/TabItem.dart';
import 'package:vacas_front/modelo/FincaModelo.dart';
import 'package:vacas_front/theme/AppTheme.dart';
//import 'package:vacas_front/ui/email_login_page.dart';
import 'package:vacas_front/ui/finca/MyAppState.dart';
import 'package:vacas_front/ui/finca/finca_edit.dart';
import 'package:vacas_front/ui/finca/finca_form.dart';
import 'package:vacas_front/ui/usuario/usuario_main.dart';
import 'package:vacas_front/ui/vacas/vaca_main.dart';
//import 'package:vacas_front/ui/finca/finca_form.dart';
import 'package:vacas_front/util/TokenUtil.dart';
import '../help_screen.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:intl/intl.dart';

class MainFinca extends StatelessWidget {
  const MainFinca({super.key});

  @override
  Widget build(BuildContext context) {
    /*return Provider<ActividadApi>(
      create: (_) => ActividadApi.create(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
        theme: AppTheme.themeData,
        home: ActividadUI(),
      ),
    );*/
    return MultiProvider(
      providers: [
        Provider<FincaApi>(
          create: (_) => FincaApi.create(),
        ),
        // Provider<AsistenciapaApi>(create: (_) => AsistenciapaApi.create(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
        theme: AppTheme.themeDataLight,
        darkTheme: AppTheme.themeDataDark,
        home: FincaUI(),
      ),
    );
  }
}

class FincaUI extends StatefulWidget {
  @override
  _FincaUIState createState() => _FincaUIState();
}

class _FincaUIState extends State<FincaUI> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var api;

  @override
  void initState() {
    super.initState();
    //apiService = ApiCovid();
    //api=Provider.of<PredictionApi>(context, listen: false).getPrediction();
    print("entro aqui");
  }

  final GlobalKey<AnimatedFloatingActionButtonState> key =
      GlobalKey<AnimatedFloatingActionButtonState>();

  String text = 'Finca';
  String subject = '';
  List<String> imageNames = [];
  List<String> imagePaths = [];

  Future onGoBack(dynamic value) async {
    setState(() {
      print(value);
    });
  }

  void accion() {
    setState(() {});
  }

  void accion2() {
    setState(() {
      print("Holaas");
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
          backgroundColor: AppTheme.nearlyWhite,
          body: FutureBuilder<List<FincaModelo>>(
            future: Provider.of<FincaApi>(context, listen: true)
                .getFinca(TokenUtil.TOKEN)
                .then((value) => value),
            builder: (BuildContext context,
                AsyncSnapshot<List<FincaModelo>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<FincaModelo> persona = snapshot.data!!;
                print(persona.length);
                return _buildListView(context, persona);
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
                MaterialPageRoute(builder: (context) => FincaForm()),
              );
            },
            backgroundColor: Colors.grey.shade400,
            child: Icon(Icons.add, size: 35),
          )),
    );
  }

  Widget _buildListView(BuildContext context, List<FincaModelo> persona) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      // child: ListView.builder(
      //   itemBuilder: (context, index) {
      //     FincaModelo personax = persona[index];
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
                        "Mis Fincas",
                        style: TextStyle(color: Colors.black, fontSize: 20),
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
              FincaModelo personax = persona[index];
              return Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: FadeAnimation(
                    0.5,
                    Container(
                      height: 130,
                      padding: EdgeInsets.all(5.0),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/imagen/fondo.jpeg")),
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(217, 217, 217, 217),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(personax.nombreFinca,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              Text(personax.telefono,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HelpScreen()),
                                  ).then(onGoBack);
                                },
                                child: Text(
                                  "Editar",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              Text("Mensaje de confirmacion"),
                                          content: Text("Desea Eliminar?"),
                                          actions: [
                                            FloatingActionButton(
                                              child: const Text('CANCEL'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop('Failure');
                                              },
                                            ),
                                            FloatingActionButton(
                                                child: const Text('ACCEPT'),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop('Success');
                                                })
                                          ],
                                        );
                                      }).then((value) {
                                    if (value.toString() == "Success") {
                                      print(personax.id);
                                      Provider.of<FincaApi>(context,
                                              listen: false)
                                          .deleteFinca(
                                              TokenUtil.TOKEN, personax.id)
                                          .then((value) => onGoBack(value));
                                      //var onGoBack = onGoBack;
                                      //BlocProvider.of<ProductosBloc>(context).add(DeleteProductoEvent(producto: state.productosList[index]));
                                    }
                                  });
                                },
                                child: Text(
                                  "Eliminar", // a futuro "ver"
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
            },
            itemCount: persona.length,
          ))
        ],
      ),
      //},
      //itemCount: persona.length,
      // ),
    );
  }

  int selectedPosition = 0;
  final tabs = ['Finca', 'Usuarios', 'Vacas', 'Settings'];

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
              setState(() {
                selectedPosition = 0;
              });
              /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HelpScreen();
              }));*/
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
            icon: Icons.settings,
            isSelected: selectedPosition == 3,
            onTap: () {
              setState(() {
                selectedPosition = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  _buildshearch() {
    return BottomAppBar(
      //color: AppTheme.themeData.colorScheme.primaryContainer,

      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TabItem(
            icon: Icons.menu,
            text: tabs[0],
            isSelected: selectedPosition == 0,
            onTap: () {
              setState(() {
                selectedPosition = 0;
              });
              /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HelpScreen();
              }));*/
            },
          ),
          TabItem(
            icon: Icons.person,
            text: tabs[1],
            isSelected: selectedPosition == 1,
            onTap: () {
              setState(() {
                selectedPosition = 1;
              });
            },
          ),
          TabItem(
            text: tabs[2],
            icon: Icons.help,
            isSelected: selectedPosition == 2,
            onTap: () {
              setState(() {
                selectedPosition = 2;
              });
            },
          ),
          TabItem(
            text: tabs[3],
            icon: Icons.settings,
            isSelected: selectedPosition == 3,
            onTap: () {
              setState(() {
                selectedPosition = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget add() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          key.currentState?.closeFABs();
        },
        heroTag: Text("Image"),
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget image() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        heroTag: Text("Image"),
        tooltip: 'Image',
        child: Icon(Icons.image),
      ),
    );
  }

  Widget inbox() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        heroTag: Text("Inbox"),
        tooltip: 'Inbox',
        child: Icon(Icons.inbox),
      ),
    );
  }
/*
  void exportAsistenciaToExcel(List<AsistenciapaxModelo> asistencia) {
    // Crear un nuevo archivo Excel
    var excel = Excel.createExcel();
    // Crear una nueva hoja en el archivo Excel
    Sheet sheetObject = excel['Asistencia'];
    // Escribir los encabezados de columna en la primera fila
    List<String> headers = ['Código', 'Fecha', 'Activiad','Hora'];
    for (var col = 0; col < headers.length; col++) {
      CellIndex cellIndex =
      CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0);
      sheetObject.cell(cellIndex).value = headers[col];
    }

    // Escribir los datos de asistencia en las filas siguientes
    for (var row = 0; row < asistencia.length; row++) {
      AsistenciapaxModelo asistenciax = asistencia[row];
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row + 1))
          .value = asistenciax.cui;
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: row + 1))
          .value = asistenciax.fecha;
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: row + 1))
          .value = asistenciax.actividad.nombreActividad;
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: row + 1))
          .value = asistenciax.horaReg;
    }

    // Guardar el archivo Excel en el sistema de archivos
    saveExcel(excel, 'asistencia.xlsx');
  }

  Future<void> saveExcel(Excel excel, String fileName) async {
    try {
      var bytes = excel.encode();
      var dir = await getExternalStorageDirectory();

      if (dir != null) {
        print('Directorio de almacenamiento externo: ${dir.path}');
        var nonbreakable='${DateTime.now().toIso8601String()}-$fileName';

        var file = File('${dir.path}/$nonbreakable');

        if (!await dir.exists()) {
          await dir.create(recursive: true);
        }

        await file.writeAsBytes(bytes!); // Conversión explícita para asegurar que bytes no sea nulo

        imagePaths.add(file.path);
        imageNames.add(nonbreakable);
        print('Archivo guardado correctamente en: ${file.path}');
      } else {
        print('No se pudo obtener el directorio de almacenamiento externo');
      }
    } catch (e) {
      print('Error al guardar el archivo Excel: $e');
    }
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    if (imagePaths.isNotEmpty) {
      final files = <XFile>[];
      for (var i = 0; i < imagePaths.length; i++) {
        files.add(XFile(imagePaths[i], name: imageNames[i]));
      }
      await Share.shareXFiles(files,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }*/
}
