import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/student_add.dart';
import 'package:temel_widget/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent=Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1,"Akın", "Ayhan", 25),
    Student.withId(2,"Burak", "Dinç", 65),
    Student.withId(3,"Çağrı", "Tunç", 45)
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

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
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
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });

                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Seçili öğrenci : " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              // ignore: deprecated_member_use
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni öğrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: <Widget> [
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.redAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                  var mesaj = "Silindi : " + selectedStudent.firstName ;
                  mesajGoster(context, mesaj);
                },
              ),
            )
          ],
        )
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
