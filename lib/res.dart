//import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/services.dart';
//
//import 'FirebaseAuth.dart';
//
//class MyAppPage extends StatefulWidget {
//  MyAppPage({Key key, this.title}) : super(key: key);
//  final String title;
//
//
//  @override
//  _MyAppPageState createState() => _MyAppPageState();
//}
//
//class _MyAppPageState extends State<MyAppPage> {
//  String phoneNo;
//  String smsOTP;
//  String verificationId;
//  String errorMessage = '';
//errorMessage
//
//
//  FirebaseAuth _auth = FirebaseAuth.instance;
//
//  Future<void> verifyPhone() async {
//    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
//      this.verificationId = verId;
//      smsOTPDialog(context).then((value) {
//        print('sign in');
//      });
//    };
//    try {
//      await _auth.verifyPhoneNumber(
//          phoneNumber: this.phoneNo, // PHONE NUMBER TO SEND OTP
//          codeAutoRetrievalTimeout: (String verId) {
//            //Starts the phone number verification process for the given phone number.
//            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
//            this.verificationId = verId;
//          },
//          codeSent:
//          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
//          timeout: const Duration(seconds: 20),
//          verificationCompleted: (AuthCredential phoneAuthCredential) {
//            print(phoneAuthCredential);
//          },
//          verificationFailed: (AuthException exceptio) {
//            print('${exceptio.message}');
//          });
//    } catch (e) {
//      handleError(e);
//    }
//  }
//
//  Future<bool> smsOTPDialog(BuildContext context) {
//    return showDialog(
//        context: context,
//        barrierDismissible: false,
//        builder: (BuildContext context) {
//          return new AlertDialog(
//            title: Text('Enter SMS Code'),
//            content: Container(
//              height: 85,
//              child: Column(children: [
//
//                TextField(
//
//                  onChanged: (value) {
//                    this.smsOTP = value;
//                  },
//
//                decoration: InputDecoration(labelText: "Phone Number", prefixText: "+", border: OutlineInputBorder()),),
//                (errorMessage != ''
//                    ? Text(
//                  errorMessage,
//                  style: TextStyle(color: Colors.red),
//                )
//                    : Container())
//              ]),
//            ),
//            contentPadding: EdgeInsets.all(10),
//            actions: <Widget>[
//              FlatButton(
//                child: Text('Done'),
//                onPressed: () {
//                  _auth.currentUser().then((user) {
//                    if (user != null) {
//                      Navigator.of(context).pop();
//                     // Navigator.of(context).pushReplacementNamed('/homepage');
//                    } else {
//                      signIn();
//                    }
//                  });
//                },
//              )
//            ],
//          );
//        });
//  }
//
//  signIn() async {
//    try {
//      final AuthCredential credential = PhoneAuthProvider.getCredential(
//        verificationId: verificationId,
//        smsCode: smsOTP,
//      );
//      final FirebaseUser user = await _auth.signInWithCredential(credential);
//      final FirebaseUser currentUser = await _auth.currentUser();
//      assert(user.uid == currentUser.uid);
//      Navigator.of(context).pop();
//     // Navigator.of(context).pushReplacementNamed('/homepage');
//    } catch (e) {
//      handleError(e);
//    }
//  }
//
//  handleError(PlatformException error) {
//    print(error);
//    switch (error.code) {
//      case 'ERROR_INVALID_VERIFICATION_CODE':
//        FocusScope.of(context).requestFocus(new FocusNode());
//        setState(() {
//          errorMessage = 'Invalid Code';
//        });
//        Navigator.of(context).pop();
//        smsOTPDialog(context).then((value) {
//          print('sign in');
//        });
//        break;
//      default:
//        setState(() {
//          errorMessage = error.message;
//        });
//
//        break;
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.all(10),
//              child: TextField(
//                decoration: InputDecoration(
//                    hintText: 'Enter Phone Number Eg. +910000000000'),
//                onChanged: (value) {
//                  this.phoneNo = value;
//                },
//              ),
//            ),
//            (errorMessage != ''
//                ? Text(
//              errorMessage,
//              style: TextStyle(color: Colors.red),
//            )
//                : Container()),
//            SizedBox(
//              height: 10,
//            ),
//            RaisedButton(
//              onPressed: () {
//                verifyPhone();
//              },
//              child: Text('Verify'),
//              textColor: Colors.white,
//              elevation: 7,
//              color: Colors.blue,
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
////Column(
////crossAxisAlignment: CrossAxisAlignment.start,
////children: <Widget>[
////TextField(
////controller: phoneNumController,
////decoration: InputDecoration(labelText: "Phone Number", prefixText: "+1", border: OutlineInputBorder()),
////),
////FlatButton(
////child: Text("Send code"),
////onPressed: () => _verifyPhoneNumber(context),
////), //FlatButton
////], // Widget
//
//
///// method to verify phone number and handle phone auth
////_verifyPhoneNumber(BuildContext context) async {
////  String phoneNumber = "+1" + phoneNumController.text.toString();
////  final FirebaseAuth _auth = FirebaseAuth.instance;
////  await _auth.verifyPhoneNumber(
////      phoneNumber: phoneNumber,
////      timeout: Duration(seconds: 5),
////      verificationCompleted: (authCredential) => _verificationComplete(authCredential, context),
////      verificationFailed: (authException) => _verificationFailed(authException, context),
////      codeAutoRetrievalTimeout: (verificationId) => _codeAutoRetrievalTimeout(verificationId),
////      // called when the SMS code is sent
////      codeSent: (verificationId, [code]) => _smsCodeSent(verificationId, [code]));
////}
//
//class OtpScreen1 extends StatefulWidget {
//  static const String id = "otpscreen1";
//
//  @override
//  _OtpScreenState1 createState() => _OtpScreenState1();
//}
//
//class _OtpScreenState1 extends State<OtpScreen1> {
//  List<String> currentPin = ["", "", "", "", "", "", "", ""];
//  TextEditingController pin1 = TextEditingController();
//  TextEditingController pin2 = TextEditingController();
//  TextEditingController pin3 = TextEditingController();
//  TextEditingController pin4 = TextEditingController();
//  TextEditingController pin5 = TextEditingController();
//  TextEditingController pin6 = TextEditingController();
//  TextEditingController pin7 = TextEditingController();
//  TextEditingController pin8 = TextEditingController();
//  TextEditingController pin9 = TextEditingController();
//  TextEditingController pin10 = TextEditingController();
//  TextEditingController pin11= TextEditingController();
//  TextEditingController pin12= TextEditingController();
//  int pinIndex = 0;
//  String strPin;
//
////  List <String> currentPin=["","","","","","","",""];
//  putIndex(String text) {
//    if (pinIndex == 0)
//      pinIndex = 1;
//    else if (pinIndex < 12) pinIndex++;
//    setPin(pinIndex, text);
//    currentPin.forEach((e) {
//      strPin += e;
//    });
//    if (pinIndex == 8) print(strPin);
//  }
//
//  setPin(n, String text) {
//    switch (n) {
//      case 1:
//        pin1.text = text;
//        break;
//      case 2:
//        pin2.text = text;
//        break;
//      case 3:
//        pin3.text = text;
//        break;
//      case 4:
//        pin4.text = text;
//        break;
//      case 5:
//        pin5.text = text;
//        break;
//      case 6:
//        pin6.text = text;
//        break;
//      case 7:
//        pin7.text = text;
//        break;
//      case 8:
//        pin8.text = text;
//        break;
//      case 9:
//        pin9.text = text;
//        break;
//      case 10:
//        pin10.text = text;
//        break;
//
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            SizedBox(
//              height: 10,
//            ),
//            Padding(
//              padding: EdgeInsets.only(top: 50, left: 20),
//              child: Text(
//                "Log in With Phone number",
//                style: TextStyle(
//                  letterSpacing: 2,
//                  fontFamily: 'Poppins',
//                  fontSize: 32,
//                ),
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.only(right: 100, top: 20, left: 20),
//              child: Text(
//                "Enter Phone number",
//                style: TextStyle(
//                    letterSpacing: 0,
//                    fontFamily: 'Poppins1',
//                    fontSize: 20,
//                    color: Colors.teal),
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.only(bottom: 0,left: 10),
//              child: Text(
//                "  Add Area code before the number eg:+91",
//                textAlign: TextAlign.left,
//                style: TextStyle(
//                    letterSpacing: 0,
//                    fontFamily: 'Poppins1',
//                    color: Colors.teal),
//              ),
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//
//              children: <Widget>[
//                PINNumber(
//                  t1: pin1,
//                ),
//                PINNumber(
//                  t1: pin2,
//                ),
//                PINNumber(
//                  t1: pin3,
//                ),
//                PINNumber(
//                  t1: pin4,
//                ),
//                PINNumber(
//                  t1: pin5,
//                ),
//                PINNumber(
//                  t1: pin6,
//                ),
//                PINNumber(
//                  t1: pin7,
//                ),
//                PINNumber(
//                  t1: pin8,
//                ),
//                PINNumber(
//                  t1: pin9,
//                ),
//
//                PINNumber(
//                  t1: pin10,
//                ),
//
//              ],
//            ),
//            Padding(
//                padding: EdgeInsets.symmetric(horizontal: 90),
//                child: Text(
//                  "",
//                  textAlign: TextAlign.center,
//                )),
//            Padding(
//              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
//              child: Material(
//                elevation: 0,
//                child: MaterialButton(
//                  onPressed: () {
//                    setState(() {
//                      if(pinIndex>9)
//                        Navigator.pushNamed(context, OtpScreen.id);
//                    });
//                  },
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(40)),
//                  height: 55.0,
//                  minWidth: 320,
//                  child: Text(
//                    'Continue',
//                    style: TextStyle(
//                        fontFamily: "Poppins",
//                        color: Colors.white,
//                        fontSize: 20),
//                  ),
//                  splashColor: Colors.red,
//                  color: Colors.redAccent,
//                ),
//              ),
//            ),
//            buildNumberPad()
//          ],
//        ),
//      ),
//    );
//  }
//
//  buildNumberPad() {
//    return SafeArea(
//      child: Container(
//        color: Colors.white10,
//        child: Padding(
//          padding: EdgeInsets.only(bottom: 30),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(top: 20),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    keyBoardNumber(
//                        n: 1,
//                        onPressed: () {
//                          putIndex('1');
//                        }),
//                    keyBoardNumber(
//                        n: 2,
//                        onPressed: () {
//                          putIndex('2');
//                        }),
//                    keyBoardNumber(
//                        n: 3,
//                        onPressed: () {
//                          putIndex('3');
//                        })
//                  ],
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 20),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    keyBoardNumber(
//                        n: 4,
//                        onPressed: () {
//                          putIndex('4');
//                        }),
//                    keyBoardNumber(
//                        n: 5,
//                        onPressed: () {
//                          putIndex('5');
//                        }),
//                    keyBoardNumber(
//                        n: 6,
//                        onPressed: () {
//                          putIndex('6');
//                        })
//                  ],
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 20),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    keyBoardNumber(
//                        n: 7,
//                        onPressed: () {
//                          putIndex('7');
//                        }),
//                    keyBoardNumber(
//                        n: 8,
//                        onPressed: () {
//                          putIndex('8');
//                        }),
//                    keyBoardNumber(
//                        n: 9,
//                        onPressed: () {
//                          putIndex('9');
//                        })
//                  ],
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 20),
//                child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Text('                '),
//                      keyBoardNumber(
//                          n: 0,
//                          onPressed: () {
//                            putIndex('0');
//                          }),
//                      IconButton(
//                          icon: Icon(
//                            Icons.backspace,
//                          ),
//                          onPressed: () {})
//                    ]),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class PINNumber extends StatelessWidget {
//  final TextEditingController t1;
//
//  const PINNumber({Key key, this.t1}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Container(
//        width: 20,
//        child: TextField(
//          controller: t1,
//          enabled: false,
//          obscureText: false,
//          textAlign: TextAlign.center,
//          decoration: InputDecoration(
//
//              filled: false,
//              fillColor: Colors.red),
//        ),
//      ),
//    );
//  }
//}
//
//class keyBoardNumber extends StatelessWidget {
//  final int n;
//  final Function() onPressed;
//
//  const keyBoardNumber({Key key, this.n, this.onPressed}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Container(
//        width: 60,
//        height: 60,
//        decoration: BoxDecoration(
//            shape: BoxShape.circle, color: Colors.white54.withOpacity(0.1)),
//        alignment: Alignment.center,
//        child: Material(
//          elevation: 0,
//          child: MaterialButton(
//            onPressed: onPressed,
//            shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
//            height: 90.0,
//            child: Text(
//              "$n",
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                  fontSize: 24 * MediaQuery
//                      .of(context)
//                      .textScaleFactor),
//            ),
//            color: Colors.white,
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//
