import 'dart:async';

import 'package:flutter/material.dart';

import '../button_widget.dart';

void main() {
  runApp(const Temporizador());
}

class Temporizador extends StatelessWidget {
  const Temporizador({Key? key}) : super(key: key);

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
  static const maxSeconds=60;

  int seconds=maxSeconds;
  Timer? timer;

  void resetTimer()=>setState(()=>seconds=maxSeconds);

  void startTimer({bool reset=true}) {
    if(reset){
      resetTimer();
    }
    timer=Timer.periodic(Duration(seconds:1),(_){
      if(seconds>0){
        setState(()=>seconds--);
      }else{
        stopTimer(reset:false);
      }
      
    });
  }
  void stopTimer({bool reset = true}) {
    if(reset){
      resetTimer();
    }
    setState(()=>timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTimer(),
              const SizedBox(height:80),
              buildButtons(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildButtons(){
    final isRunning= timer==null ? false: timer!.isActive;
    final isCompleted=seconds==maxSeconds ||seconds==0;
      return isRunning || !isCompleted
      ? Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          ButtonWidget(
            text:isRunning ? 'Pause':'Resume',
            onClicked:(){
              if(isRunning){
                stopTimer(reset:false);
              }else{
                startTimer(reset:false);
              }
              
            } ,),
            const SizedBox (width:12),
            ButtonWidget(
              text:'Cancel',
              onClicked:stopTimer,
            )
        ],
      ):
      ButtonWidget(
        text:'Start Timer!',
        color:Colors.black,
        backgroundColor: Colors.white,
         onClicked: () { 
           startTimer();
          },
      );
    }

    Widget buildTimer()=>SizedBox(
      width:200,
      height: 200,
      child: 
        Stack(
          fit:StackFit.expand,
          children: [
            CircularProgressIndicator(value:1-seconds/maxSeconds ,
            valueColor:AlwaysStoppedAnimation(Colors.white),
            strokeWidth:12,
            backgroundColor:Colors.greenAccent),

              Center(child: buildTime())
        ],
      
    ));



    Widget buildTime(){
      if(seconds==0){
        return Icon(Icons.done,color:Colors.greenAccent,size:112);
      }


      return Text('$seconds',
      style:TextStyle(
        fontWeight:FontWeight.bold,
        color:Colors.white,
        fontSize:80,

      ),
      
      );
    }
}