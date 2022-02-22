import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/home.dart';

void main() => runApp(Cronometro());

class Cronometro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cronómetro',
      theme: ThemeData(
        primarySwatch: Colors.green,
        buttonColor: Colors.white
      ),
      home: Home()
    );
  }
}








/*import 'package:flutter/material.dart';
class Brujula extends StatelessWidget {
  const Brujula({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan,
      );
    
  }
}*/