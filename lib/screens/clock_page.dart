import 'package:flutter/material.dart';
import 'package:timekeeper/data/theme.dart';
import 'package:timekeeper/widgets/digital_clock.dart';
import 'package:timekeeper/widgets/world_map.dart';

class ClockPage extends StatefulWidget{
  const ClockPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ClockPageState();
  }
}

class _ClockPageState extends State<ClockPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            height: 230,
            child: const WorldMap(),
          ),
          const SizedBox(height: 20),
          DigitalClock(),
          const SizedBox(height: 35),
          Container(
            height: 400,
            width: 350,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: false,
              // physics: const BouncingScrollPhysics(
              //   parent: AlwaysScrollableScrollPhysics()
              // ),
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    border: Border.all(color: AppColor.white),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    border: Border.all(color: AppColor.white),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    border: Border.all(color: AppColor.white),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    border: Border.all(color: AppColor.white),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: (){},
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(80,80)),
                elevation: MaterialStatePropertyAll(10),
                shape: MaterialStatePropertyAll(CircleBorder()),
                backgroundColor: MaterialStatePropertyAll(AppColor.blue),
                shadowColor: MaterialStatePropertyAll(AppColor.blue),
              ),
              child: const Icon(Icons.add, color: AppColor.white, size: 40))
        ],
      ),
    );
  }
}