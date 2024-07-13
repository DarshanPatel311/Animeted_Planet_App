import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Planet extends StatefulWidget {
  final String planetName;
  final String img;
 final String description;

  Planet(this.img,this.planetName,this.description);

  @override
  State<Planet> createState() => _PlanetState();
}

class _PlanetState extends State<Planet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 85, bottom: 30),
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
                      height: 90,

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
             color: Colors.black54

                    ),

                    textAlign: TextAlign.start,
                    )

                  ],
                ),
              ),
            ),
          ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(widget.img,width: 200 ,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)
              ),
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
          )
        ],
      ),
    );
  }
}
