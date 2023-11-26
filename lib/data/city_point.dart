import 'package:flutter/material.dart';

class Point {
  double x;
  double y;

  Point(this.x, this.y);
}

Map<String, Point> cities = {
  "beijing": Point(1.62, 0.94),
  "moscow": Point(1.2, 0.64),
  "london": Point(0.92, 0.66),
  "newYork": Point(0.54, 0.84),
  "losAngeles": Point(0.275, 1.02),
  "tokyo": Point(1.82, 0.84),
};

class CityPoint {
  late Offset point;

  CityPoint(Offset base, String city){
    Point point = cities[city]!;
    this.point = base.scale(point.x, point.y);
  }
}