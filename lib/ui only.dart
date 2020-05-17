import 'package:chat_app_example/FirebaseAuth.dart';
import 'package:chat_app_example/ImagePicker.dart';
import 'package:chat_app_example/chat/all_users_screen.dart';
import 'package:chat_app_example/chat/home_page.dart';
import 'package:chat_app_example/chat/startingChat.dart';
import 'package:chat_app_example/inbox.dart';
import 'package:chat_app_example/photosData.dart';
import 'package:chat_app_example/services/authservice.dart';
import 'package:chat_app_example/views/SignUpScreen.dart';
import 'package:chat_app_example/views/faceid.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter_xlider/flutter_xlider.dart';

import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path1;

import 'chat/chat_screen.dart';

class Connections extends StatefulWidget {
  @override
  _ConnectionsState createState() => _ConnectionsState();
}

class _ConnectionsState extends State<Connections> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return MyHome();}), ModalRoute.withName('/'));
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(height/40),
              child: Column(
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(alignment: Alignment.centerLeft,
                        child: Text(
                          "Connections",textAlign: TextAlign.start,
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
                            icon: Image(image: AssetImage('assets/images/sat.png'),),
                            iconSize: height/30,
                            onPressed: (){},
                          ),
                          IconButton(
                            icon: Image(image: AssetImage('assets/images/chart.png'),),
                            iconSize: height/30,
                            onPressed: (){},
                          ),
                          IconButton(
                            icon: Image(image: AssetImage('assets/images/trash.png'),),
                            iconSize: height/30,
                            onPressed: (){},
                          ),

                        ],
                      )
                    ],
                  ),
                  SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                ],
              ),
            ),
          ],
        )
    );
  }
}

class Liked extends StatefulWidget {
  @override
  _LikedState createState() => _LikedState();
}

class _LikedState extends State<Liked> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return MyHome();}), ModalRoute.withName('/'));
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(height/40),
              child: Column(
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(alignment: Alignment.centerLeft,
                        child: Text(
                          "Liked",textAlign: TextAlign.start,
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
                            icon: Image(image: AssetImage('assets/images/satsel.png'),),
                            iconSize: height/30,
                            onPressed: (){},
                          ),
                          IconButton(
                            icon: Image(image: AssetImage('assets/images/chart.png'),),
                            iconSize: height/30,
                            onPressed: (){
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Shortlisted();}), ModalRoute.withName('/'));
                            },
                          ),
                          IconButton(
                            icon: Image(image: AssetImage('assets/images/trash.png'),),
                            iconSize: height/30,
                            onPressed: (){
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Dismissed();}), ModalRoute.withName('/'));
                            },
                          ),

                        ],
                      )
                    ],
                  ),
                  SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                ],
              ),
            ),
          ],
        )
    );
  }
}

class Shortlisted extends StatefulWidget {
  @override
  _ShortlistedState createState() => _ShortlistedState();
}

class _ShortlistedState extends State<Shortlisted> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return MyHome();}), ModalRoute.withName('/'));
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(height/40),
              child: Column(
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(alignment: Alignment.centerLeft,
                        child: Text(
                          "Shortlisted",textAlign: TextAlign.start,
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
                            icon: Image(image: AssetImage('assets/images/sat.png'),),
                            iconSize: height/30,
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Liked();}), ModalRoute.withName('/'));
                            },
                          ),
                          IconButton(
                            icon: Image(image: AssetImage('assets/images/chartsel.png'),),
                            iconSize: height/30,
                            onPressed: (){},
                          ),
                          IconButton(
                            icon: Image(image: AssetImage('assets/images/trash.png'),),
                            iconSize: height/30,
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Dismissed();}), ModalRoute.withName('/'));
                            },
                          ),

                        ],
                      )
                    ],
                  ),
                  SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                ],
              ),
            ),
          ],
        )
    );
  }
}

class Dismissed extends StatefulWidget {
  @override
  _DismissedState createState() => _DismissedState();
}

class _DismissedState extends State<Dismissed> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return MyHome();}), ModalRoute.withName('/'));
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(height/40),
              child: Column(
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(alignment: Alignment.centerLeft,
                        child: Text(
                          "Dismissed",textAlign: TextAlign.start,
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
                            icon: Image(image: AssetImage('assets/images/sat.png'),),
                            iconSize: height/30,
                            onPressed: (){
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Liked();}), ModalRoute.withName('/'));
                            },
                          ),
                          IconButton(
                            icon: Image(image: AssetImage('assets/images/chart.png'),),
                            iconSize: height/30,
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Shortlisted();}), ModalRoute.withName('/'));
                            },
                          ),
                          IconButton(
                            icon: Image(image: AssetImage('assets/images/trashsel.png'),),
                            iconSize: height/30,
                            onPressed: (){},
                          ),

                        ],
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/a1.jpeg'),radius: width/6,
                      )
                    ],
                  ),SizedBox(height: height/40,),
                ],
              ),
            ),
          ],
        )
    );
  }
}

class Voicechat extends StatefulWidget {
  @override
  _VoicechatState createState() => _VoicechatState();
}

class _VoicechatState extends State<Voicechat> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.red,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return MyHome();}), ModalRoute.withName('/'));
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(height/30),
        child: GridTile(
          header: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Voice Inbox",textAlign: TextAlign.start,
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
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Voicechatgrid();}), ModalRoute.withName('/'));
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
          child: Padding(
            padding: EdgeInsets.only(top:height/30),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: ((context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                        NetworkImage(''),
                      ),
                      title: Text('XYZ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text('developer',
                          style: TextStyle(
                            color: Colors.grey,
                          )),
                      onTap: (() {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                )));
                      }),
                    ),
                    Divider(color: Colors.redAccent,thickness: 1,),
                  ],
                );

              }),
            ),
          ),
        ),
      ),
    );
  }
}

class Voicechatgrid extends StatefulWidget {
  @override
  _VoicechatgridState createState() => _VoicechatgridState();
}

class _VoicechatgridState extends State<Voicechatgrid> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.red,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return MyHome();}), ModalRoute.withName('/'));
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(height/30),
        child: GridTile(
          header: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Voice Inbox",textAlign: TextAlign.start,
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
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Voicechat();}), ModalRoute.withName('/'));
                      },
                  ),
                ],
              )
            ],
          ),
           child: ListView.builder(
          itemCount: 10,
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
                                image: NetworkImage(''),
                              ),
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Divider(color: Colors.redAccent,thickness: 1,),
                                Text('XYZ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('22,developer',
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
                                      )));
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
                                image: NetworkImage(''),
                              ),
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Divider(color: Colors.redAccent,thickness: 1,),
                                Text('XYZ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('22,developer',
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
                                      )));
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
        ),
      ),
    );
  }
}


class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  @override
  var gender = ["Select", "Male", 'Female', "Transgender"];
  var _lowerValue = 50;
  var  _upperValue = 180;



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return MyHome();}), ModalRoute.withName('/'));
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(height/30),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height/40,
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      "Preferences",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                        fontFamily: 'Poppins',
                        fontSize: 30,
                      ),
                    ),
                  ),SizedBox(
                    height: height/20,
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      "Interested in",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: height/32,
                          letterSpacing: 0, fontFamily: 'Poppins', color: Colors.grey[600]),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 375,
                      child: Theme(data: ThemeData(canvasColor: Colors.redAccent),
                        child: Card(
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: DropdownButton<String>(iconEnabledColor: Colors.white,
                                isExpanded: true,
                                items: gender.map((String drop) {
                                  return DropdownMenuItem<String>(
                                    value: drop,
                                    child: Text("  $drop",
                                      style: TextStyle(
                                          fontSize: height/35,
                                          fontFamily: 'Poppins2',
                                          color: Colors.white),
                                    ),
                                  );
                                }).toList(),
                                value: Gender.currentItem1,
                                onChanged: (String newValue) {
                                  setState(() {
                                    Gender.currentItem1 = newValue;

                                  });
                                }),
                          ),
                        ),
                      ),
                    ),
                  ),SizedBox(
                    height: height/20,
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      "Distance in km",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: height/32,
                          letterSpacing: 0, fontFamily: 'Poppins', color: Colors.grey[600]),
                    ),
                  ),
                  FlutterSlider(
                    values: [1, 100],
                    minimumDistance: 0,
                    rangeSlider: true,
                    max: 100,
                    min: 0,
                    rightHandler: FlutterSliderHandler(
                      child: Material(
                        type: MaterialType.canvas,
                        color: Colors.redAccent,
                        elevation: 0,
                        child: Icon(
                          Icons.remove_circle_outline,
                          size: 6,
                        ),
                      ),
                    ),
                    handler: FlutterSliderHandler(
                      child: Material(
                        type: MaterialType.canvas,
                        color: Colors.redAccent,
                        elevation: 0,
                        child: Icon(
                          Icons.remove_circle_outline,
                          size: 6,
                        ),
                      ),
                    ),
                    trackBar: FlutterSliderTrackBar(
                      inactiveTrackBar: BoxDecoration(
                        color: Colors.black,
                      ),
                      activeTrackBar: BoxDecoration(
                          color: Colors.redAccent),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      _lowerValue = lowerValue;
                      _upperValue = upperValue;
                      setState(() {});
                    },
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      "Age",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: height/32,
                          letterSpacing: 0, fontFamily: 'Poppins', color: Colors.grey[600]),
                    ),
                  ),
                  FlutterSlider(
                    values: [18, 50],
                    minimumDistance: 0,
                    rangeSlider: true,
                    max: 50,
                    min: 18,
                    rightHandler: FlutterSliderHandler(
                      child: Material(
                        type: MaterialType.canvas,
                        color: Colors.redAccent,
                        elevation: 0,
                        child: Icon(
                          Icons.remove_circle_outline,
                          size: 6,
                        ),
                      ),
                    ),
                    handler: FlutterSliderHandler(
                      child: Material(
                        type: MaterialType.canvas,
                        color: Colors.redAccent,
                        elevation: 0,
                        child: Icon(
                          Icons.remove_circle_outline,
                          size: 6,
                        ),
                      ),
                    ),
                    trackBar: FlutterSliderTrackBar(
                      inactiveTrackBar: BoxDecoration(
                        color: Colors.black,
                      ),
                      activeTrackBar: BoxDecoration(
                          color: Colors.redAccent),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      _lowerValue = lowerValue;
                      _upperValue = upperValue;
                      setState(() {});
                    },
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                        elevation: 0,
                        child: MaterialButton(
                          onPressed: () {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: height/20,
                          child: Text(
                            'Drink',
                            style: TextStyle(
                                fontFamily: "Poppins", color: Colors.white, fontSize: 20),
                          ),
                          splashColor: Colors.redAccent,
                          color: Colors.grey[400],
                          focusColor: Colors.redAccent,
                        ),
                      ),
                      Material(
                        elevation: 0,
                        child: MaterialButton(
                          onPressed: () {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: height/20,
                          child: Text(
                            'Smoke',
                            style: TextStyle(
                                fontFamily: "Poppins", color: Colors.white, fontSize: 20),
                          ),
                          splashColor: Colors.redAccent,
                          color: Colors.grey[400],
                          focusColor: Colors.redAccent,
                        ),
                      ),
                      Material(
                        elevation: 0,
                        child: MaterialButton(
                          onPressed: () {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: height/20,
                          child: Text(
                            'Drugs',
                            style: TextStyle(
                                fontFamily: "Poppins", color: Colors.white, fontSize: 20),
                          ),
                          splashColor: Colors.redAccent,
                          color: Colors.grey[400],
                          focusColor: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      "What are you looking from your date?",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: height/32,
                          letterSpacing: 0, fontFamily: 'Poppins', color: Colors.grey[600]),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Material(
                        elevation: 0,
                        child: MaterialButton(
                          onPressed: () {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: height/20,minWidth: 320,
                          child: Text(
                            'Relationship',
                            style: TextStyle(
                                fontFamily: "Poppins", color: Colors.white, fontSize: 20),
                          ),
                          splashColor: Colors.redAccent,
                          color: Colors.grey[400],
                          focusColor: Colors.redAccent,
                        ),
                      ),
                      Material(
                        elevation: 0,
                        child: MaterialButton(
                          onPressed: () {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: height/20,minWidth: 320,
                          child: Text(
                            'Something Casual',
                            style: TextStyle(
                                fontFamily: "Poppins", color: Colors.white, fontSize: 20),
                          ),
                          splashColor: Colors.redAccent,
                          color: Colors.grey[400],
                          focusColor: Colors.redAccent,
                        ),
                      ),
                      Material(
                        elevation: 0,
                        child: MaterialButton(
                          onPressed: () {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: height/20,minWidth: 320,
                          child: Text(
                            'Dont know yet',
                            style: TextStyle(
                                fontFamily: "Poppins", color: Colors.white, fontSize: 20),
                          ),
                          splashColor: Colors.redAccent,
                          color: Colors.grey[400],
                          focusColor: Colors.redAccent,
                        ),
                      ),
                      Material(
                        elevation: 0,
                        child: MaterialButton(
                          onPressed: () {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: height/20,minWidth: 320,
                          child: Text(
                            'Marriage',
                            style: TextStyle(
                                fontFamily: "Poppins", color: Colors.white, fontSize: 20),
                          ),
                          splashColor: Colors.redAccent,
                          color: Colors.grey[400],
                          focusColor: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height/20,
                  ),
                  Material(
                    elevation: 0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return MyHome();}), ModalRoute.withName('/'));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      height: 55.0,
                      minWidth: 320,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontFamily: "Poppins", color: Colors.white, fontSize: 20),
                      ),
                      splashColor: Colors.white,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}


class Credits extends StatefulWidget {
  @override
  _CreditsState createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.redAccent,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return MyHome();}), ModalRoute.withName('/'));
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(height/30),
        child: ListView(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(),
                Center(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(radius: height/8,
                        backgroundImage: AssetImage('assets/images/a4.jpeg'),
                      ),
                      Text('Xyz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: height/27),),
                      Text('Australia'),
                      Text('27,Bank manager'),
                    ],
                  ),
                ),
                Align(alignment: Alignment.centerRight,
                  child: Column(
                    children: <Widget>[
                      IconButton(onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Shortlisted();}), ModalRoute.withName('/'));
                      },
                        icon: Image(image: AssetImage('assets/images/configure.png'),),
                      ),
                      IconButton(onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Shortlisted();}), ModalRoute.withName('/'));
                      },
                        icon: Image(image: AssetImage('assets/images/profile.png'),),
                      ),
                      IconButton(onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Shortlisted();}), ModalRoute.withName('/'));
                      },
                        icon: Image(image: AssetImage('assets/images/pen.png'),),
                      ),
                      IconButton(onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Shortlisted();}), ModalRoute.withName('/'));
                      },
                        icon: Image(image: AssetImage('assets/images/lang.png'),),
                      ),
                    ],
                  ),
                )
              ],
            ),
           SizedBox(height: height/30,),
           Material(
             elevation: 0,
             child: MaterialButton(
               onPressed: () {

               },
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(40),
               ),
               height: height/20,minWidth: width/20,
               child: Text(
                 'Earn credits\nShare with friends',
                 style: TextStyle(
                     fontFamily: "Poppins", color: Colors.white, fontSize: height/35),
               ),
               color: Colors.redAccent,
             ),
           ),SizedBox(height: height/30,),
           Center(child: Text('Share the app with your friends.\nIf they register you will earn credits'
               ' \nandhave access to more profiles for free!',style: TextStyle(fontSize: height/40),)),
           SizedBox(height: height/30,),
          Material(
             elevation: 0,
             child: MaterialButton(
               onPressed: () {

               },
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(40),
               ),
               height: height/20,
               child: Text(
                 'Go premium\nView more profiles daily',
                 style: TextStyle(
                     fontFamily: "Poppins", color: Colors.white, fontSize: height/35),
               ),
               color: Colors.redAccent,
             ),
           ),SizedBox(height: height/30,),
           Material(
             elevation: 0,
             child: MaterialButton(
               onPressed: () {
                 AuthService().signOut();

                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));

                 },
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(40),
               ),
               height: height/10,
               child: Text(
                 'Log Out',
                 style: TextStyle(
                     fontFamily: "Poppins", color: Colors.white, fontSize: 20),
               ),
               color: Colors.redAccent,
             ),
           )
          ],
        ),
      ),
    );
  }
}








