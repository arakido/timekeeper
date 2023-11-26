import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MenuIcon {
  late IconData active;
  late IconData inactive;

  MenuIcon(this.active, this.inactive);

  static MenuIcon todo = MenuIcon(MdiIcons.checkCircleOutline, MdiIcons.checkCircle);
  static MenuIcon alarm = MenuIcon(MdiIcons.bellRingOutline, MdiIcons.bellRing);
  static MenuIcon clock = MenuIcon(MdiIcons.clockOutline, MdiIcons.clock);
  static MenuIcon stop = MenuIcon(MdiIcons.timerOutline, MdiIcons.timer);
  static MenuIcon timer = MenuIcon(MdiIcons.timerSandEmpty, MdiIcons.timerSandFull);
}

class MenuButton extends ChangeNotifier {
  MenuIcon menu;
  String title;

  MenuButton(this.menu, this.title);

  IconData getIcon(bool active) {
    if (active) return menu.active;
    return menu.inactive;
  }

  void updateMenu(MenuButton newMenu) {
    menu = newMenu.menu;
    title = newMenu.title;

    notifyListeners();
  }

  static List<MenuButton> menuItems = [
    MenuButton(MenuIcon.alarm, "Alarm"),
    MenuButton(MenuIcon.todo, "Todo"),
    MenuButton(MenuIcon.clock, "Clock"),
    MenuButton(MenuIcon.stop, 'Stop'),
    MenuButton(MenuIcon.timer, 'Timer'),
  ];
}
