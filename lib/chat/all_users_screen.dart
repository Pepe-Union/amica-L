import 'dart:async';
import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
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
            ? Padding(
              padding: EdgeInsets.all(height/30),
              child: GridTile(
                header: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft,
                      child: Text(
                        "Text Inbox",textAlign: TextAlign.start,
                        style: TextStyle(
                          letterSpacing: 0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: height/27,
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Image(image: AssetImage('assets/images/grid.png'),),
                          iconSize: height/30,
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return AllusersGridview();}), ModalRoute.withName('/'));
                            },
                        ),
                        IconButton(
                          icon: Image(image: AssetImage('assets/images/listsel.png'),),
                          iconSize: height/30,
                          onPressed: (){},
                        ),
                      ],
                    )
                  ],
                ),
                child: ListView.builder(
                  itemCount: usersList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: height/20),
                      child: Column(
                        children: <Widget>[

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
                          Divider(color: Colors.redAccent,thickness: 1,),
                        ],
                      ),
                    );

                  }),
                ),
              )
            )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}

class AllusersGridview extends StatefulWidget {
  @override
  _AllusersGridviewState createState() => _AllusersGridviewState();
}

class _AllusersGridviewState extends State<AllusersGridview> {
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
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
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
            ? Padding(
              padding:EdgeInsets.all(height/30),
              child: GridTile(
                header: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft,
                      child: Text(
                        "Text Inbox",textAlign: TextAlign.start,
                        style: TextStyle(
                          letterSpacing: 0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: height/27,
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Image(image: AssetImage('assets/images/gridsel.png'),),
                          iconSize: height/30,
                          onPressed: (){},
                        ),
                        IconButton(
                          icon: Image(image: AssetImage('assets/images/list.png'),),
                          iconSize: height/30,
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return AllUsersScreen();}), ModalRoute.withName('/'));
                            },
                        ),
                      ],
                    )
                  ],
                ),
                child: ListView.builder(
                  itemCount: usersList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(top:height/20),
                      child: Column(
                        children: <Widget>[

                          SizedBox(height: height/30,),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(color: Colors.redAccent, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: ListTile(
                                    title: Card(color: Colors.grey[200],
                                      child: Image(
                                        image: NetworkImage(usersList[index].data['photoUrl']),
                                      ),
                                    ),
                                    subtitle: Column(
                                      children: <Widget>[
                                        Divider(color: Colors.redAccent,thickness: 1,),
                                        Text(usersList[index].data['name'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(usersList[index].data['emailId'],
                                            style: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
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
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(color: Colors.redAccent, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: ListTile(
                                    title: Card(color: Colors.grey[200],
                                      child: Image(
                                        image: NetworkImage(usersList[index].data['photoUrl']),
                                      ),
                                    ),
                                    subtitle: Column(
                                      children: <Widget>[
                                        Divider(color: Colors.redAccent,thickness: 1,),
                                        Text(usersList[index].data['name'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(usersList[index].data['emailId'],
                                            style: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
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
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );

                  }),
                ),
              )
            )
            : Center(
          child: CircularProgressIndicator(),
        ));
  }
}
