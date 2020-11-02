import 'package:SmartAgriculture/chatbot/farmerbot.dart';
import 'package:SmartAgriculture/classes/language.dart';
import 'package:SmartAgriculture/controller/controller.dart';
import 'package:SmartAgriculture/data_visualization/datamainpage.dart';
import 'package:SmartAgriculture/data_visualization/dht/dht.dart';
import 'package:SmartAgriculture/expense_cal/expenseCal.dart';
import 'package:SmartAgriculture/localization/language_constants.dart';
import 'package:SmartAgriculture/main.dart';
import 'package:SmartAgriculture/plant_disease/pd.dart';
import 'package:SmartAgriculture/plant_disease/screens/detect_screen.dart';
import 'package:SmartAgriculture/weather/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class Dashboard2 extends StatefulWidget {
  @override
  _Dashboard2State createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
   void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
       
        body: SafeArea(
                  child: 
                  
                  Container(
                     decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/bgmenu.jpg"),fit: BoxFit.fill),
            ),
            alignment: Alignment.center,
                                      child: 
             Column(
               children: <Widget>[
                 
                  DropdownButton<Language>(
          iconSize: 30,
          hint: Text(getTranslated(context,'change_language'),style: TextStyle(color: Colors.white),),
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
         SizedBox(height: 40.0),
                Text(getTranslated(context, 'sof'),style: TextStyle(fontSize: 32.0,color: Colors.white,),),
                 SizedBox(height: 10.0),
                 Expanded(
                                child: CustomScrollView(
                                  shrinkWrap: false,
  primary: false,
  slivers: <Widget>[
    SliverPadding(
      padding: const EdgeInsets.all(35),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
           GestureDetector(
                               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (Context)=>Controller()));},
                                   child: Card(
                                     
                                    elevation: 9.0,
                                     color: Colors.white,
                                 child: Padding(
                                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                          'assets/swi.png',
                                            width:  70,
                                            height:  70,
                        ),
                          Text(getTranslated(context, 'Controller'),style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                    ], 
                                   ),
                                 ),
                               ),
                             ),
         GestureDetector(
                               onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context)=>DataMain()));},
                                   child: Card(
                                    elevation: 9.0,
                                     color: Colors.white,
                                 child: Padding(
                                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                   child: Center(
                                     child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                            'assets/dana.png',
                                              width:  70,
                                              height:  70,
                        ),
                          Center(child: Text(getTranslated(context, 'Data_visualization'),style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)))
                                      ], 
                                     ),
                                   ),
                                 ),
                               ),
                             ),
          GestureDetector(
                               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (Context)=>WeatherApp()));},
                                   child: Card(
                                    elevation: 9.0,
                                     color: Colors.white,
                                 child: Padding(
                                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                   child: Center(
                                     child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                            'assets/wea.png',
                                              width:  70,
                                              height:  70,
                        ),
                          Text(getTranslated(context, 'Weather'),style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                      ], 
                                     ),
                                   ),
                                 ),
                               ),
                             ),
         GestureDetector(
                               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (Context)=>HomePageDialogflow()));},
                                   child: Card(
                                    elevation: 9.0,
                                     color: Colors.white,
                                 child: Padding(
                                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                   child: Center(
                                     child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                            'assets/bott.png',
                                              width:  70,
                                              height:  70,
                        ),
                          Text(getTranslated(context, 'Farmerbot'),style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                      ], 
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                            
         GestureDetector(
                               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (Context)=>Detector()));},
                                   child: Card(
                                    elevation: 9.0,
                                     color: Colors.white,
                                 child: Padding(
                                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                   child: Center(
                                     child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                            'assets/pdp.png',
                                              width:  70,
                                              height:  70,
                        ),
                        
                          Center(child: Text(getTranslated(context, 'plantdisease'),style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold))),
                          Center(child: Text(getTranslated(context, 'predictor'),style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold)))            
                                      ], 
                                     ),
                                   ),
                                 ),
                               ),
                             ),
           GestureDetector(
                               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (Context)=>ExpenseCal()));},
                                   child: Card(
                                    elevation: 9.0,
                                     color: Colors.white,
                                 child: Padding(
                                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                   child: Center(
                                     child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        
                                        Icon(MaterialCommunityIcons.calculator_variant,size: 50.0,color: Colors.lightGreen,),
                                        SizedBox(height:10.0),
                          Center(child: Text(getTranslated(context, 'Expense'),style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold))),
                          Center(child: Text(getTranslated(context, 'cal'),style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold)))            
                                      ], 
                                     ),
                                   ),
                                 ),
                               ),
                             ),
        ],
      ),
    ),
  ],
),
                 ),
               ],
             ),
                                    
                                    
                  ),
        ),
     );
   }
}