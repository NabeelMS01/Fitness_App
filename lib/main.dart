import 'package:fitness_app/screens/onboadrdingScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false ,
      theme:  ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF002970),

        )
      ),
      home: OnBoardingScreen(),
    );
  }
}
