//import 'package:vacaspruebas/drawer/drawer_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:vacaspruebas/theme/AppTheme.dart';

class CustomAppBarX extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBarX({super.key, required this.accionx})
      : preferredSize = Size.fromHeight(50.0);

  Function accionx;

  @override
  final Size preferredSize;
  @override
  _CustomAppBarState createState() => _CustomAppBarState(accionx);
}

class _CustomAppBarState extends State<CustomAppBarX> {
  _CustomAppBarState(this.accionx);
  Function accionx;

  @override
  Widget build(BuildContext context) {
    int coloS = 0;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: AppTheme.useLightMode
              ? const Icon(
                  Icons.wb_sunny,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.wb_sunny,
                  color: Colors.yellow,
                ),
          onPressed: () {
            setState(() {
              AppTheme.useLightMode = !AppTheme.useLightMode;
              if (AppTheme.useLightMode == true) {
                AppTheme.themeDataLight = ThemeData(
                    useMaterial3: AppTheme.useMaterial3,
                    colorScheme:
                        AppTheme.colorOptionsShemeL[AppTheme.colorSelected]);
                AppTheme.colorMenu = Color(0xFF3A5160);
                if (AppTheme.useMaterial3 == false) {
                  AppTheme.colorMenu = Color(0xFFFEFEFE);
                }
              } else {
                AppTheme.themeDataDark = ThemeData(
                    useMaterial3: AppTheme.useMaterial3,
                    colorScheme:
                        AppTheme.colorOptionsShemeD[AppTheme.colorSelected]);
                AppTheme.colorMenu = Color(0xFFFEFEFE);
              }

              accionx();
            });
          },
          tooltip: "Toggle brightness",
        ),
        /* IconButton(
          icon: AppTheme.useMaterial3
              ? const Icon(
                  Icons.filter_3,
                  color: Colors.amber,
                )
              : const Icon(Icons.filter_2),
          onPressed: () {
            setState(() {
              AppTheme.useMaterial3 = !AppTheme.useMaterial3;
              if (AppTheme.useLightMode == true) {
                AppTheme.themeDataLight = ThemeData(
                    useMaterial3: AppTheme.useMaterial3,
                    colorScheme:
                        AppTheme.colorOptionsShemeL[AppTheme.colorSelected]);
                AppTheme.colorMenu = Color(0xFF3A5160);
                if (AppTheme.useMaterial3 == false) {
                  AppTheme.colorMenu = Color(0xFFFEFEFE);
                }
              } else {
                AppTheme.themeDataDark = ThemeData(
                    useMaterial3: AppTheme.useMaterial3,
                    colorScheme:
                        AppTheme.colorOptionsShemeD[AppTheme.colorSelected]);
                AppTheme.colorMenu = Color(0xFFFEFEFE);
              }
            });
            accionx();
          },
          tooltip: "Switch to Material ${AppTheme.useMaterial3 ? 2 : 3}",
        ),*/
      ],
    );
  }
}
