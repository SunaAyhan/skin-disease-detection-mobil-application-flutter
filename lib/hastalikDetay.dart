import 'package:flutter/material.dart';

class HastalikDetay extends StatelessWidget {
  final String isim;
  final String resimYolu;

  final String treatment;
  final String symptoms;

  HastalikDetay(
      {Key? key,
      required this.isim,
      required this.resimYolu,
      required this.treatment,
      required this.symptoms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double genislik = MediaQuery.of(context).size.width;
    final double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(children: [
      Stack(children: [
        Center(
          child: Image.asset(
            resimYolu,
            fit: BoxFit.scaleDown,
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: 40,
            )),
      ]),
      SizedBox(
        height: 20,
      ),
      Center(
        child: Text(
          isim,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
          padding: EdgeInsets.only(top: 3),
          child: Padding(
            padding:
                EdgeInsets.only(left: genislik * 0.05, right: genislik * 0.08),
            child: Container(
              child: (Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text("Symptoms",
                              style: TextStyle(
                                  fontSize: genislik * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor)),
                          title: Text(
                            symptoms,
                            style: TextStyle(
                              fontSize: genislik * 0.04,
                            ),
                          ),
                        ),
                        Divider(color: Colors.black87),
                        Divider(color: Colors.transparent),
                        ListTile(
                          leading: Text("Treatment & \n Prevention",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: genislik * 0.04,
                                  fontWeight: FontWeight.bold)),
                          title: Text(
                            treatment,
                            style: TextStyle(
                              fontSize: genislik * 0.04,
                            ),
                          ),
                        ),
                        Divider(color: Colors.grey),
                        SizedBox(
                          height: genislik * 0.05,
                        )
                      ],
                    ),
                  )
                ],
              )),
            ),
          ))
    ]));
  }
}
