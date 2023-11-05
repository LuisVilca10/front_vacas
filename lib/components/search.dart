import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 40,
            width: 350,
            child: TextField(
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
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Text(
              "Mis Fincas",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
