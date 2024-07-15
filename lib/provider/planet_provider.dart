import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/model/planet_model.dart';

import '../home/planet.dart';

class PlanetProvider extends ChangeNotifier {
  List<PlanetModel> _planets = [];
  List<PlanetModel> get planets => _planets;



  PlanetProvider()
  {
    fetchPlanets();
  }

  int currentIndex = 0;
  void changeIndex(int index)
  {
    currentIndex = index;
  }

  Future<void> fetchPlanets() async {
    String response = await rootBundle.loadString('assets/data.json');
    final List data = json.decode(response);
    print(data);
    _planets = data.map((e) => PlanetModel.fromjson(e)).toList();
    notifyListeners();
  }
}