// ignore_for_file: file_names



import 'package:fitness_app/exerciseHub.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String apiURL ="https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json"   ;

 late ExerciseHub exerciseHub;
   @override
  void initState() {


    getExercise();



    super.initState();
  }
  void getExercise() async{
  var response =await http.get(Uri.parse(apiURL));
  var body =response.body;
  var decodedJson= jsonDecode(body);

  exerciseHub =ExerciseHub.fromJson(decodedJson);

  setState(() {


  });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:const Text("Test"),

      ),
      
      body: Container(

        child: exerciseHub != null ? ListView.builder(itemBuilder: (ctx,index){
          return Container(child:FadeInImage(
            image: ,
            placeholder: ,
            width:MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),);

        }):const LinearProgressIndicator(),
      ),
    );
  }
}
