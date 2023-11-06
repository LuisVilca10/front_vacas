import 'package:flutter/material.dart';
import 'package:vacas_front/animation/FadeAnimation.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
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
            height: 10,
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
    );
  }
}
