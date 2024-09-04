import 'package:flutter/material.dart';

// StatefulWidget yomken ta3meli mochkla
class Quiz1 extends StatefulWidget {
  const Quiz1({super.key});
  @override
  State<Quiz1> createState() => _Quiz1State();
}

class _Quiz1State extends State<Quiz1> {
  int selectedindex = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("quiz1"),
        ),
        body: ListView(
          children: [],
        ));
  }
}
