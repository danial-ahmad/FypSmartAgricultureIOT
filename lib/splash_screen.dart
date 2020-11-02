import 'dart:async';
import 'package:SmartAgriculture/dashboard2.dart';
import 'package:SmartAgriculture/dashboard3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

 
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context)=>Dashboard2()));
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeInExpo);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
         decoration: BoxDecoration(
                   gradient: LinearGradient(colors: [Colors.white,Colors.lightGreenAccent],begin: Alignment.topRight,end:Alignment.bottomLeft, ),
                 ),
                  alignment: Alignment.center,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Container(
                   width: animation.value * 300,
                  height: animation.value * 120,
                  child: Padding(padding: EdgeInsets.only(bottom: 70.0),
                  child:new Text("Solution for Farmers",style: TextStyle(fontSize: 28.0,),)),
                )


            ],),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'assets/al.png',
                  width: animation.value * 320,
                  height: animation.value * 320,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
