import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantdisease_new/bilgi.dart';
import 'package:plantdisease_new/tarama.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
    ),
    home: Anasayfa(),
  ));
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _aktifSayfaNo = 0;
  late PageController sayfaKumandasi;
  @override
  void initState() {
    super.initState();
    sayfaKumandasi = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final double genislik = MediaQuery.of(context).size.width;
    final double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: new AppBar(
        title: new Text('Skin Disease Detection'),
      ),
      body: Stack(children: [
        Container(),
        PageView(
          onPageChanged: (acilanSayfaNo) {
            setState(() {
              _aktifSayfaNo = acilanSayfaNo;
            });
          },
          controller: sayfaKumandasi,
          children: [MyApp(), Bilgi()],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifSayfaNo,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), label: "Skin Scanning"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_sharp), label: "Diseases")
        ],
        onTap: (secilenSayfaNo) {
          setState(() {
            sayfaKumandasi.jumpToPage(secilenSayfaNo);
          });
        },
      ),
    );
  }
}
