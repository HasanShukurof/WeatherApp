import 'package:flutter/material.dart';
import 'package:request_api/screens/home_page.dart';

void main(List<String> args) {
  runApp(RequestApi());
}

class RequestApi extends StatelessWidget {
  const RequestApi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Wheather App"),
        ),
        body: const HomePage(),
      ),
    );
  }
}
