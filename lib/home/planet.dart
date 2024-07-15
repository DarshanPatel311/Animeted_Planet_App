import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../details/details_screen.dart';
import '../provider/planet_provider.dart';

class Planet extends StatefulWidget {
  final String planetName;
  final String img;
 final String description;

  Planet(this.img,this.planetName,this.description);

  @override
  State<Planet> createState() => _PlanetState();


}

class _PlanetState extends State<Planet> with TickerProviderStateMixin{
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
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80, bottom: 30),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),

          ),
          color: Colors.white,
          child: Container(
            width: double.infinity,
            height: size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 110,
                  ),
                  Text(widget.planetName,style:TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.start
                  ),
                  SizedBox(height: 20,),
                  Text(widget.description,style: TextStyle(
           color: Colors.black54,
                    fontWeight: FontWeight.bold
                  ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: AnimatedBuilder(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
// color: Colors.teal
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.img),
// image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxXnC3fwMwkbIt3ejGRIw3NmbDyUtgS5g2jA&s"),
                  )),
            ),
            animation: animationController,
            builder: (context, child) {
              return RotationTransition(turns: animationController,child: child,);
            },),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
            ),
            child: GestureDetector(
              onTap: () {

                Navigator.push(context, PageTransition(duration : Duration(seconds: 1),type: PageTransitionType.leftToRight, child: DetailsScreenils()));

              },
              child: Hero(
                tag: '1',
                child: Container(
                  height: 50,
                    width: 50,
                  child: Card(
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),

                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

