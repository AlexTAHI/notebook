import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notebook/functions.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Liste des bulletins
  List<Map> bulletins = [
    for (var i = 0; i < 50; i++)
      {'trimestre': 1, 'année': 3, 'année-scolaire': '2020 - 2021'},
  ];
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = getScreenSize(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.green[800],
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                            child: const Icon(Icons.person,
                                color: Colors.white, size: 40),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "PARENT Fanny",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              "Anciens bulletins",
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
              ),
              // Liste des bulletins
              SizedBox(
                height: screenSize[1] / 1.2,
                //color: Colors.red,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => Container(
                    width: screenSize[0],
                    height: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  itemCount: bulletins.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      print('Bulletin');
                    },
                    leading: Icon(
                      Icons.picture_as_pdf_rounded,
                      color: Colors.green[800],
                    ),
                    title: Text(
                      "Bulletin de notes - Trimestre ${bulletins[index]['trimestre']} - ${bulletins[index]['année']}A",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${bulletins[index]['année-scolaire']}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
