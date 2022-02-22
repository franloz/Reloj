import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/pages/cronometro.dart';
import 'package:flutter_application_7/pages/temporizador.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index=0;
  final screens=[
    Temporizador(),
    Cronometro()
    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      screens[index],

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueGrey,
        height: 50,
        index: index,
        items: const <Widget>[
          Icon(Icons.timelapse, size: 30),
          Icon(Icons.timer_rounded, size: 30),
      
        
        ],

        onTap: (index) {
          
          setState(() {
            this.index=index;
            
          });
        },
         
        
      ),
    );
  }
}
