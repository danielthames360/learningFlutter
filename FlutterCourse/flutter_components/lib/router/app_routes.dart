import 'package:flutter/material.dart';
import 'package:flutter_components/models/models.dart';
import 'package:flutter_components/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // MenuOption(
    //     route: 'home',
    //     name: 'Home Screen',
    //     screen: const HomeScreen(),
    //     icon: Icons.home),
    MenuOption(
        route: 'listview1',
        name: 'List View tipo 1',
        screen: const ListView1Screen(),
        icon: Icons.list_alt),
    MenuOption(
        route: 'listview2',
        name: 'List View tipo 2',
        screen: const ListView2Screen(),
        icon: Icons.list_alt_sharp),
    MenuOption(
        route: 'alert',
        name: 'Alerts',
        screen: const AlertScreen(),
        icon: Icons.add_alert_outlined),
    MenuOption(
        route: 'card',
        name: 'Cards',
        screen: const CardScreen(),
        icon: Icons.card_membership_sharp),
    MenuOption(
        route: 'avatar',
        name: 'Circle Avatar',
        screen: const AvatarScreen(),
        icon: Icons.supervised_user_circle),
    MenuOption(
        route: 'animated',
        name: 'Animated Container',
        screen: const AnimatedScreen(),
        icon: Icons.play_circle_outline_rounded),
    MenuOption(
        route: 'inputs',
        name: 'Inputs',
        screen: const InputScreen(),
        icon: Icons.input_outlined),
    MenuOption(
        route: 'slider',
        name: 'Slider & Checks',
        screen: const SliderScreen(),
        icon: Icons.slideshow_rounded),
    MenuOption(
        route: 'listviewbuilder',
        name: 'Infinite scroll',
        screen: const ListViewBuilderScreen(),
        icon: Icons.build_circle_rounded),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  //previous routes
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview1': (BuildContext context) => const ListView1Screen(),
  //   'listview2': (BuildContext context) => const ListView2Screen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
