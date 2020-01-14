import 'package:flutter/material.dart';
import 'package:flutter_weather/API.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<Weather> Cities = [
    Weather(city: 'Jakarta'),
    Weather(city: 'London'),
    Weather(city: 'Berlin'),
    Weather(city: 'Tokyo'),
    Weather(city: 'Cairo'),
    Weather(city: 'Delhi'),
    Weather(city: 'Ottawa')
  ];

  void UpdateLocation(i) async{
    Weather instance = Cities[i];
    await instance.getWeather();
    print('change loc success');
    Navigator.pop(context, {
      'weather' : instance.weather,
      'iconUrl' : instance.iconUrl,
      'city'    : instance.city,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        title: Text('Choose Your Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Cities.length,
        itemBuilder: (c, i){
         return Padding(
           padding: EdgeInsets.all(5.0),
           child: Card(
             child: ListTile(
               onTap: (){
                 print('change loc');
                 UpdateLocation(i);
               },
               title: Text(Cities[i].city),
             ),
           ),
         );
        }
      ),

    );
  }
}
