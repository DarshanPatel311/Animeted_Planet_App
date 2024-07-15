class PlanetModel {
  String name;
  String description;
  int diameter;
  int distanceFromSun;
  int moons;
  double averageOrbitalSpeed;
  int satellites;
  int surfaceArea;
  double rotationPeriod;
  String image;

  PlanetModel._init({
    required this.name,
    required this.description,
    required this.diameter,
    required this.distanceFromSun,
    required this.moons,
    required this.averageOrbitalSpeed,
    required this.satellites,
    required this.surfaceArea,
    required this.rotationPeriod,
    required this.image,
  });

  factory PlanetModel.fromjson(Map json) {
    return PlanetModel._init(
      name: json['name'],
      description: json['description'],
      diameter: json['diameter'],
      distanceFromSun: json['distance_from_sun'],
      moons: json['moons'],
      averageOrbitalSpeed: json['average_orbital_speed'],
      satellites: json['satellites'],
      surfaceArea: json['surface_area'],
      rotationPeriod: json['rotation_period'],
      image: json['image'],
    );
  }
}