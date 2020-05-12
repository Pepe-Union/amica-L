import 'dart:async';
import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../FirebaseAuth.dart';
import 'chat_screen.dart';

class AllUsersScreen extends StatefulWidget {
  _AllUsersScreenState createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  StreamSubscription<QuerySnapshot> _subscription;
  List<DocumentSnapshot> usersList;
  final CollectionReference _collectionReference =
      Firestore.instance.collection("users");

  @override
  void initState() {
    super.initState();
    _subscription = _collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        usersList = datasnapshot.documents;
        print("Users List ${usersList.length}");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace,color: Colors.redAccent,),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close,color: Colors.redAccent,),
              onPressed: () async {
                await firebaseAuth.signOut();
                await googleSignIn.disconnect();
                await googleSignIn.signOut();
                print("Signed Out");
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              },
            )
          ],
        ),
        body: usersList != null
            ? Container(
              child: ListView.builder(
                itemCount: usersList.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "Text Inbox",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: height/22,
                        ),
                      ),
                  ListTile(
                  leading: CircleAvatar(
                  backgroundImage:
                  NetworkImage(usersList[index].data['photoUrl']),
                  ),
                  title: Text(usersList[index].data['name'],
                  style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  )),
                  subtitle: Text(usersList[index].data['emailId'],
                  style: TextStyle(
                  color: Colors.grey,
                  )),
                  onTap: (() {
                  Navigator.push(
                  context,
                  new MaterialPageRoute(
                  builder: (context) => ChatScreen(
                  name: usersList[index].data['name'],
                  photoUrl: usersList[index].data['photoUrl'],
                  receiverUid:
                  usersList[index].data['uid'])));
                  }),
                  ),
                    ],
                  );

                }),
              ),
            )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
