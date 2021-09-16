import 'package:fitness_app/exerciseHub.dart';
import 'package:flutter/material.dart';

import 'dart:async';


class ExerciseScreen extends StatefulWidget {
final ExerciseHubExercises exercises;
final int seconds;


ExerciseScreen({required this.exercises,required this.seconds});
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {

   bool _isCompleted =false;
  int _elapsedSeconds =0;

   late Timer timer;

   @override
  void initState() {
    // TODO: implement initState

 timer =    Timer.periodic(const Duration(seconds: 1), (t) {
       if(t.tick==widget.seconds){
         t.cancel();
         setState(() {
           _isCompleted=true;

         });
       }
       setState(() {
         _elapsedSeconds =t.tick;
       });

     });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _isCompleted!=true?   Scaffold(
          backgroundColor: Colors.white,
          body:  Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: FadeInImage(
                    image: NetworkImage(widget.exercises.gif.toString()),
                    placeholder: AssetImage("assets/placeholder.jpg"),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
             Container(
                margin: EdgeInsets.only(top: 60),
                alignment: Alignment.topCenter,
                child: Text("$_elapsedSeconds/${widget.seconds}S",style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30,

                ),),
              ),
            ]
          )

        ):Container(
    color: Colors.white,
    ),
      ],
    );
  }
}
