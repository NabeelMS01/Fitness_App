import 'package:flutter/material.dart';
import 'package:fitness_app/exerciseHub.dart';

class ExerciseStartScreen extends StatefulWidget {
  final ExerciseHubExercises exercises;

  ExerciseStartScreen({required this.exercises});

  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height ,
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
    );
  }
}
