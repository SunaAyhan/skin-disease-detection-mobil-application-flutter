import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:permission_handler/permission_handler.dart';

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  int _aktifSayfaNo = 0;
  File? imageURI;
  List? result;
  late String path;

  Future getImageFromCamera() async {
    var status = await Permission.camera.status;
    if (!status.isDenied) {
      var image = await ImagePicker().getImage(source: ImageSource.camera);
      if (image == null) {
        return null;
      }
      setState(() {
        imageURI = File(image.path);
        path = image.path;
        result = null;
      });
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Camera Permission'),
                content: Text(
                    'This app needs camera access to take pictures for upload user profile photo'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    }
    // ignore: deprecated_member_use
  }

  Future getImageFromGallery() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    setState(() {
      imageURI = File(image.path);
      path = image.path;
      result = null;
    });
  }

  Future classifyImage() async {
    result = null;
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
    var output = await Tflite.runModelOnImage(
      path: path,
      numResults: 13,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      result = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double genislik = MediaQuery.of(context).size.width;
    final double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: ListView(children: [
        Container(
          decoration: BoxDecoration(),
          padding: new EdgeInsets.only(top: yukseklik * 0.01),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              imageURI == null
                  ? Text(" Choose Picture ", style: TextStyle(fontSize: 21))
                  : Image.file(
                      imageURI!,
                      width: genislik * 0.99,
                      height: 240,
                      fit: BoxFit.fill,
                    ),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: MaterialButton(
                      height: 50,
                      onPressed: () => getImageFromCamera(),
                      child: Text('Camera'),
                      textColor: Colors.black,
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: MaterialButton(
                      height: 50,
                      onPressed: () => getImageFromGallery(),
                      child: Text('Gallery'),
                      textColor: Colors.black,
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: MaterialButton(
                      height: 50,
                      onPressed: () => classifyImage(),
                      child: Text('Scan'),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              result == null
                  ? Text(' ')
                  : Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: RichText(
                            text: TextSpan(
                                text: fonksiyon().toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20),
                                children: [
                              TextSpan(
                                  text:
                                      "\n The results are not 100% correct, please do not apply treatment without consulting your doctor!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 13))
                            ])),
                      ),
                    ),
            ],
          ),
        )
      ]),
    );
  }

  fonksiyon() {
    try {
      return "Disease: " +
          result![0]["label"].toString().replaceAll("_", " ") +
          " \nConfidence: " +
          result![0]["confidence"]
              .toString()
              .substring(0, 3)
              .replaceAll("_", " ");
    } catch (e) {
      return "The disease could not be identified. Please try with another photo. ";
    }
  }
}
