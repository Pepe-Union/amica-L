import 'dart:async';
import 'package:chat_app_example/FirebaseAuth.dart';
import 'package:chat_app_example/plugins_utils/database.dart';
import 'package:chat_app_example/views/faceid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../inbox.dart';
import '../photosData.dart';
class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.redAccent,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 45.0,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontFamily: "Poppins1"),
          ),
        ),
      ),
    );
  }
}

class Registration extends StatefulWidget {
  static const String id = "REGISTRATION";
  static String email;
  static String password;


  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  static String email;
  static String password;
  String username;
  String phone;
  var flag;

  String _longitute = "";
  String _latitute="";

  void _getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _longitute = "${position.longitude}";
      _latitute="${position.latitude}";
    });

  }

  FirebaseAuth auth=FirebaseAuth.instance;

  Future < FirebaseUser > signUp(email, password) async {
    try {
      AuthResult res = await auth.createUserWithEmailAndPassword(email: email, password: password);

      assert(res.user != null);
      assert(await res.user.getIdToken() != null);
      return res.user;
    } catch (e) {
      print(e);
      return null;
    }

  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(height/30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: height/20,
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: height/27,
                      ),
                    ),
                  ),SizedBox(
                    height: height/20,
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      "Name",
                      style: TextStyle(
                          letterSpacing: 0,
                          fontSize: height/32,
                          fontFamily: 'Poppins1',
                          color: Colors.grey[600]),
                    ),
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: TextField(
                      keyboardType: TextInputType.text,cursorColor: Colors.redAccent,
                      onChanged: (value) => username = value,
                      decoration: InputDecoration(focusColor: Colors.redAccent,
                          hintText: "Ab C",
                          hintStyle:
                          TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),SizedBox(
                    height: height/20,
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Address",
                      style: TextStyle(
                          letterSpacing: 0,
                          fontSize: height/32,
                          fontFamily: 'Poppins1',
                          color: Colors.grey[600]),
                    ),
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: TextField(cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.text,
                      onChanged: (value) => email = value,
                      decoration: InputDecoration(focusColor: Colors.redAccent,
                          hintText: "abc@email.com",
                          hintStyle:
                          TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),SizedBox(
                    height: height/20,
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                          letterSpacing: 0,
                          fontSize: height/32,
                          fontFamily: 'Poppins1',
                          color: Colors.grey[600]),
                    ),
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: TextField(cursorColor: Colors.redAccent,
                      autocorrect: false,
                      obscureText: true,
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(focusColor: Colors.redAccent,
                          hintText: "Password",
                          hintStyle:
                          TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),SizedBox(
                    height: height/20,
                  ),
                  CustomButton(
                    text: "Continue",
                    callback: () async {

                      await signUp(email, password);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Imformation(),
                        ),
                      );

                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )

    );
  }
}

class Login extends StatefulWidget {
  static const String id = "LOGIN";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {

    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final FirebaseUser user = result.user;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Imformation(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
    body: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(height/30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: height/20,
              ),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Log in with Email address",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: height/27,
                  ),
                ),
              ),SizedBox(
                height: height/20,
              ),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(
                      letterSpacing: 0,
                      fontSize: height/32,
                      fontFamily: 'Poppins1',
                      color: Colors.grey[600]),
                ),
              ),
              Align(alignment: Alignment.centerLeft,
                child: TextField(cursorColor: Colors.redAccent,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => email = value,
                  decoration: InputDecoration(focusColor: Colors.redAccent,
                    hintText: 'abc@email.com',
                  ),
                ),
              ),SizedBox(
                height: height/20,
              ),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  textAlign: TextAlign.left,

                  style: TextStyle(
                      letterSpacing: 0,
                      fontFamily: 'Poppins1',
                      fontSize: height/32,
                      color: Colors.grey[600]),
                ),
              ),
              Align(alignment: Alignment.centerLeft,
                child: TextField(cursorColor: Colors.redAccent,
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => password = value,
                  decoration: InputDecoration(focusColor: Colors.redAccent,
                    hintText: "Password",
                  ),
                ),
              ),
              Align(alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontFamily: 'Poppins1',
                      color: Colors.black,
                      fontSize: 15),
                ),
              ),SizedBox(
                height: height/20,
              ),
              CustomButton(
                text: "Continue",
                callback: () async {
                  await loginUser();
                },
              ),SizedBox(
                height: height/20,
              ),
              Align(alignment: Alignment.center,
                child: Text(
                  "New user?",
                  style: TextStyle(
                      letterSpacing: 0,
                      fontSize: height/32,
                      fontFamily: 'Poppins1',
                      color: Colors.grey[600]),
                ),
              ),
              CustomButton(
                text: "Sign Up",
                callback: () {
                  Navigator.of(context).pushNamed(Registration.id);
                },
              )
            ],
          ),
        ),
      ],
    )
    );
  }
}

class Gender extends StatefulWidget {
  static const String id="gender";
  static var currentItem = 'Select';
  static var currentItem1="Select";
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  var gender = ["Select", "Male", 'Female', "Transgender"];


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
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Imformation();}), ModalRoute.withName('/'));
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
                height: height/20,
              ),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Gender Details",
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
                  "Your Gender",
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
                  "Intrested in",
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
                            value: Gender.currentItem,
                            onChanged: (String newValue) {
                              setState(() {
                                Gender.currentItem= newValue;

                              });
                            }),
                      ),
                    ),
                  ),
                ),
              ), SizedBox(
                height: height/15,
              ),
              Material(
                elevation: 0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return FacePage();}), ModalRoute.withName('/'));
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
class Imformation extends StatefulWidget {
  static final String id="ufo";
  @override
  _ImformationState createState() => _ImformationState();
}

class _ImformationState extends State<Imformation> {
  String email;
  String name;
  String phone;
  String dob;
  String city;
  String state;
  String country;

  Color a=Colors.redAccent;

  String _longitute = "";
  String _latitute="";
  final DocumentReference documentReference =
  Firestore.instance.document("user/info");
  void _add() {
    Map<String, String> data = <String, String>{
      "email": email,
      "name": name,
      'dob': dob,
      'city':city,
      'state':state,
      'country':country,
      'phone':phone,
      'long':_longitute,
      'lat':_latitute
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }


  @override
  void _getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _longitute = "${position.longitude}";
      _latitute="${position.latitude}";
    });


  }
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
            },
          ),
          backgroundColor: Colors.white,
        ),
    body: ListView(
      children: <Widget>[
        SafeArea(
          child:Padding(
            padding: EdgeInsets.all(height/30),
            child: Column(
              children: <Widget>[
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    "Profile details",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: height/25,
                    ),
                  ),
                ),
                SizedBox(height: height/30,),
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    "Email Address",
                    style: TextStyle(
                        letterSpacing: 0,
                        fontFamily: 'Poppins1',
                        color: Colors.grey[700]),
                  ),
                ),
                Theme(
                  data: new ThemeData(
                    primaryColor: Colors.redAccent,),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => email = value,
                    decoration: InputDecoration(
                      hintText: 'abc@email.com',
                    ),
                  ),),SizedBox(height: height/40,),
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    "Full name",
                    style: TextStyle(
                        letterSpacing: 0,
                        fontFamily: 'Poppins1',
                        color: Colors.grey[700]),
                  ),
                ),
                Theme(
                  data: new ThemeData(
                    primaryColor: Colors.redAccent,),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value) => name = value,

                  ),),SizedBox(height: height/40,),
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    "Birthday",
                    style: TextStyle(
                        letterSpacing: 0,
                        fontFamily: 'Poppins1',
                        color: Colors.grey[700]),
                  ),
                ),
                Theme(
                  data: new ThemeData(
                    primaryColor: Colors.redAccent,),
                  child: TextField(
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) =>  dob= value,
                    decoration: InputDecoration(
                      hintText: 'dd/mm/yyyy',
                    ),
                  ),),SizedBox(height: height/40,),
                Material(
                  elevation: 0,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        a=Colors.blue;
                        _getCurrentLocation();
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: 55.0,
                    minWidth: 320,
                    child: Text(
                      'Location',
                      style: TextStyle(
                          fontFamily: "Poppins", color: Colors.white, fontSize: 20),
                    ),
                    splashColor: Colors.white,
                    color: a,
                  ),
                ),SizedBox(height: height/40,),
                Material(
                  elevation: 0,
                  child: MaterialButton(
                    onPressed: () {

                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Gender();}), ModalRoute.withName('/'));
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
        ),
      ],
    )
    );
  }

}