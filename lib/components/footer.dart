import 'package:flutter/material.dart';
import 'package:vacas_front/ui/email_login_page.dart';

class bottom_navigation extends StatefulWidget {
  @override
  State<bottom_navigation> createState() => _bottom_navigationState();
}

class _bottom_navigationState extends State<bottom_navigation> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.black12),
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmailLoginPage()));
            },
            icon: Icon(
              Icons.add,
              color: Color.fromARGB(157, 157, 157, 157),
              size: 50,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          //color: Colors.black,
          child: BottomNavigationBar(
              showSelectedLabels: false,
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(
                      Icons.home,
                      color: index == 0
                          ? Colors.black
                          : Colors.grey.withOpacity(.6),
                    )),
                BottomNavigationBarItem(
                    label: "Shop",
                    icon: Icon(
                      Icons.person,
                      color: index == 1
                          ? Colors.black
                          : Colors.grey.withOpacity(.6),
                    )),
                BottomNavigationBarItem(
                    label: "Favourite",
                    icon: Icon(
                      Icons.poll,
                      color: index == 2
                          ? Colors.black
                          : Colors.grey.withOpacity(.6),
                    )),
                BottomNavigationBarItem(
                  label: "Favourite",
                  icon: Image.asset("assets/logofooter1.png"),
                  /*Icon(
                      Icons.notification_add,
                      color:
                          index == 3 ? Colors.orange : Colors.grey.withOpacity(.6),
                    )*/
                ),
              ]),
        ),
      ],
    );
  }
}
