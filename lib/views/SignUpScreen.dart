import 'dart:async';
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
        color: Colors.red,
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Sign Up using email address",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 30),
                )),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) => username = value,
                decoration: InputDecoration(
                    hintText: "Ab C",
                    hintStyle:
                    TextStyle(color: Colors.tealAccent, fontSize: 18)),
              ),
            ),


            Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  "Email Address",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) => email = value,
                decoration: InputDecoration(
                    hintText: "abc@email.com",
                    hintStyle:
                    TextStyle(color: Colors.tealAccent, fontSize: 18)),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: TextField(
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => password = value,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle:
                    TextStyle(color: Colors.tealAccent, fontSize: 18)),
              ),
            ),
            CustomButton(
              text: "Register",
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 40,
            ),
            child: Text(
              "Log In With email address",
              style: TextStyle(
                letterSpacing: 2,
                fontFamily: 'Poppins',
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              "Email Address",
              style: TextStyle(
                  letterSpacing: 0,
                  fontFamily: 'Poppins1',
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => email = value,
              decoration: InputDecoration(
                hintText: 'abc@email.com',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "Password",
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 0,
                  fontFamily: 'Poppins1',
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              autocorrect: false,
              obscureText: true,
              onChanged: (value) => password = value,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Forgot Password",
              textAlign: TextAlign.right,
              style: TextStyle(
                  letterSpacing: 0,
                  fontFamily: 'Poppins1',
                  color: Colors.black,
                  fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: CustomButton(
              text: "Log In",
              callback: () async {
                await loginUser();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: CustomButton(
              text: "Sign Up",
              callback: () {
                Navigator.of(context).pushNamed(Registration.id);
              },
            ),
          )
        ],
      ),
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
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 100,right: 100
            ),
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
          ),
          Padding(
            padding: EdgeInsets.only(top: 10,right: 250),
            child: Text(
              "Your Gender",
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 0, fontFamily: 'Poppins', color: Colors.grey[700]),
            ),
          ),
          Padding(padding: EdgeInsets.only(top:10),
            child: Center(
              child: Container(
                width: 375,
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
                                  fontSize: 15,
                                  fontFamily: 'Poppins2',
                                  color: Colors.black),
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
          ),
          Padding(
            padding: EdgeInsets.only(top: 40,right: 250),
            child: Text(
              "Intrested in",
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 0, fontFamily: 'Poppins', color: Colors.grey[700]),
            ),
          ),
          Padding(padding: EdgeInsets.only(top:10),
            child: Center(
              child: Container(
                width: 375,
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
                                  fontSize: 15,
                                  fontFamily: 'Poppins2',
                                  color: Colors.black),
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
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Material(
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
          ),
        ],
      ),
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
    return Scaffold(
      body: SafeArea(
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
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "City",
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
                  onChanged: (value) =>  city= value,

                ),),SizedBox(height: height/40,),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "State",
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
                  onChanged: (value) => state = value,
                ),),SizedBox(height: height/40,),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Country",
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
                  onChanged: (value) => country = value,
                ),),SizedBox(height: height/40,),
              Material(
                elevation: 0,
                child: MaterialButton(
                  onPressed: () {

                    Navigator.pushNamed(context, Gender.id);
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
    );
  }

}