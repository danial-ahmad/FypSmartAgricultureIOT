import 'package:SmartAgriculture/classes/language.dart';
import 'package:SmartAgriculture/data_visualization/ldr/ldr_modal.dart';
import 'package:SmartAgriculture/localization/language_constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marquee/marquee.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../main.dart';
class Light extends StatefulWidget {
  @override
  _LightState createState() => _LightState();
}

class _LightState extends State<Light> {
   DatabaseReference _dhtRefl =
      FirebaseDatabase.instance.reference().child('sensor').child('ldr');
      String lightStatus;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lightStatus = "Showing Light intensity Soon ...";
  }
   void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title:Text(getTranslated(context,'li')),centerTitle:true,
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
          body: Container(
           decoration: BoxDecoration(
                     gradient: LinearGradient(colors: [Colors.white,Colors.blueAccent],begin: Alignment.topCenter,end:Alignment.bottomCenter, ),
                   ),
                    alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: 30,
                child: _buildMarquee(),
              ),
              Expanded(
                child: StreamBuilder(
                    stream: _dhtRefl.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data.snapshot.value != null) {
                        var _ldr =
                            LDR.fromJson(snapshot.data.snapshot.value['-M1WPCrCZMVqKUjRkjaL']);
                        print(
                            "LDR: ${_ldr.light_intensity} / ${_ldr.light_status} ");
                           _setMarqueeText(_ldr);
                        return _lightLayout(_ldr);
                      } else {
                        return Center(
                     child: SpinKitFadingCube(
                       color:Colors.blue[900],
                       size:50.0,
        )
      );
                      }
                    }),
              ),
            ],
          ),
        ),
    );
  }


    Widget _lightLayout(LDR _ldr) {
    return Center(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40),
          child: Text(
            getTranslated(context,'li'),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 10.0,
                percent: (_ldr.light_intensity)/1000000,
                animation: true,
                animationDuration: 1200,
               
                
                center: new Icon(
                  MaterialCommunityIcons.lightbulb,
                  size: 100.0,
                  color: Colors.yellow[800],
                ),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue[900],
              ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            "${_ldr.light_intensity}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        )
      ],
    ));
  }
  

_setMarqueeText(LDR _ldr) {
    lightStatus = "Light is: ${_ldr.light_status}          ";
    
  }



   Widget _buildMarquee() {
    return Marquee(
      text: lightStatus,
      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20,color: Colors.blue[900]),
    );
  }
}
  