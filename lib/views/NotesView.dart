import 'package:flutter/material.dart';
import 'package:notebook/functions.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  _NotesViewState createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  // Liste des bulletins
  List<Map> notes = [
    for (var i = 0; i < 20; i++)
      {'matière': 'FRANCAIS', 'note': 14.5},
  ];
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = getScreenSize(context);
    return SizedBox(
      height: screenSize[1] / 1.2,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Container(
          width: screenSize[0],
          height: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        itemCount: notes.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            print('Note');
          },
          minLeadingWidth: 5,
          leading: Container(
            width: 5, height: screenSize[1],
            color: Colors.green,
          ),
          title: Text(
            notes[index]['matière'],
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'le 9 février (Moy. classe : 11.72)',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey.withOpacity(0.5),
                ),
          ),
          trailing: Text(
            notes[index]['note'].toString(),
            style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.5), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
