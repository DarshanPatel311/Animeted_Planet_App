import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/planet_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
      ..repeat();
  }
  @override
  Widget build(BuildContext context) {
    PlanetProvider ProviderT=Provider.of(context);
    PlanetProvider ProviderF=Provider.of(context,listen: false);
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
          child:Column(
            children: [
              SizedBox(height: 50,),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pop(context);

                    }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                    Text("Favorite ",style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),)
                  ],
                ),
              ),
              Stack(
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
                        Container(
                         child: Stack(
                           children: [
                             Container(
                               height: 90,
                               width: 400,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(30)
                               ),
                               margin: EdgeInsets.all(40),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text('Venus',style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                     fontSize: 20
                                   ),),

                                 ],
                               ),
                             ),

                             Align(
                               alignment: Alignment.topLeft,
                               child: AnimatedBuilder(
                                 child: Container(
                                   height: 120,
                                   width: 120,
                                   decoration: BoxDecoration(
              // color: Colors.teal
                                       image: DecorationImage(
                                         fit: BoxFit.cover,
                                         image: AssetImage(ProviderT.planets[0].image),
              // image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxXnC3fwMwkbIt3ejGRIw3NmbDyUtgS5g2jA&s"),
                                       )),
                                 ),
                                 animation: animationController,
                                 builder: (context, child) {
                                   return RotationTransition(turns: animationController,child: child,);
                                 },),
                             ),



                           ],
                         ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ],
          )
      ),
    );
  }
}
