

import 'dart:io';

import 'dart:ui' as ui;


import 'package:chat_app_example/photosData.dart';

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
    return Scaffold(

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : (_imageFile == null)
          ? Column(
        children: <Widget>[
          SizedBox(
            height: height/25,
          ),
          Padding(
            padding: EdgeInsets.only(top: height/20, right: height/3),
            child: Text(
              "Verification",
              textAlign: TextAlign.left,
              style: TextStyle(
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: height/25,
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
                  onPressed: _getImageAndDetectFaces

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
      )
          : Scaffold(
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
                Container(height: 100,width: 100,
                    child: CustomPaint(
                      painter: FacePainter(_image, _faces),
                    ),
                  ),
                SizedBox(
                  height: height/8,
                ),
                Material(
                  elevation: 0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context,Upload.id);
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