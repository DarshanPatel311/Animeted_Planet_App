import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled1/home/home_screen.dart';

import 'Favorite/favorite_screen.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to next screen after 3 seconds (adjust duration as needed)
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, PageTransition(duration : Duration(seconds: 1),type: PageTransitionType.leftToRight, child: HomeScreen()));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 900,
        width: double.infinity,
        child: Image.asset('assets/img/Screenshot 2024-07-14 215546.png',fit: BoxFit.cover,),
      ),
    );
  }

}

