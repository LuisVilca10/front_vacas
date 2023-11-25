import 'package:flutter/material.dart';

import 'package:vacas_front/animation/FadeAnimation.dart';

import 'package:vacas_front/componets/TabItem.dart';
import 'package:vacas_front/theme/AppTheme.dart';

import 'package:vacas_front/ui/analitica/leche/pro_main.dart';

import 'package:vacas_front/ui/analitica/salud/salud_main.dart';
import 'package:vacas_front/ui/finca/finca_main.dart';

import 'package:vacas_front/ui/usuario/usuario_main.dart';
import 'package:vacas_front/ui/vacas/vaca_main.dart';

class MainAnalitic extends StatelessWidget {
  const MainAnalitic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.themeDataLight,
      darkTheme: AppTheme.themeDataDark,
      home: AnaliticUI(),
    );
  }
}

class AnaliticUI extends StatefulWidget {
  @override
  _AnaliticUIState createState() => _AnaliticUIState();
}

class _AnaliticUIState extends State<AnaliticUI> {
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
        body: _buildListView(),
        bottomNavigationBar: _buildBottomTab1(),
      ),
    );
  }

  Widget _buildListView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      // child: ListView.builder(
      //   itemBuilder: (context, index) {
      //     FincaModelo personax = persona[index];
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 43,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    FadeAnimation(
                      0.5,
                      Text(
                        "Reportes",
                        style:
                            TextStyle(color: AppTheme.colorMenu, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 0),
              child: FadeAnimation(
                0.5,
                Container(
                  height: 150,
                  padding: EdgeInsets.all(5.0),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.colorMenu,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Produccion de leche",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            Row(
                              children: [
                                Text("Total:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("0 botellas",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Total Ayer:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("0 botellas",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Promedio diario:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("0 botellas",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: 30,
                              child: Image.asset("assets/imagen/leche.png")),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainProLeche()),
                              );
                            },
                            child: Text(
                              "Ver", // a futuro "ver"
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 0),
              child: FadeAnimation(
                0.5,
                Container(
                  height: 150,
                  padding: EdgeInsets.all(5.0),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.colorMenu,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Salud Vaca",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            Row(
                              children: [
                                Text("Gasto:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("0 soles",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Total gasto mes:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("0 soles",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Promedio gasto:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("0 botellas",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: 75,
                              child: Image.asset("assets/imagen/corazon.png")),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainSaludVaca()),
                              );
                            },
                            child: Text(
                              "Ver", // a futuro "ver"
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
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

  /*Widget add() {
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
  }*/

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
