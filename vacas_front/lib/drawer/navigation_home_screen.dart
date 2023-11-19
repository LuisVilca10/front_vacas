import 'package:vacas_front/theme/AppTheme.dart';
import 'package:vacas_front/drawer/drawer_user_controller.dart';
import 'package:vacas_front/drawer/home_drawer.dart';
import 'package:vacas_front/ui/finca/finca_main.dart';
//import 'package:vacas_front/ui/fincadb/finca_main.dart';
//import 'package:asistencia_app/ui/actividadb/actividad_main.dart';
//import 'package:asistencia_app/ui/actividadfire/actividad_main.dart';
import 'package:vacas_front/ui/help_screen.dart';
import 'package:flutter/material.dart';
import 'package:vacas_front/ui/usuario/usuario_main.dart';
import 'package:vacas_front/ui/vacas/vaca_main.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = HelpScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: AppTheme.themeData.primaryColor,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.themeData.primaryColor,
          //appBar: CustomAppBar(accionx: accion as Function),
          body: DrawerUserController(
            screenIndex: drawerIndex!!,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView!!,
            drawerIsOpen: (bool) {},
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      // drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = MainFinca(); //MainPersona()
        });
      } else if (drawerIndex == DrawerIndex.USER) {
        setState(() {
          screenView = MainUser();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = MainVaca();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = HelpScreen();
        });
      } else {
        //do in your way......
      }
    }
  }
}
