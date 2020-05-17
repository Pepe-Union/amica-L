

import 'dart:io';

import 'dart:ui' as ui;


import 'package:chat_app_example/photosData.dart';
import 'package:chat_app_example/views/SignUpScreen.dart';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../ImagePicker.dart';



class FacePage extends StatefulWidget {
  static const String id = "facepage";
  @override
  _FacePageState createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
  File _imageFile;
  List<Face> _faces;
  bool isLoading = false;
  ui.Image _image;

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
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Gender();}), ModalRoute.withName('/'));
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: isLoading
          ? Center(child: CircularProgressIndicator())
          : (_imageFile == null )
          ? ListView(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(height/30),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height/20,
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      "Verification",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: height/27,
                      ),
                    ),
                  ),SizedBox(height: height/20,),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      " Click a photo from your selfie camera to get verified and\n proceed further. ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          letterSpacing: 0,
                          fontFamily: 'Poppins1',
                          color: Colors.black),
                    ),
                  ), SizedBox(height: height/20,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(height: height/4,width: width/1.4,
                      child: FlatButton(
                          child: Image(
                            image: AssetImage('assets/images/cam1.png'),
                          ),
                          onPressed: _getImageAndDetectFaces

                      ),
                    ),
                  ), SizedBox(height: height/20,),
                  Text(
                    " Click on the icon to take a selfie. ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        letterSpacing: 0,
                        fontFamily: 'Poppins1',
                        color: Colors.black),
                  ),SizedBox(height: height/20,),
                  Align(alignment: Alignment.center,
                    child: Text(
                      " * This picture will only be used for verification purposes by\n  the admin.\n"
                          " You can add other photos for public viewing once you \n  have been verified ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          letterSpacing: 0,
                          fontFamily: 'Poppins1',
                          color: Colors.black),
                    ),
                  ),

                ],
              ),
            )
          ],
        )
          : Scaffold(backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
             Builder(
               builder: (context) => Container(
                child: Padding(
                  padding:  EdgeInsets.all(height/30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: height/25,
                      ),
                      Align(alignment: Alignment.centerLeft,
                        child: Text(
                          "Confirm Selfie",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                            fontFamily: 'Poppins',
                            fontSize: height/27,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height/16,
                      ),
                       CircleAvatar(radius: height/6,
                         child: ClipOval(
                           child: FittedBox(
                            child: SizedBox(
                              width: _image.width.toDouble(),
                              height: _image.height.toDouble(),
                              child: CustomPaint(
                                painter: FacePainter(_image, _faces),
                              ),
                            ),
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

                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return VoiceUpload();}), ModalRoute.withName('/'));
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
            ),
          ],
        ),
      )

    );
  }
}

class FacePainter extends CustomPainter {
  final ui.Image image;
  final List<Face> faces;
  final List<Rect> rects = [];

  FacePainter(this.image, this.faces) {
    for (var i = 0; i < faces.length; i++) {
      rects.add(faces[i].boundingBox);
      print(faces);
    }
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..color = Colors.blue;
    var flag=1;

    canvas.drawImage(image, Offset.zero, Paint());
    for (var i = 0; i < faces.length; i++) {
      canvas.drawRect(rects[i], paint);
      flag=0;
      print(rects);
      print("$flag");
    }
  }

  @override
  bool shouldRepaint(FacePainter oldDelegate) {
    return image != oldDelegate.image || faces != oldDelegate.faces;
  }
}