import 'dart:io';

import 'package:SmartAgriculture/classes/language.dart';
import 'package:SmartAgriculture/localization/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:SmartAgriculture/plant_disease/tensorflow.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';


class Detector extends StatefulWidget {
  Detector({Key key}) : super(key: key);
 

  @override
  _DetectorState createState() => _DetectorState();
}

class _DetectorState extends State<Detector> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  
  
  
  Tensorflow tensor =
      new Tensorflow(model: "assets/plant_disease_model.tflite", labels: "assets/plant_labels.txt");
  File _image;
  List _recognitions = [];

  @override
  void initState() {
    super.initState();
    tensor.loadModel();
  }

  selectFromImagePicker() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _image = image;
    });
   
  }

  selectFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (image == null) return;
    setState(() {
      _image = image;
    });
    
  } 
   detect() async {

    List recognitions = await tensor.predictImage(_image);
    setState(() {
      _recognitions=recognitions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title:Text(getTranslated(context,'pdp'),style: TextStyle(
                      fontSize: 17,
                      color: Colors.green[900],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1)),
                      backgroundColor: Colors.green[400],
                      centerTitle: true,
                       actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language language) {
                _changeLanguage(language);
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
                      ),
      body: SafeArea(
              child: ListView(
   children: <Widget>[
     Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              SizedBox(
                height: 30,
              ),
              Text(getTranslated(context,'taiopl'),
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1)),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => selectFromCamera(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green[900]),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green[900],
                      ),
                      child: Text(getTranslated(context,'camera'),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () => selectFromImagePicker(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green[900]),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green[900],
                      ),
                      child: Text(getTranslated(context,'gallery'),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),


              _image == null ? Container(  height: 250 ,width:250 ,  decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple),
                        ),child: Center(child: Text(getTranslated(context,'nis'),style: TextStyle(color:Colors.grey),)))
              
               : Container(
                  decoration: BoxDecoration(
                          border: Border.all(color: Colors.green[900]),),
                height: 250,
                child: Image.file(_image)),

                SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => detect(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[900]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green[900],
                  ),
                  child: Text(getTranslated(context,'detect'),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              new Container(
                height: 200.0,
                child: ListView.builder(
                  itemCount: _recognitions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Center(
                        child: Text("Results:"+_recognitions[index]['label'],  style: TextStyle(
                        fontSize: 22,
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1)),
                      ),
                      subtitle: Center(
                        child: Text(
                            "Confidence ${_recognitions[index]['confidence'].toString()}", style: TextStyle(
                        fontSize: 15,
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
   ],

        ),
      )
      ,
     
    );
  }
}
