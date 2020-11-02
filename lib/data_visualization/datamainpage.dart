import 'package:SmartAgriculture/data_visualization/dht/dht.dart';
import 'package:SmartAgriculture/data_visualization/ldr/light.dart';
import 'package:SmartAgriculture/data_visualization/soilmoistureandtemp/temp.dart';
import 'package:SmartAgriculture/localization/language_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class DataMain extends StatefulWidget {
  @override
  _DataMainState createState() => _DataMainState();
}

class _DataMainState extends State<DataMain> {
 
  int currentTabIndex=0;
 List <Widget> pages;
  Widget currentPage;
  DhtData dhtdata;
  Light light;
  SoilTemp soiltemp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     dhtdata=DhtData();
     light=Light();
     soiltemp=SoilTemp();

    pages=[dhtdata,light,soiltemp];
    currentPage=dhtdata;
  }



  @override
  Widget build(BuildContext context) {
     return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        onTap: (int index){
          setState(() {
            currentTabIndex=index;
            currentPage=pages[index];
          });
        },
          currentIndex: currentTabIndex,
         
          items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Icon(MaterialCommunityIcons.thermometer_alert),title: Text(getTranslated(context,'tah'))),
          BottomNavigationBarItem(icon:Icon(MaterialCommunityIcons.lightbulb),title: Text(getTranslated(context,'li'))),
          BottomNavigationBarItem(icon:Icon(MaterialCommunityIcons.thermometer),title: Text(getTranslated(context,'st'))),
             
          ],

      ),
      body: currentPage,
      

    );
  }
}