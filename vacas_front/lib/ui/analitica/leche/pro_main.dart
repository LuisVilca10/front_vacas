import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vacas_front/animation/FadeAnimation.dart';
import 'package:vacas_front/apis/finca_api.dart';
import 'package:vacas_front/apis/proleche_api.dart';
import 'package:vacas_front/apis/vaca_api.dart';
import 'package:vacas_front/componets/TabItem.dart';
import 'package:vacas_front/modelo/FincaModelo.dart';
import 'package:vacas_front/modelo/ProLecheModelo.dart';
import 'package:vacas_front/modelo/VacaModelo.dart';
import 'package:vacas_front/theme/AppTheme.dart';
import 'package:vacas_front/ui/analitica/analitica_main.dart';
import 'package:vacas_front/ui/analitica/leche/pro_edit.dart';
import 'package:vacas_front/ui/analitica/leche/pro_form.dart';
import 'package:vacas_front/ui/finca/finca_form.dart';
import 'package:vacas_front/ui/finca/finca_main.dart';
import 'package:vacas_front/ui/help_screen.dart';
import 'package:vacas_front/ui/usuario/usuario_main.dart';
import 'package:vacas_front/ui/vacas/vaca_main.dart';
import 'package:vacas_front/ui/vacas/vacas_form.dart';
import 'package:vacas_front/util/TokenUtil.dart';

class MainProLeche extends StatelessWidget {
  const MainProLeche({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProLecheApi>(
          create: (_) => ProLecheApi.create(),
        ),
        Provider<VacaApi>(
          create: (_) => VacaApi.create(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
        theme: AppTheme.themeDataLight,
        darkTheme: AppTheme.themeDataDark,
        home: ProLecheUI(),
      ),
    );
  }
}

class ProLecheUI extends StatefulWidget {
  @override
  _ProLecheUIState createState() => _ProLecheUIState();
}

class _ProLecheUIState extends State<ProLecheUI> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var api;

  @override
  void initState() {
    super.initState();
    //apiService = ApiCovid();
    //api=Provider.of<PredictionApi>(context, listen: false).getPrediction();
    print("entro aquixxx");
  }

  final GlobalKey<AnimatedFloatingActionButtonState> key =
      GlobalKey<AnimatedFloatingActionButtonState>();

  String text = 'ProLeche';
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
          body: FutureBuilder<List<ProLecheRespModelo>>(
            future: Provider.of<ProLecheApi>(context, listen: true)
                .getProLeche(TokenUtil.TOKEN)
                .then((value) => value),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProLecheRespModelo>> snapshot) {
              print(snapshot.error);
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<ProLecheRespModelo> persona = snapshot.data!!;
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
                MaterialPageRoute(builder: (context) => ProLecheForm()),
              );
            },
            backgroundColor: Colors.grey.shade400,
            child: Icon(Icons.add, size: 35),
          )),
    );
  }

  Widget _buildListView(
      BuildContext context, List<ProLecheRespModelo> persona) {
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
                        const Text(
                          "Producción leche",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 30),
                          textAlign: TextAlign.center,
                        ))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                        0.5,
                        const Text(
                          "Producción",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        )),
                    FadeAnimation(
                        0.5,
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 0.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Total hoy:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "data",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Total hoy:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "data",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Total hoy:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "data",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                FadeAnimation(
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
                    )),
              ],
            ),
          ),
          FadeAnimation(
            0.5,
            Expanded(
              child: Card(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text("Fecha Ordeño")),
                      DataColumn(label: Text("Finca")),
                      DataColumn(
                        label: Text("Nombre Vaca"),
                      ),
                      DataColumn(label: Text("Nro Arerte")),
                      DataColumn(label: Text("Cantidad Leche")),
                      DataColumn(label: Text("Calidad")),
                      DataColumn(label: Text("Observaciones")),
                    ],
                    rows: List.generate(
                      persona.length,
                      (index) {
                        ProLecheRespModelo personax = persona[index];
                        return DataRow(
                          selected: true,
                          cells: [
                            DataCell(
                              Row(
                                children: [
                                  Text(personax.fechaRegistro),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Mensaje de confirmacion"),
                                                content:
                                                    Text("Desea Eliminar?"),
                                                actions: [
                                                  FloatingActionButton(
                                                    child: const Text('CANCEL'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop('Failure');
                                                    },
                                                  ),
                                                  FloatingActionButton(
                                                      child:
                                                          const Text('ACCEPT'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop('Success');
                                                      })
                                                ],
                                              );
                                            }).then((value) {
                                          if (value.toString() == "Success") {
                                            print(personax.id);
                                            Provider.of<ProLecheApi>(context,
                                                    listen: false)
                                                .deleteProLeche(TokenUtil.TOKEN,
                                                    personax.id)
                                                .then(
                                                    (value) => onGoBack(value));
                                            //var onGoBack = onGoBack;
                                            //BlocProvider.of<ProductosBloc>(context).add(DeleteProductoEvent(producto: state.productosList[index]));
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProLecheFormEdit(
                                                      modelP: personax)),
                                        );
                                      },
                                      icon: Icon(Icons.edit))
                                ],
                              ),
                            ),
                            DataCell(
                              Text(personax.vacaId.fincaId.nombreFinca),
                            ),
                            DataCell(
                              Text(personax.vacaId.nombreVaca),
                            ),
                            DataCell(
                              Text(personax.vacaId.noArete),
                            ),
                            DataCell(
                              Text(personax.cantidadLeche),
                            ),
                            DataCell(
                              Text(personax.calidadLeche),
                            ),
                            DataCell(
                              Text(personax.observaciones),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      //},
      //itemCount: persona.length,
      // ),
    );
  }

  int selectedPosition = 0;
  final tabs = ['Finca', 'Usuarios', 'Vacas', 'Estadisticas'];

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
}
