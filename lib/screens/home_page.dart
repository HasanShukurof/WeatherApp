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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: _weaters.length,
          itemBuilder: (context, index) {
            final hava = _weaters[index];
            print("HAVA IKONKALARI: ${hava.ikona}");
            return Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Text(hava.status!),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
