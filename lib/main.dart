import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  String seciliOgrenci = "ABC ";

  List<Student> students = [Student("Akın","Ayhan",25),Student("Burak", "Dinç", 65),Student("Çağrı","Tunç",45)];

  var ogrenciler = ["Akın Ayhan",
    "Burak Dinç",
    "Çağrı Tunç",
    "Osman Gül"
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context)
    );
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "Geçti";
    } else if (puan >= 40) {
      mesaj = "Bütünlemeye kaldı";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg"),
                    ),
                    title: Text(students[index].firstName + " " + students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " + students[index].grade.toString() + " ["+students[index].getStatus+"]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      setState(() {
                        seciliOgrenci = students[index].firstName + " " + students[index].lastName;
                      });

                      print(seciliOgrenci);
                    },
                  );
                })),
        Text("Seçili öğrenci : " + seciliOgrenci),
        Center(
          // ignore: deprecated_member_use
          child: RaisedButton(
            child: Text("Sonucu gör !!!"),
            onPressed: () {
              var mesaj = sinavHesapla(55);
              mesajGoster(context,mesaj);
            },
          ),
        ),
      ],
    );

  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
