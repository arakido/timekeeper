import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timekeeper/data/city_point.dart';
import 'package:timekeeper/data/theme.dart';

class WorldMap extends StatefulWidget{
  const WorldMap({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WorldMapState();
  }
}

class _WorldMapState extends State<WorldMap> {
  ui.Image? worldImage;

  Future<void> loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);
    setState(() {
      worldImage = image;
    });
  }

  @override
  void initState() {
    loadImage('assets/worldmap.png');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return worldImage == null ? CircularProgressIndicator() : Container(
      height: 230,
      width: 380,
      child: FittedBox(
        child: SizedBox(
          height: worldImage!.height.toDouble(),
          width: worldImage!.width.toDouble(),
          child: CustomPaint(
            painter: MapPainter(worldImage!),
          ),
        ),
      ),
    );
  }
}

class MapPainter extends CustomPainter {
  final ui.Image worldImage;
  const MapPainter(this.worldImage);

  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(worldImage.width.toDouble(), worldImage.height.toDouble()) / 2;
    var scale = min(worldImage.width.toDouble(), worldImage.height.toDouble()) / 100;

    // Define the brush for the city point
    var outerBrush = Paint()
      ..color = AppColor.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = scale * 5;

    var innerBrush = Paint()
      ..color = AppColor.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = scale * 5;

    List<Offset> cityPoints = cities.keys.map((name) => CityPoint(center, name).point).toList();

    canvas.drawImage(worldImage, Offset.zero, Paint());

    canvas.drawPoints(ui.PointMode.points, cityPoints, outerBrush);
    canvas.drawPoints(ui.PointMode.points, cityPoints, innerBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}