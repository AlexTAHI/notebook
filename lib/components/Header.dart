import 'package:flutter/material.dart';
import 'package:notebook/functions.dart';

class Header extends StatefulWidget {
  final String pageTitle;
  const Header({Key? key, this.pageTitle = 'Anciens bulletins',}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = getScreenSize(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      width: screenSize[0],
      height: 120,
      decoration: BoxDecoration(
          color: Colors.green[800],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print('Profil');
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green[900],
                  child:
                      const Icon(Icons.person, color: Colors.white, size: 40),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "PARENT Fanny",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    widget.pageTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    print('Home');
                  },
                  iconSize: 30,
                  icon: const Icon(
                    Icons.home_rounded,
                    color: Colors.white,
                  )),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    onPressed: () {
                      print('Menu');
                    },
                    iconSize: 30,
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.yellow[600],
                    child: Text(
                      '3',
                      style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
