import 'package:chat_app_example/FirebaseAuth.dart';
import 'package:chat_app_example/views/SignUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_example/services/authservice.dart';

class Phonelogin extends StatefulWidget {
  @override
  _PhoneloginState createState() => _PhoneloginState();
}

class _PhoneloginState extends State<Phonelogin> {
  final formKey = new GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(height/20),
        child: ListView(
          children: <Widget>[
            Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft,
                      child: Text(
                        "Log In with phone number",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: height/28,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: height/20,),
                    Align(alignment: Alignment.centerLeft,
                      child: Text(
                        "My phone number",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.grey[700],
                            fontSize: height/35,
                        ),
                      ),
                    ),
                    SizedBox(height: height/20,),
                    TextFormField(cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: 'Phone number',focusColor: Colors.redAccent),
                      onChanged: (val) {
                        setState(() {
                          this.phoneNo = val;
                        });
                      },
                    ),
                    codeSent ? TextFormField(cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: 'Enter OTP',focusColor: Colors.redAccent),
                      onChanged: (val) {
                        setState(() {
                          this.smsCode = val;
                        });
                      },
                    ) : Container(),
                    SizedBox(height: height/20,),
                    Align(alignment: Alignment.center,
                      child: Text(
                        "Code will be sent to your phone for verification.",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                    SizedBox(height: height/8,),
                    Padding(
                        padding: EdgeInsets.only(left: 25.0, right: 25.0),
                        child: MaterialButton(
                            color: Colors.grey[400],
                            splashColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            height: 55.0,
                            minWidth: 320,
                            child: Center(child: codeSent ? Text('Login'):Text('Continue')),
                            onPressed: () {
                              codeSent ? AuthService1().signInWithOTP(smsCode, verificationId) : verifyPhone(phoneNo);
                            }))],
                )),
          ],
        ),
      )
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}