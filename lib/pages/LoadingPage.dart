import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather/API.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void setupWeather() async{
    print('creating instance');
    Weather instance = new Weather(city: 'Jakarta');
    await instance.getWeather();
    print('navigate to home');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'weather' : instance.weather,
      'iconUrl' : instance.iconUrl,
      'city'    : instance.city,
    });
  }

  @override

  void initState(){
    super.initState();
    print('init success');
    setupWeather();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 50,
        )
      ),
    );
  }
}
