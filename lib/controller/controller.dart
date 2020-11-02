import 'package:SmartAgriculture/classes/language.dart';
import 'package:SmartAgriculture/localization/language_constants.dart';
import 'package:SmartAgriculture/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Controller extends StatefulWidget {
  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
   bool switchControl = false;
    bool switchControlw = false;
     bool switchControll = false;
   var _firebaseRef = FirebaseDatabase().reference().child('Fan');
    var _firebaseRefw = FirebaseDatabase().reference().child('Motor');
     var _firebaseRefl = FirebaseDatabase().reference().child('Light');


void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }




     @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
     _firebaseRefw.once().then((DataSnapshot datasnapshot){
               
                var bv= (datasnapshot.value["status"]);
                 if(bv=="OFF")
                 {
                   setState(() {
                     switchControlw=false;
                   });
                  
                 }
                 else
                 {
                    setState(() {
                     switchControlw=true;
                     
                   });
                 
                     
                 }
     }
     );

     _firebaseRefl.once().then((DataSnapshot datasnapshot){
                var bv= (datasnapshot.value["status"]);
                 if(bv=="OFF")
                 {
                   setState(() {
                     switchControll=false;
                   });
                 }
                 else
                 {
                    setState(() {
                     switchControll=true;
                   });
                 }
     }
     );

     _firebaseRef.once().then((DataSnapshot datasnapshot){
                var bv= (datasnapshot.value["status"]);
                 if(bv=="OFF")
                 {
                   setState(() {
                     switchControl=false;
                   });
                 }
                 else
                 {
                    setState(() {
                     switchControl=true;
                   });
                 }
     }
     );

    
  }
  
  void toggleSwitch(bool value) {
 
      if(switchControl == false)
      {
        setState(() {
          switchControl = true;
           _firebaseRef.update({
            "status": "ON",
        
    });
          
        });
        print('Switch is ON');
         Fluttertoast.showToast(
                      msg: "Fan is ON",
                      toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.BOTTOM,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.green[800],
                       textColor: Colors.white,
                       fontSize: 24.0
    );
      }
      else
      {
        setState(() {
          switchControl = false;
         
           _firebaseRef.update({
        "status": "OFF",
        });
        print('Switch is ON');
         Fluttertoast.showToast(
                      msg: "Fan is OFF",
                      toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.BOTTOM,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.green[800],
                       textColor: Colors.white,
                       fontSize: 24.0
    );
        });
        // Put your code here which you want to execute on Switch OFF event.
      }
  }
   void toggleSwitchw(bool value) {
 
        

      
      if(switchControlw == false)
      {
        setState(() {
          switchControlw = true;
           _firebaseRefw.update({
            "status": "ON",
        
    });
          
        });
        print('Switch is ON');
         Fluttertoast.showToast(
                      msg: "Water Motor is ON",
                      toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.BOTTOM,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.green[800],
                       textColor: Colors.white,
                       fontSize: 24.0
    );
        // Put your code here which you want to execute on Switch ON event.
 
      }
      else
      {
        setState(() {
          switchControlw = false;
         
           _firebaseRefw.update({
        "status": "OFF",
        });
        print('Switch is ON');
         Fluttertoast.showToast(
                      msg: "Water Motor is OFF",
                      toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.BOTTOM,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.green[800],
                       textColor: Colors.white,
                       fontSize: 24.0
    );
        });
        // Put your code here which you want to execute on Switch OFF event.
      }
  }
   void toggleSwitchl(bool value) {
 
      if(switchControll == false)
      {
        setState(() {
          switchControll = true;
           _firebaseRefl.update({
            "status": "ON",
        
    });
          
        });
        print('Switch is ON');
         Fluttertoast.showToast(
                      msg: "Light is ON",
                      toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.BOTTOM,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.green[800],
                       textColor: Colors.white,
                       fontSize: 24.0
    );
        // Put your code here which you want to execute on Switch ON event.
 
      }
      else
      {
        setState(() {
          switchControll = false;
         
           _firebaseRefl.update({
        "status": "OFF",
        });
        print('Switch is ON');
         Fluttertoast.showToast(
                      msg: "Light is OFF",
                      toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.BOTTOM,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.green[800],
                       textColor: Colors.white,
                       fontSize: 24.0
    );
        });
        // Put your code here which you want to execute on Switch OFF event.
      }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.blue,title: Text(getTranslated(context,'Controller')),elevation: 0.0,
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
          body:Container(

              decoration: BoxDecoration(
                   gradient: LinearGradient(colors: [Colors.blue,Colors.green],begin: Alignment.topCenter,end:Alignment.bottomCenter, ),
                 ),
                  alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top:58.0),
              child: Column( 
                   
                    children:[ 
                     
                     Text(getTranslated(context,'mc'),style:TextStyle(color: Colors.white,fontSize: 36.0,fontWeight: FontWeight.bold,)),
                     SizedBox(height:80.0),
                  Row(
                          children: <Widget>[
                             SizedBox(width:30),
                   Column(
                     children: <Widget>
                       [
                        
                   Text(getTranslated(context,'motor'),style:TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold,)),
                    SizedBox(height:50.0),
                    Text(getTranslated(context,'fan'),style:TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold,)),
                     SizedBox(height:50.0),
                     Text(getTranslated(context,'light'),style:TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold,)),


                   ],),
                  SizedBox(width:120),
                   
                   Column(children: <Widget>[
                             Switch(
                          onChanged: toggleSwitchw,
                          value: switchControlw,
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        ),
                        SizedBox(height:50.0),
                        Switch(
                          onChanged: toggleSwitch,
                          value: switchControl,
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        ),
                        SizedBox(height:50.0),
                          Switch(
                          onChanged: toggleSwitchl,
                          value: switchControll,
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        ),  
                         



                   ],)
                          ],
                  ),
                  ],
                ),
            ),
          ),
    );
  }
  }
