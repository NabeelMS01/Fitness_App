// ignore: file_names

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'homeScreen.dart';

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
      image: Center(
          child: Image.asset(
        "assets/onboardingScreen/screen1.png",
        height: 200.0,
        width: 200,
      )),
      decoration: const PageDecoration(
          pageColor: Color(0xFF002970),
          bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          fullScreen: false),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(
          child: Image.asset(
        "assets/onboardingScreen/screen2.png",
        height: 200.0,
        width: 200,
      )),
      decoration: const PageDecoration(
        pageColor: Color(0xFF002970),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        fullScreen: false,
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(
          child: Image.asset(
        "assets/onboardingScreen/screen3.png",
        height: 200.0,
        width: 200,
      )),
      decoration: const PageDecoration(
        pageColor: Color(0xFF002970),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        fullScreen: false,
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: pages,
      onDone: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        // When done button is press
      },
      onSkip: () {
        // You can also override onSkip callback
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      },
      showSkipButton: true,
      skip: const Icon(Icons.skip_next),
      next: const Icon(Icons.arrow_right),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.orange,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    ));
  }
}

// IntroductionScreen(
//
// pages: pages,
//
// onDone: () {
// // When done button is press
// },
// onSkip: () {
// // You can also override onSkip callback
// },
// showSkipButton: true,
// skip: const Icon(Icons.skip_next),
// next: const Icon(Icons.arrow_right),
// done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
// dotsDecorator: DotsDecorator(
// size: const Size.square(10.0),
// activeSize: const Size(20.0, 10.0),
// activeColor: Colors.deepOrange,
//
// color: Colors.black26,
// spacing: const EdgeInsets.symmetric(horizontal: 3.0),
// activeShape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(25.0))),
// globalFooter: ,
// )
