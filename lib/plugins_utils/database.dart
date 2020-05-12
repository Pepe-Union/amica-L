import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  final String uid;
  DatabaseService(this.uid,);
  final CollectionReference amicaCollection = Firestore.instance.collection(
      'Amica');



  Future updateData(String long, String lat, String name, String gender,
      String interest)
  async {
    return await amicaCollection.document(uid).setData(
      {
        'long':long,
        'lat':lat,
        'name':name,
        'gender':gender,
        'interest':interest

      }
    );
  }
  List<Amica> _Amicalistfromsnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc){
      return Amica(doc.data['long']??'', doc.data['lat']??'', doc.data['name']??'', doc.data['gender']??'', doc.data['interest']??'');


    }).toList();
  }
  Stream<List<Amica>> get Amicas{
    return amicaCollection.snapshots().map(_Amicalistfromsnapshot);
  }

}
class Amica
{
  final String longitute;
  final String latitute;
  final String name;
  final String gender;
  final String interest;

  Amica(this.longitute, this.latitute, this.name, this.gender, this.interest);

}
class Amicalist extends StatefulWidget {
  @override
  _AmicalistState createState() => _AmicalistState();
}

class _AmicalistState extends State<Amicalist> {
  @override
  Widget build(BuildContext context) {
    final amicas=Provider.of<List<Amica>>(context);
    amicas.forEach((amica){
      print(amica.name);
      print(amica.interest);
      print(amica.latitute);
      print(amica.longitute);
      print(amica.gender);

    });
    return Container();
  }
}

