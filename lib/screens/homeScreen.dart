// ignore_for_file: file_names

import 'package:fitness_app/exerciseHub.dart';
import 'package:fitness_app/screens/exercise_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String apiURL =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  ExerciseHub? exerciseHub;

  @override
  void initState() {
    getExercise();

    super.initState();
  }

  void getExercise() async {
    var response = await http.get(Uri.parse(apiURL));
    var body = response.body;
    var decodedJson = jsonDecode(body);

    exerciseHub = ExerciseHub.fromJson(decodedJson);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitness App"),
      ),
      body: Container(
        child: exerciseHub != null
            ? ListView(
                children: exerciseHub!.exercises!.map((e) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                       ExerciseStartScreen(
                    exercises: e!,
                      )
                      ));
                    },

                    child: Hero(
                      tag: e!.id.toString(),
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: FadeInImage(
                                  image: NetworkImage(e.thumbnail.toString()),
                                  placeholder: AssetImage("assets/placeholder.jpg"),
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF000000),
                                      Color(0x00000000),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                  )),
                                ),
                              ),
                              Positioned(

                                height: 250,
                            top: 210,
                                left: 10,
                                child: Text(e.title.toString(),style: const TextStyle(
                                  color: Colors.white,fontSize: 20,shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 8.0,
                                    color: Colors.black,
                                  ),
                                ]
                                ),),
                              )
                            ],
                          )),
                    ),
                  );
                }).toList(),
              )
            : const LinearProgressIndicator(),
      ),
    );
  }
}
