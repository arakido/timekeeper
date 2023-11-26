import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timekeeper/data/theme.dart';

class DigitalClock extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DigitalClockState();
  }
}

class _DigitalClockState extends State<DigitalClock> {
  String hmTime = "";
  String dateTime = "";

  Timer? curTimer;

  void initTime(){
    hmTime = DateFormat('HH:mm:ss').format(DateTime.now());
    dateTime = DateFormat('y/MM/d  EEEE').format(DateTime.now());
  }

  @override
  void initState() {
    initTime();

    curTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        initTime();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    curTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            hmTime,
            textAlign: TextAlign.end,
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: AppColor.white,
                    letterSpacing: 6,
                )
            ),
          ),
          const SizedBox(height: 15),
          Text(
            dateTime,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.grey
              )
            ),
          )
        ],
      ),
    );
  }
}