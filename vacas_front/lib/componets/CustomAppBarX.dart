import 'package:vacas_front/drawer/drawer_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:vacas_front/theme/AppTheme.dart';

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
          color: Colors.black,
          icon: AppTheme.useLightMode
              ? const Icon(Icons.wb_sunny_outlined)
              : const Icon(Icons.wb_sunny),
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
      ],
    );
  }
}
