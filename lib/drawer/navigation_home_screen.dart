import 'package:vacaspruebas/theme/AppTheme.dart';
import 'package:vacaspruebas/drawer/drawer_user_controller.dart';
import 'package:vacaspruebas/drawer/home_drawer.dart';
import 'package:vacaspruebas/ui/finca/finca_form.dart';
import 'package:vacaspruebas/ui/finca/finca_main.dart';
//import 'package:asistencia_app/ui/actividad/actividad_main.dart';
//import 'package:asistencia_app/ui/actividadb/actividad_main.dart';
//import 'package:asistencia_app/ui/actividadfire/actividad_main.dart';
import 'package:vacaspruebas/ui/help_screen.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;
  bool showProfileInfo = true;

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
            screenIndex: drawerIndex!,

            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView!,
            drawerIsOpen: (bool) {},

            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = MainFinca(); //MainPersona()
        });
        if (drawerIndex == DrawerIndex.FINCAADD) {
          screenView = FincaForm();
        }
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          // screenView = MainActividadB();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          //  screenView = MainActividadBFire();
        });
      } else {
        //do in your way......
      }
    }
  }
}
