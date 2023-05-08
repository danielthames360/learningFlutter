import 'package:flutter/material.dart';
import 'package:flutter_components/router/app_routes.dart';
import 'package:flutter_components/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Components in Flutter'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(AppRoutes.menuOptions[index].name),
                  leading: Icon(
                    AppRoutes.menuOptions[index].icon,
                    color: AppTheme.primary,
                  ),
                  onTap: () {
                    // final route = MaterialPageRoute(
                    //     builder: (context) => const ListView1Screen());
                    // Navigator.push(context, route);

                    Navigator.pushNamed(
                        context, AppRoutes.menuOptions[index].route);
                  },
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: AppRoutes.menuOptions.length));
  }
}
