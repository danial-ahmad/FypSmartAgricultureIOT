import 'dart:async';
import 'package:SmartAgriculture/classes/language.dart';
import 'package:SmartAgriculture/data_visualization/dht/dht_modal.dart';
import 'package:SmartAgriculture/localization/language_constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wave_progress_widget/wave_progress.dart';

import '../../main.dart';



class DhtData extends StatefulWidget {
  @override
  _DhtDataState createState() => _DhtDataState();
}

class _DhtDataState extends State<DhtData>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int tabIndex = 0;

  
  DatabaseReference _dhtRef =
      FirebaseDatabase.instance.reference().child('sensor').child('dht');

  bool _signIn;
  String heatIndexText;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _signIn = false;
    heatIndexText = "Showing Heat Index Here Soon ...";

    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (_signIn) {
        setState(() {});
      }
    });

  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer.cancel();
    super.dispose();
  }
 void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);}
  @override
  Widget build(BuildContext context) {
    return  mainScaffold();
  }

  Widget mainScaffold() {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(getTranslated(context,'tah'), style: TextStyle(fontSize:17),),
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
       
        bottom: TabBar(
          controller: _tabController,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          tabs: [
            Tab(
              icon: Icon(MaterialCommunityIcons.temperature_celsius),
            ),
            Tab(
              icon: Icon(MaterialCommunityIcons.water_percent),
            )
          ],
        ),
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
                  stream: _dhtRef.onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        !snapshot.hasError &&
                        snapshot.data.snapshot.value != null) {
                      var _dht =
                          DHT.fromJson(snapshot.data.snapshot.value['-M-FYf4wK-FA7gtbKJOU']);
                      print(
                          "DHT: ${_dht.temp} / ${_dht.humidity} / ${_dht.heatIndex}");
                      _setMarqueeText(_dht);
                      return IndexedStack(
                        index: tabIndex,
                        children: [
                          _temperatureLayout(_dht),
                          _humidityLayout(_dht)
                        ],
                      );
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

  Widget _temperatureLayout(DHT _dht) {
    return Center(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40),
          child: Text(
           getTranslated(context,'temp'),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: FAProgressBar(
              progressColor: Colors.green,
              direction: Axis.vertical,
              verticalDirection: VerticalDirection.up,
              size: 100,
              currentValue: _dht.temp.round(),
              changeColorValue: 100,
              changeProgressColor: Colors.red,
              maxValue: 150,
              displayText: "°C",
              borderRadius: 16,
              animatedDuration: Duration(milliseconds: 500),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            "${_dht.temp.toStringAsFixed(2)} °F",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        )
      ],
    ));
  }

  Widget _humidityLayout(DHT _dht) {
    return Center(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40),
          child: Text(
            getTranslated(context,'hun'),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: WaveProgress(
                  180.0, Colors.blue[900], Colors.blue, _dht.humidity)),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            "${_dht.humidity.toStringAsFixed(2)} %",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        )
      ],
    ));
  }

  _setMarqueeText(DHT _dht) {
    heatIndexText = "Heat Index: ${_dht.heatIndex.toStringAsFixed(2)} °F, ";
    if (_dht.heatIndex > 80 && _dht.heatIndex <= 90) {
      heatIndexText +=
          "Caution: fatigue is possible with prolonged exposure and activity. Continuing activity could result in heat cramps. ";
    } else if (_dht.heatIndex > 90 && _dht.heatIndex <= 105) {
      heatIndexText +=
          "Extreme caution: heat cramps and heat exhaustion are possible. Continuing activity could result in heat stroke. ";
    } else if (_dht.heatIndex > 105 && _dht.heatIndex <= 130) {
      heatIndexText +=
          "Danger: heat cramps and heat exhaustion are likely; heat stroke is probable with continued activity. ";
    } else if (_dht.heatIndex > 130) {
      heatIndexText += "Extreme danger: heat stroke is imminent. ";
    } else {
      heatIndexText += "Normal. ";
    }
  }

  Widget _buildMarquee() {
    return Marquee(
      text: heatIndexText,
      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20,color: Colors.blue[900]),
    );
  }

 

  
}