import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/planet_provider.dart';
import 'package:untitled1/splesh_screen.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PlanetProvider(),)
  ],child: const MyApp(),),);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness:  Brightness.dark
      ),
      home: SpleshScreen(),

    );
  }
}



