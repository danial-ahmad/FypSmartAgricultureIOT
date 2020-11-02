import 'package:SmartAgriculture/data_visualization/charts/chart.dart';
import 'package:SmartAgriculture/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:SmartAgriculture/pages/about_page.dart';
import 'package:SmartAgriculture/pages/home_page.dart';
import 'package:SmartAgriculture/pages/not_found_page.dart';
import 'package:SmartAgriculture/pages/settings_page.dart';
import 'package:SmartAgriculture/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => AnimatedSplashScreen());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
