import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/planet_provider.dart';

class DetailsScreenils extends StatefulWidget {
  const DetailsScreenils({super.key});

  @override
  State<DetailsScreenils> createState() => _DetailsScreenilsState();
}

class _DetailsScreenilsState extends State<DetailsScreenils> with TickerProviderStateMixin{
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
    PlanetProvider ProviderT = Provider.of(context);
    PlanetProvider ProviderF = Provider.of(context, listen: false);
    return Scaffold(

// backgroundColor: Colors.blueAccent.shade100,

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 25,
                    )),
                Spacer(),
                Container(
                  height: 80,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(70))),
                  child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                          size: 35,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0,
            ),

            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                AnimatedBuilder(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(

                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ProviderT.planets[ProviderT.currentIndex].image,),

  )),
                  ),
                  animation: animationController,
                  builder: (context, child) {
                    return RotationTransition(turns: animationController,child: child,);
                  },),
                // Image.asset(
                //   ProviderT.planets[ProviderT.currentIndex].image,
                //   width: 320,
                // ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      ProviderT.planets[ProviderT.currentIndex].name,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      ProviderT.planets[ProviderT.currentIndex].description,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: PlanetData(
                      ProviderT,
                      "${ProviderT.planets[ProviderT.currentIndex].averageOrbitalSpeed}km/s",
                      'Average orbital speed',
                      Icons.av_timer,
                    )),
                Container(
                    margin: EdgeInsets.all(10),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: PlanetData(
                        ProviderT,
                        "${ProviderT.planets[ProviderT.currentIndex].satellites}",
                        'Satellites',
                        Icons.satellite_alt)),
                Container(
                    margin: EdgeInsets.all(10),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color(0xff24cb83),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: PlanetData(
                        ProviderT,
                        "${ProviderT.planets[ProviderT.currentIndex].surfaceArea} km2",
                        'Surface area',
                        Icons.rocket_launch)),
                Container(
                    margin: EdgeInsets.all(10),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color(0xff7677cb),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: PlanetData(
                        ProviderT,
                        "${ProviderT.planets[ProviderT.currentIndex].rotationPeriod}d",
                        'Rotation period',
                        Icons.rotate_right)),
              ],
            ),

            // SizedBox(height: 22,),
            // Container(
            //   height: 100,
            //   width: 120,
            //   decoration: BoxDecoration(
            //       color: Color(0xff24cb83),
            //
            //     borderRadius: BorderRadius.only(topRight: Radius.circular(70))
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget PlanetData(
    PlanetProvider provider, String data, String name, IconData iconData) {
  return Center(
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            color: Colors.black,
            size: 30,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${data}',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
