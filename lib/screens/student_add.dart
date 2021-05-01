import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validation.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
             buildFirstNameField(),
              buildLastNameField(),
              buildGradeNameField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Akın"),
      validator: validateFirstName,
      onSaved: (String value){
        student.firstName = value;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Ayhan"),
      validator: validateLastName,
      onSaved: (String value){
        student.lastName = value;
      },
    );
  }
  Widget buildGradeNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "65"),
      validator: validateGradeName,
      onSaved: (String value){
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          saveStudent();
        }
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}

