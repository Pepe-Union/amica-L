import 'dart:io';
import 'package:chat_app_example/photosData.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;


class Upload extends StatefulWidget {
  static const String id="upload";
  @override

  _UploadState createState() => _UploadState();

}

class _UploadState extends State<Upload> {
  File _image;
  File _image1;
  File _image2;
  File _image3;

  File _image4;
  File _image5;
  File _image6;
  File _image7;
  File _image8;
  String _uploadedFileURL;
  String _uploadedFileURL1;
  String _uploadedFileURL2;
  String _uploadedFileURL3;
  String _uploadedFileURL4;
  String _uploadedFileURL5;
  String _uploadedFileURL6;
  String _uploadedFileURL7;
  String _uploadedFileURL8;


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height/12,
            ),Padding(
              padding: EdgeInsets.only(right: width/2),
              child: Text(
                "Add photos",textAlign: TextAlign.start,
                style: TextStyle(
                  letterSpacing: 0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: height/27,
                ),
              ),
            ),Padding(
              padding: EdgeInsets.only(right: width/3.2, top: height/30, left: width/10),
              child: Text(
                "Hold, drag & drop to reorder images.",
                style: TextStyle(
                    letterSpacing: 0,
                    fontFamily: 'Poppins2',
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: height/40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  child: _uploadedFileURL != null
                      ? Container(
                    height: height/5,
                    width: width/3.6,
                    child: Image.network(
                      _uploadedFileURL,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Container(
                      height: height/5,
                      width: width/3.6,color: Colors.grey[400],
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 100,
                        ),
                      )),
                  onTap: chooseFile,
                ),

                Hero(
                  tag: "a1",
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: _uploadedFileURL1 != null
                        ? Container(
                      height: height/5,
                      width: width/3.6,
                      child: Image.network(
                        _uploadedFileURL1,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Container(
                        height: height/5,
                        width: width/3.6,color: Colors.grey[400],
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 100,
                          ),
                        )),
                    onTap: chooseFile1,
                  ),
                ),InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: _uploadedFileURL2 != null
                      ? Container(
                    height: height/5,
                    width: width/3.6,
                    child: Image.network(
                      _uploadedFileURL2,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Container(
                      height: height/5,
                      width: width/3.6,color: Colors.grey[400],
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 100,
                        ),
                      )),
                  onTap: chooseFile2,
                ),
              ],
            )
            ,SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: _uploadedFileURL3 != null
                      ? Container(
                    height: height/5,
                    width: width/3.6,
                    child: Image.network(
                      _uploadedFileURL3,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Container(
                      height: height/5,
                      width: width/3.6,color: Colors.grey[400],
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 100,
                        ),
                      )),
                  onTap: chooseFile3,
                ),

                Hero(
                  tag: "a2",
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: _uploadedFileURL4 != null
                        ? Container(
                      height: height/5,
                      width: width/3.6,
                      child: Image.network(
                        _uploadedFileURL4,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Container(
                        height: height/5,
                        width: width/3.6,color: Colors.grey[400],
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 100,
                          ),
                        )),
                    onTap: chooseFile4,
                  ),
                ),InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: _uploadedFileURL5 != null
                      ? Container(
                    height: height/5,
                    width: width/3.6,
                    child: Image.network(
                      _uploadedFileURL5,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Container(
                      height: height/5,
                      width: width/3.6,color: Colors.grey[400],
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 100,
                        ),
                      )),
                  onTap: chooseFile5,
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: _uploadedFileURL6 != null
                      ? Container(
                    height: height/5,
                    width: width/3.6,
                    child: Image.network(
                      _uploadedFileURL6,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Container(
                      height: height/5,
                      width: width/3.6,color: Colors.grey[400],
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 100,
                        ),
                      )),
                  onTap: chooseFile6,
                ),


                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: _uploadedFileURL7 != null
                      ? Container(
                    height: height/5,
                    width: width/3.6,
                    child: Image.network(
                      _uploadedFileURL7,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Container(
                      height: height/5,
                      width: width/3.6,color: Colors.grey[400],
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 100,
                        ),
                      )),
                  onTap: chooseFile7,
                ),

                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: _uploadedFileURL8 != null
                      ? Container(
                    height: height/5,
                    width: width/3.6,
                    child: Image.network(
                      _uploadedFileURL8,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Container(
                      height: height/5,
                      width: width/3.6,color: Colors.grey[400],
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 100,
                        ),
                      )),
                  onTap: chooseFile8,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Material(
                elevation: 0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyHomePage.id);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  height: height/12,minWidth: width/1.3,
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 17),
                  ),
                  splashColor: Colors.red,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
        uploadFile();

      });
    });
  }
  Future chooseFile1() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image1 = image;
        uploadFile1();

      });
    });
  }
  Future chooseFile2() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image2 = image;
        uploadFile2();

      });
    });
  }
  Future chooseFile3() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image1 = image;
        uploadFile3();

      });
    });
  }
  Future chooseFile4() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image2 = image;
        uploadFile4();

      });
    });
  }
  Future chooseFile5() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image3 = image;
        uploadFile5();

      });
    });
  }
  Future chooseFile6() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image4 = image;
        uploadFile6();

      });
    });
  }
  Future chooseFile7() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image6 = image;
        uploadFile7();

      });
    });
  }
  Future chooseFile8() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image7 = image;
        uploadFile8();

      });
    });
  }





  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;

      });
    });
  }

  Future uploadFile1() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image1.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image1);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL1 = fileURL;

      });
    });
  }
  Future uploadFile2() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image2.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image2);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL2 = fileURL;

      });
    });
  }

  Future uploadFile3() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image3.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image3);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL3 = fileURL;

      });
    });
  }
  Future uploadFile4() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image4.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image4);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL4 = fileURL;

      });
    });
  }
  Future uploadFile5() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image5.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image5);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL5 = fileURL;

      });
    });
  }
  Future uploadFile6() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image6.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image6);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL6 = fileURL;

      });
    });
  }
  Future uploadFile7() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image7.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image7);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL7 = fileURL;

      });
    });
  }
  Future uploadFile8() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image8.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image8);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL8 = fileURL;

      });
    });
  }
}