import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timekeeper/data/theme.dart';
import 'package:timekeeper/screens/clock_page.dart';
import 'package:timekeeper/widgets/menu_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: MenuButton.menuItems.map((menu) => buildMenuButton(menu)).toList(),
          ),
          const SizedBox(height: 25),
          Expanded(child: Consumer<MenuButton>(
            builder: (context, value, child) {
               if(value.menu == MenuIcon.clock) {
                 return const ClockPage();
               }
              return Container();
            },
          ))
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuButton menuButton) {
    return Consumer<MenuButton>(
      builder: (context, value, child) {
        print("----------- buildMenuButton builder");
        bool change = value.menu == menuButton.menu;
        var icon = menuButton.getIcon(change);
        var iconColor = change ? AppColor.blue : AppColor.grey;
        var shadowColor = change ? AppColor.blue : Colors.transparent;
        return ElevatedButton(
          onPressed: () {
            print("---------- ElevatedButton OnPressed");
            var newButton = Provider.of<MenuButton>(context, listen: false);
            newButton.updateMenu(menuButton);
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const CircleBorder()),
              enableFeedback: true,
              elevation: MaterialStateProperty.all(6),
              shadowColor: MaterialStateProperty.all(shadowColor),
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          child: Icon(icon, size: 40, color: iconColor),
        );
      },
    );
  }
}
