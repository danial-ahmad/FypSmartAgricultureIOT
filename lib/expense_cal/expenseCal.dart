import 'package:SmartAgriculture/classes/language.dart';
import 'package:SmartAgriculture/localization/language_constants.dart';
import 'package:flutter/material.dart';

import '../main.dart';



class ExpenseCal extends StatefulWidget {
  @override
  _ExpenseCalState createState() => _ExpenseCalState();
}

class _ExpenseCalState extends State<ExpenseCal> {
  
   void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);}
  
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  var fuel;
  var pest;
  var water;
  var seed;
  var lab;
  var land;
  double total;
  String totalshow;

  sum(){
    
total=double.parse(fuel)+double.parse(pest)+double.parse(water)+double.parse(seed)+double.parse(lab)+double.parse(land);
totalshow=total.toString();
  }
 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context,'ec')),
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
      ) ,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       
                        Text(getTranslated(context,'eue'),
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1)),
                        SizedBox(
                          height: 5,
                        ),
                        
                        SizedBox(
                          height: 50,
                        ),
                        Form(
                          key: _formKey,
                          autovalidate: _autoValidate,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                
                                TextField(
                                  
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                             labelText: getTranslated(context,'fe')),
                             onChanged: (value) {
                    setState(() {
                      fuel = value;
                    });
                  }
                             
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                             labelText: getTranslated(context,'pe')),
                          onChanged: (value) {
                    setState(() {
                      pest = value;
                    });
                  }
                      ),
                       TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                             labelText:getTranslated(context,'we')),
                             onChanged: (value) {
                    setState(() {
                      water = value;
                    });
                  }
                      ),
                      TextField(
                         keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                           
                            labelText: getTranslated(context,'se')),
                            onChanged: (value) {
                    setState(() {
                      seed = value;
                    });
                  }
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            
                            labelText: getTranslated(context,'le')),
                            onChanged: (value) {
                    setState(() {
                      lab = value;
                    });
                  }
                      ),
                        TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            
                            labelText: getTranslated(context,'lae')),
                            onChanged: (value) {
                    setState(() {
                      land = value;
                    });
                  }
                      ),



                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width:40),
                                    GestureDetector(
                                      onTap: (){
                                        sum();
                                        _showMyDialog();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.green[900],
                                        ),
                                        child: Text(getTranslated(context,'calc'),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                  
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(getTranslated(context,'yei')),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(totalshow,style: TextStyle(fontSize: 30),),
             
            ],
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            child: Text(getTranslated(context,'cancel')),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  
 
}
