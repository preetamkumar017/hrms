import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text("Translation"),
          centerTitle: false,
        ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('helloWorld'.tr), // Access translations using tr() method
          Text('greetings'.trParams({
            'name': 'Jhon',
          })),
          Text('day'.tr),
          ElevatedButton(onPressed: (){
            Get.updateLocale(Locale('hi'));
          }, child: Text("ChangeLanguage".tr)),
        ],
      )),
    );
  }

}

