import 'package:flutter/material.dart';

// StatefulWidget yomken ta3meli mochkla
class Profil extends StatefulWidget {
  const Profil({super.key});
  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  int selectedindex = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("profil"),
        ),
        body: ListView(
          children: [],
        ));
  }
}
