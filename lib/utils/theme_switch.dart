import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: context.theme.brightness == Brightness.dark,
      onChanged: (value) {
        if (context.theme.brightness == Brightness.dark) {
          print("Changing to Light Theme");
          Get.changeTheme(ThemeData.light());
        } else {
          print("Changing to Dark Theme");
          Get.changeTheme(ThemeData.dark());
        }
      },
    );
  }
}
