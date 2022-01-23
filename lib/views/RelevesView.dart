import 'package:flutter/material.dart';
import 'package:notebook/functions.dart';

class RelevesView extends StatefulWidget {
  const RelevesView({Key? key}) : super(key: key);

  @override
  _RelevesViewState createState() => _RelevesViewState();
}

class _RelevesViewState extends State<RelevesView> {
  // Liste des releves
  List<Map> releves = [
    //for (var i = 0; i < 20; i++)
      //{'trimestre': 1, 'année': 3, 'année-scolaire': '2020 - 2021'},
  ];
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = getScreenSize(context);
    return releves.isEmpty ? Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
                  "Le relevé de notes sera publié à partir du 27/02/22",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.sms_rounded, size: screenSize[0] / 1.5, color: Colors.green.withOpacity(0.5),),
    ],),) : SizedBox(
      height: screenSize[1] / 1.2,
      //color: Colors.red,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Container(
          width: screenSize[0],
          height: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        itemCount: releves.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            print('Bulletin');
          },
          leading: Icon(
            Icons.picture_as_pdf_rounded,
            color: Colors.green[800],
          ),
          title: Text(
            "Bulletin de notes - Trimestre ${releves[index]['trimestre']} - ${releves[index]['année']}A",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "${releves[index]['année-scolaire']}",
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
