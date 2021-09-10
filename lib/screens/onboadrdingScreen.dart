// ignore: file_names

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  dynamic pages = [
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(child: Image.network("https://github.com/NabeelMS1997/assets/blob/main/screen1.png?raw=true", height: 200.0,width: 200,)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(child: Image.network("https://github.com/NabeelMS1997/assets/blob/main/screen2.png?raw=true", height: 200.0,width: 200,)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(child: Image.network("https://github.com/NabeelMS1997/assets/blob/main/screen3.png?raw=true", height: 200.0,width: 200,)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: pages,
      onDone: () {
        // When done button is press
      },
      onSkip: () {
        // You can also override onSkip callback
      },
      showSkipButton: true,
      skip: const Icon(Icons.skip_next),
      next: const Icon(Icons.arrow_right),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.deepOrange,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    ));
  }
}
