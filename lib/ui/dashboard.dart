import 'package:flutter/material.dart';
import 'package:vacas_front/animation/FadeAnimation.dart';
import 'package:vacas_front/components/footer.dart';
import 'package:vacas_front/components/search.dart';
import 'package:vacas_front/components/header.dart';
import 'package:vacas_front/components/fincascard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom_navigation(),
      body: SingleChildScrollView(
        primary: false,
        child: Container(
          width: double.infinity,
          child: const Column(
            children: [
              Header(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Search(),
                        FincasCard(),
                        FincasCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
