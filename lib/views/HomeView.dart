import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notebook/components/Header.dart';
import 'package:notebook/functions.dart';
import 'package:notebook/views/BulletinsView.dart';
import 'package:notebook/views/NotesView.dart';
import 'package:notebook/views/RelevesView.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String pageTitle = "Anciens bulletins";

  // Liste des bulletins
  List<Map> bulletins = [
    for (var i = 0; i < 50; i++)
      {'trimestre': 1, 'année': 3, 'année-scolaire': '2020 - 2021'},
  ];
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = getScreenSize(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.green[800],
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header
          Header(pageTitle: pageTitle),
          SizedBox(
            width: screenSize[0],
            height: screenSize[1] / 1.2,
            child: PageView(
              onPageChanged: (pageNumber) {
                print('Page $pageNumber');
                    setState(() {
                switch (pageNumber) {
                  case 0:
                      pageTitle = "Anciens bulletins";
                    break;
                    case 1:
                      pageTitle = "Relevé";
                      break;
                    case 2:
                      pageTitle = "Les notes";
                      break;
                  default:
                }
                    });
              },
              children: const [
                // Liste des bulletins
                BulletinsView(),
                // Liste des relevés
                RelevesView(),
                // Liste des notes
                NotesView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
