// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_archive/main.dart';
import 'package:material_archive/screenshot_lib/main.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => RootApp(),
        );
      case '/screenshot':
        return MaterialPageRoute(
          builder: (context) => ScreenshotApp(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => RootApp(),
        );
    }
  }
}
