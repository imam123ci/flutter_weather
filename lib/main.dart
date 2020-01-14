import 'package:flutter/material.dart';
import 'package:flutter_weather/pages/HomePage.dart';
import 'package:flutter_weather/pages/LoadingPage.dart';
import 'package:flutter_weather/pages/LocationPage.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context)=> LoadingPage(),
    '/home' : (context)=> HomePage(),
    '/location' : (context)=> LocationPage(),
  },
));

