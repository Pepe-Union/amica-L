import 'package:chat_app_example/chat/all_users_screen.dart';
import 'package:chat_app_example/photosData.dart';

import 'package:chat_app_example/res.dart';
import 'package:chat_app_example/views/SignUpScreen.dart';
import 'package:chat_app_example/views/SplashScreen.dart';
import 'package:chat_app_example/views/faceid.dart';
import 'package:flutter/material.dart';
import 'FirebaseAuth.dart';
import 'ImagePicker.dart';
import 'inbox.dart';
import 'views/SignUpScreen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amica',
      theme: ThemeData(
        primaryColor: Colors.redAccent
      ),
      home:  FacePage(),
      routes: {
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),Imformation.id: (context) => Imformation(),

        Chat.id: (context) => Chat(),
        Gender.id:(context)=>Gender(),
        SplashScreen.id: (context) => SplashScreen(),
        //OtpScreen1.id: (context) => OtpScreen1(),
        OtpScreen.id: (context) => OtpScreen(),
        LoginPage.id: (context) => LoginPage(),
        Selfie.id:(context)=>Selfie(),
        ImageUpload.id:(context)=>ImageUpload(),
        MyHomePage.id:(context)=>MyHomePage(),
        Upload.id:(context)=>Upload(),
      },
    );
  }
}
