import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Title'),
            content: Column(mainAxisSize: MainAxisSize.min, children: const [
              Text('This is the content'),
              SizedBox(height: 10),
              FlutterLogo(
                size: 100,
              )
            ]),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'))
            ],
          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Title'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            content: Column(mainAxisSize: MainAxisSize.min, children: const [
              Text('This is the content'),
              SizedBox(height: 10),
              FlutterLogo(
                size: 100,
              )
            ]),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              // onPressed: () => displayDialogAndroid(context),
              onPressed: () => Platform.isAndroid
                  ? displayDialogAndroid(context)
                  : displayDialogIOS(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text('Show alert'),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
      ),
    );
  }
}
