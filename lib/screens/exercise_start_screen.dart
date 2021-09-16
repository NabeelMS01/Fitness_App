import 'package:flutter/material.dart';
import 'package:fitness_app/exerciseHub.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'exercise_screen.dart';

class ExerciseStartScreen extends StatefulWidget {
  final ExerciseHubExercises exercises;


  ExerciseStartScreen({required this.exercises});



  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
    int seconds =30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Hero(
              tag: widget.exercises.id.toString(),
              child: Image(
                image: NetworkImage(
                  widget.exercises.thumbnail.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF000000),
              Color(0x00000000),
            ], begin: Alignment.bottomCenter, end: Alignment.center)),
          ),
          Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                width: 200,
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(),
                  onChange: (double v) {

                setState(() {
                seconds=v.toInt();
                seconds=seconds;
                
                print(seconds);
                });
                  },
                  max: 60,
                  min: 10,
                  initialValue: 30,
                  innerWidget: (v) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${v.toInt()}  S",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              )),
          Positioned(
            bottom: 10, left: 125,


              child: Container(
                height: 50,width: 150,
                child: FlatButton(

            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                  ExerciseScreen(seconds: seconds,
                exercises: widget.exercises,

              )
              ));
            },
            color: Colors.redAccent,
            child: const Text("Start Exercise",style: TextStyle(fontSize: 18,color: Colors.black),),
          ),
              ))
        ],
      ),
    );
  }
}
