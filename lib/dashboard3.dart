import 'package:SmartAgriculture/chatbot/farmerbot.dart';
import 'package:SmartAgriculture/controller/controller.dart';
import 'package:SmartAgriculture/data_visualization/datamainpage.dart';
import 'package:SmartAgriculture/data_visualization/dht/dht.dart';
import 'package:SmartAgriculture/expense_cal/expenseCal.dart';
import 'package:SmartAgriculture/weather/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class Dashboard3 extends StatelessWidget {
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
                  SizedBox(height: 70.0),
                Text("Solution for Farmers",style: TextStyle(fontSize: 32.0,color: Colors.white,),),
                 SizedBox(height: 10.0),
                 
              
                Expanded(
                                  child: ListWheelScrollView( 
                        
                        diameterRatio: 1.5,
                      physics: FixedExtentScrollPhysics(),
                     itemExtent: 200,
                    
                    children: <Widget>[
                        
                              GestureDetector(
                               onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context)=>Controller()));},
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
                                            'assets/swi.png',
                                              width:  70,
                                              height:  70,
                        ),
                          Center(child: Text("Controller",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)))
                                      ], 
                                     ),
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
                          Center(child: Text("       Data Visualization",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)))
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
                          Text("Weather",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
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
                          Text("Farmer Bot",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
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
                                            'assets/pdp.png',
                                              width:  70,
                                              height:  70,
                        ),
                        
                          Center(child: Text("Plant Disease",style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold))),
                          Center(child: Text("Predictor",style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold)))            
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
                          Center(child: Text("Expense",style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold))),
                          Center(child: Text("Calculator",style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold)))            
                                      ], 
                                     ),
                                   ),
                                 ),
                               ),
                             ),
         
                  ],),
                ),
               ]
               ),
               ),
               ),
               )
     ;
   }
 }