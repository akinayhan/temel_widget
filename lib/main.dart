import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "Merhaba ilk uygulamam!";
  @override
  Widget build(BuildContext context) {
    var ogrenciler = ["Akın Ayhan","Ayhan Akın","Akın Akın","Ayhan Ayhan"];
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: ogrenciler.length,
              itemBuilder: (BuildContext context, int index){
                return Text(ogrenciler[index]);
              })
          ),
          Center(
            child: RaisedButton(
              child: Text("Sonucu gör"),
              onPressed: () {
                int puan = 60;
                String mesaj = "";
                if (puan >= 50) {
                  mesaj = "Geçti";
                } else if (puan >= 40) {
                  mesaj = "Bütünlemeye kaldı";
                } else {
                  mesaj = "Kaldı";
                }

                var alert = AlertDialog(
                  title: Text("Sınav Sonucu"),
                  content: Text(mesaj),
                );
                showDialog(context: context, builder: (BuildContext) => alert);
              },
            ),
          ),
        ],
      ),
    );
  }
}
