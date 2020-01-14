import 'package:http/http.dart';
import 'dart:convert';


class Weather{

  //setup variable
  String weather;
  String iconUrl;
  String city;
  String apikey = '6d6ada8f4ead9ebf2a370d0b30ef97ca';

  //constructor
  Weather({this.city});

  //Future or async function
  Future<void> getWeather() async {
    try {
      //calling api
      Response response = await get('http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey');
      Map data = jsonDecode(response.body);

      //mapping data
      Map curentweather = data['weather'][0];
      this.weather = curentweather['main'];
      this.iconUrl = 'http://openweathermap.org/img/wn/'+curentweather['icon']+'@2x.png';
    }
    catch (e) {
      print(e);
      this.weather='Connection Error';
      this.iconUrl=' ';
    }
  }
}
