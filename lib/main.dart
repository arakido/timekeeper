import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timekeeper/screens/home_page.dart';
import 'package:timekeeper/widgets/menu_button.dart';

void main() {
  runApp(const TimeKeeper());
}

class TimeKeeper extends StatelessWidget {
  const TimeKeeper({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TimerKeeper',

      home: ChangeNotifierProvider<MenuButton>(
        create: (_) => MenuButton(MenuIcon.clock, "Clock"),
        child: const HomePage(),
      ),
    );
  }
}