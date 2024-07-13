import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/home/planet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff1E72BA),
                  Color(0xff2c1f6e),
                ])),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Image.asset(
                  'assets/img/bg_stars.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [

                  Padding(

                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.asset('assets/img/ic_menu.png', width: 20,),
                        Spacer(),
                        Image.asset('assets/img/ic_avatar.png', width: 30,)
                      ],
                    ),
                  ),
                  Expanded(child: Column(children: [
                    Text("Space\nExplorer", style: TextStyle(

                      fontSize: 45,
                      fontWeight: FontWeight.bold,


                    ),),
                    Expanded(
                      child: CarouselSlider(items: [
                        Planet("assets/img/img_mars.png", "Mars", "Mars has seasons, polar ice caps, volcanoes, canyons, and weather.... "),
                        Planet("assets/img/img_earth.png", "Earth", "The third planet from the sun and the only astronomical thing that....."),
                        Planet("assets/img/img_venus.png", "Venus", "The second planet from the Sun, and the sixth largest planet..... "),

                      ], options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 0.9,
                        enlargeCenterPage: true,
                        viewportFraction: 0.6,
                      )),)
                  ],),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/ic_avatar_1.png',width: 30,),
                      Image.asset('assets/img/ic_avatar_2.png',width: 30,),
                      Image.asset('assets/img/ic_avatar_3.png',width: 30,),
                      Image.asset('assets/img/ic_avatar_4.png',width: 30,),

                    ],
                  ), Text("John, evelin and 8 friends are online", style: TextStyle(
                      fontSize: 10,
                  ),),
                  SizedBox(height: 20,)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
