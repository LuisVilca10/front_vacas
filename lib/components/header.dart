import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vacas_front/controllers/MenuAppController.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              //color: Colors.black,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1617737164424-bb12fad85e0c?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGNoaWNhJTIwbWV4aWNhbmF8ZW58MHx8MHx8fDA%3D'))),
          child: TextButton(
            child: Container(),
            onPressed: () {},
          ),
        ),
        Text(
          "Usuario Admin",
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
