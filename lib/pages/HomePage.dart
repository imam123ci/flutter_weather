import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map dt = {};

  @override
  Widget build(BuildContext context) {
    dt = dt.isNotEmpty ? dt : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3.0, 100.0, 3.0, 5.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 27,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      dt['city'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
                Image.network(
                  dt['iconUrl'],
                  scale: 0.8,
                  color: Colors.white,
                ),
                Text(
                  dt['weather'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
          dynamic result = await Navigator.pushNamed(context, '/location');
          setState(() {
            dt = result != null ? result: dt;
          });
        },
        icon: Icon(
          Icons.settings,
          color: Colors.deepPurple[500],
        ),
        label: Text(
          'Change Location',
          style: TextStyle(
            color: Colors.deepPurple[500],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
