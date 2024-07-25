import 'package:flutter/material.dart';
import 'package:request_api/models/wheather_model.dart';
import 'package:request_api/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WheatherModel> _weaters = [];

  void _getWheatherdata() async {
    _weaters = await WeatherService().getWheatherData();
    setState(() {});
    ;
  }

  @override
  void initState() {
    _getWheatherdata();
    print("object");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        itemCount: _weaters.length,
        itemBuilder: (context, index) {
          final WheatherModel hava = _weaters[index];
          return Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Text(hava.tesviri ?? ""),
              ],
            ),
          );
        },
      )),
    );
  }
}
