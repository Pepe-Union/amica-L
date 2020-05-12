//matching card
import 'package:chat_app_example/ImagePicker.dart';
import 'package:chat_app_example/chat/all_users_screen.dart';
import 'package:chat_app_example/chat/home_page.dart';
import 'package:chat_app_example/chat/startingChat.dart';
import 'package:chat_app_example/inbox.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore

import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path1;
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    MyApp(),
    MyHomePage(),
    VoiceUpload()
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              title: Image(image: AssetImage('assets/images/chat0.png'),height: height/8,),
              icon: Icon(Icons.call,color: Colors.transparent,size:0 ,)
          ),
          BottomNavigationBarItem(
              title: Image(image: AssetImage('assets/images/music.png'),height: height/8,),
              icon: Icon(Icons.call,color: Colors.transparent,size:0 ,)
          ),
          BottomNavigationBarItem(
              title: Image(image: AssetImage('assets/images/mic.png'),height: height/8,),
              icon: Icon(Icons.call,color: Colors.transparent,size:0 ,)
          ),



        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}






class MatchCard {
  int redColor = 0;
  int greenColor = 0;
  int blueColor = 0;
  double margin = 0;

  MatchCard(int red, int green, int blue, double marginTop) {
    redColor = red;
    greenColor = green;
    blueColor = blue;
    margin = marginTop;
  }
}

class MyHomePage extends StatefulWidget {
  static const String id = "Cards";

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> cardList;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardList = _getMatchCard();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.redAccent,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
            color: Colors.red,
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding:EdgeInsets.only(left: width/12,right: width/12),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(height: height/15,width: width/6,
                        child: Card(shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                          child: Image(
                            image: AssetImage("assets/images/a1.jpeg"),
                          ),
                        ),
                      ),
                      Container(height: height/15,width: width/6,
                        child: Card(shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                          child: Image(
                            image: AssetImage("assets/images/a1.jpeg"),
                          ),
                        ),
                      ),
                      Container(height: height/15,width: width/6,
                        child: Card(shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                          child: Image(
                            image: AssetImage("assets/images/a1.jpeg"),
                          ),
                        ),
                      ),
                      Container(height: height/15,width: width/6,
                        child: Card(shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                          child: Image(
                            image: AssetImage("assets/images/a1.jpeg"),
                          ),
                        ),
                      ),
                      Container(height: height/15,width: width/6,
                        child: Card(shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                          child: Image(
                            image: AssetImage("assets/images/a1.jpeg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: height/2,width: width,
                  child: Center(
                    child: Stack(
                      children: cardList,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width/10,right: width/10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Name\nDist',style: TextStyle(fontSize: height/40,fontWeight: FontWeight.bold),),
                      IconButton(
                        icon: Icon(Icons.share,color: Colors.redAccent,),
                        onPressed: (){},
                      )
                    ],

                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(height: height/12,width: width/6,
                      child: Card(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                        child: Image(
                          image: AssetImage("assets/images/rewind.png"),
                        ),
                      ),
                    ), SizedBox(width: width/20,),
                    Container(height: height/12,width: width/6,
                      child: Card(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                        child: Image(
                          image: AssetImage("assets/images/chart.png"),
                        ),
                      ),
                    ),SizedBox(width: width/20,),
                    Container(height: height/12,width: width/6,
                      child: Card(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                        child: Image(
                          image: AssetImage("assets/images/sat.png"),
                        ),
                      ),
                    ),SizedBox(width: width/20,),
                    Container(height: height/12,width: width/6,
                      child: Card(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                        child: Image(
                          image: AssetImage("assets/images/trash.png"),
                        ),
                      ),
                    ),SizedBox(width: width/20,),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }

  List<Widget> _getMatchCard() {
    final data = [
      {"title": "abhishek", "pic": "assets/images/a1.jpeg"},
      {"title": "Aman", "pic": "assets/images/a2.jpeg"},
      {"title": "rahul", "pic": "assets/images/a3.jpeg"},
      {"title": "Cuisine", "pic": "assets/images/a4.jpeg"},
      {'title': "Desserts", "pic": "assets/images/a5.jpeg"},
      {"title": "Chicken Items", "pic": "assets/images/a6.jpeg"},
      {"title": "Thai Food", "pic": "assets/images/a7.jpeg"},
      {"title": "sea Food", "pic": "assets/images/a9.jpeg"},
      {"title": "Fast Foods", "pic": "assets/images/a11.jpeg"},
      {"title": "Shushi", "pic": "assets/images/a14.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica1.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica2.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica3.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica4.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica5.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica6.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica7.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica8.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica9.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica10.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica11.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica12.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica13.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica14.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica14.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/a18.jpeg1"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica18.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/a17.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/a15.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica16.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica18.jpeg"},
      {"title": "GYM Freak Food", "pic": "assets/images/Amica19.jpeg"},



    ];

    List<MatchCard> cards = new List();
    for (int i = 0; i < data.length; i++) {
      cards.add(MatchCard(255, i, i - 1, 0));
    }
    List<Widget> cardList = new List();

    for (int x = 0; x < data.length; x++) {
      cardList.add(Positioned(
          top: 40,
          child: Draggable(
            onDragEnd: (drag) {
              if (drag.offset.direction > 1) {
                print("Swipe left");
              } else {
                print("Swipe right");
              }
              _removeCard(x);
            },
            childWhenDragging: Container(
              child: Text("Swiped",style: TextStyle(fontFamily: "Poppins2",fontSize: 30,color: Colors.red),),
            ),
            feedback: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(),
                child: Image.asset(
                  data[x]["pic"],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            child: Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  width: 340,
                  height: 500,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    data[x + 1]["pic"],
                    fit: BoxFit.cover,
                  ),
                )),
          )));
    }
    return cardList;
  }
}

//otp

//homeScreen

class customButton extends StatelessWidget {
  final VoidCallback call;
  final String text;

  @override
  customButton({this.text, this.call});

  Widget build(BuildContext context) {
    return Container(
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(15),
        shape: RoundedRectangleBorder(),
        child: MaterialButton(
          onPressed: call,
          height: 45.0,
          minWidth: 200,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
          ),
        ),
      ),
    );
  }
}
// Image upload
class ImageUpload extends StatefulWidget {
  static const String id = "imageupload";

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

void clear() {}

class _ImageUploadState extends State<ImageUpload> {
  File _imageFile;
  var _image;
  List<Face> _faces;
  bool isLoading = false;


  _getImageAndDetectFaces() async {
    final imageFile = await ImagePicker.pickImage(
        source: ImageSource.camera
    );
    setState(() {
      isLoading = true;
    });
    final image = FirebaseVisionImage.fromFile(imageFile);
    final faceDetector = FirebaseVision.instance.faceDetector(
        FaceDetectorOptions(
            mode: FaceDetectorMode.fast,
            enableLandmarks: true
        )
    );
    List<Face> faces = await faceDetector.processImage(image);
    if (mounted) {
      setState(() {
        _imageFile = imageFile;
        _faces = faces;
        _loadImage(imageFile);
      });
    }
  }

  _loadImage(File file) async {
    final data = await file.readAsBytes();
    await decodeImageFromList(data).then(
          (value) => setState(() {
        _image = value;
        isLoading = false;
      }),
    );
  }
  static String _uploadedFileURL = "";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(elevation: 0,
        title: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.red,
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      body: Builder(
        builder: (context) => SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height/25,
              ),
              Padding(
                padding: EdgeInsets.only(top: height/20, right: height/4),
                child: Text(
                  "Verification",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 35,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20, left: width/60),
                child: Text(
                  " Click a photo from your selfie camera to get verified and\n proceed further. ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontFamily: 'Poppins1',
                      color: Colors.black),
                ),
              ),
              SizedBox(height: height/20,),
              Align(
                alignment: Alignment.center,
                child: Container(height: height/4,width: width/1.4,
                  child: FlatButton(
                      child: Image(
                        image: AssetImage('assets/images/cam1.png'),
                      ),
                      onPressed: () {
                        _getImageAndDetectFaces;

                      }
                  ),
                ),
              ),
              SizedBox(height: height/20,),
              Text(
                " Click on the icon to take a selfie. ",
                textAlign: TextAlign.left,
                style: TextStyle(
                    letterSpacing: 0,
                    fontFamily: 'Poppins1',
                    color: Colors.black),
              ),
              Padding(
                padding:  EdgeInsets.all(height/40),
                child: Text(
                  " * This picture will only be used for verification purposes by\n    the admin.\n"
                      "   You can add other photos for public viewing once you \n   have been verified ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontFamily: 'Poppins1',
                      color: Colors.black),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}






class Selfie extends StatelessWidget {
  static const String id = "selfie";
  String url='';
  Selfie({this.url});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(elevation: 0,
        title: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.red,
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      body: Builder(

        builder: (context) => Container(
          child: Column(
            children: <Widget>[

              SizedBox(
                height: height/25,
              ),
              Padding(
                padding: EdgeInsets.only( right: width/3),
                child: Text(
                  "Confirm Selfie",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                    fontFamily: 'Poppins',
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(
                height: height/16,
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: width/3.2,
                  backgroundColor: Colors.grey[400],
                  child: ClipOval(
                    child: new SizedBox(
                        width: 250.0,
                        height: 180.0,

                        //need to change here
                        child: url!= null
                            ? Container(
                          height: 150,
                          width: 120,
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Container(
                          child:
                          Image.asset(''),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: height/8,
              ),
              Material(
                elevation: 0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Upload.id);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  height: height/12,minWidth: width/1.3,
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: height/35),
                  ),
                  splashColor: Colors.redAccent,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VoiceUpload extends StatefulWidget {
  static const String id = "voiceupload";
  @override
  _VoiceUploadState createState() => _VoiceUploadState();
}


class _VoiceUploadState extends State<VoiceUpload> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.red,
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      body: Builder(
        builder: (context)=>SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height/20,
              ),
              Padding(
                padding: EdgeInsets.only(left: width/40,right: width/4),
                child: Text(
                  "Voice Description",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: height/22,
                  ),
                ),
              ),
              SizedBox(height: height/15,),
              Align(
                alignment: Alignment.center,
                child: Container(height: height/4,width: width/1.4,
                  child: FlatButton(
                      child: Image(
                        image: AssetImage('assets/images/mic.png'),
                      ),
                      onPressed: () {}),
                ),
              ),
              SizedBox(height: height/20,),
              Text(
                " Click on the icon to record your description.. ",
                textAlign: TextAlign.left,
                style: TextStyle(
                    letterSpacing: 0,
                    fontFamily: 'Poppins1',
                    color: Colors.black),
              ),
              Text(
                " * Time Limit-****** ",
                textAlign: TextAlign.left,
                style: TextStyle(
                    letterSpacing: 0,
                    fontFamily: 'Poppins1',
                    color: Colors.black),
              ),
              Padding(
                padding:  EdgeInsets.all(height/40),
                child: Text(
                  " Don’t want to use your voice?\n"
                      "      Slide to text description. ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontFamily: 'Poppins1',
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Voice extends StatefulWidget {
  static const String id = "voice";
  @override
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(elevation: 0,
          title: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.red,
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
        ),
        body: Builder(

          builder: (context) => Container(
            child: Column(
                children: <Widget>[

                  SizedBox(
                    height: height/20,
                  ),
                  Padding(
                    padding: EdgeInsets.only( right: width/3),
                    child: Text(
                      "Voice Description",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                        fontFamily: 'Poppins',
                        fontSize: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height/16,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(height: height/4,width: width/1.4,
                      child: FlatButton(
                          child: Image(
                            image: AssetImage('assets/images/tick.png'),
                          ),
                          onPressed: () {}),
                    ),
                  ),
                  SizedBox(
                    height: height/16,
                  ),
                  Text(
                    "Audio Uploaded!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        letterSpacing: 0,
                        fontFamily: 'Poppins1',
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: height/8,
                  ),
                  Material(
                    elevation: 0,
                    child: MaterialButton(
                      onPressed: () {
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      height: height/12,minWidth: width/1.3,
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: height/35),
                      ),
                      splashColor: Colors.redAccent,
                      color: Colors.redAccent,
                    ),
                  ),
                ]),
          ),
        ));
  }
}

class TextDesc extends StatefulWidget {
  @override
  _TextDescState createState() => _TextDescState();
}

class _TextDescState extends State<TextDesc> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(elevation: 0,
          title: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.red,
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
        ),
        body: Builder(

          builder: (context) => Container(
            child: Column(
                children: <Widget>[

                  SizedBox(
                    height: height/8,
                  ),
                  Padding(
                    padding: EdgeInsets.only( right: width/3),
                    child: Text(
                      "Text Description",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                        fontFamily: 'Poppins',
                        fontSize: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height/16,
                  ),
                  Theme(
                    data: new ThemeData(
                      primaryColor: Colors.redAccent,
                    ),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.redAccent)
                        ),
                        labelText: 'click here',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height/16,
                  ),
                  Material(
                    elevation: 0,
                    child: MaterialButton(
                      onPressed: () {
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      height: height/12,minWidth: width/1.3,
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: height/35),
                      ),
                      splashColor: Colors.redAccent,
                      color: Colors.redAccent,
                    ),
                  ),
                ]),
          ),
        ));
  }
}

