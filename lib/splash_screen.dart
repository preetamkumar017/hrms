import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
          decoration:const BoxDecoration(
            image:  DecorationImage(
              image: AssetImage("assets/logo/logo.png"),
              fit: BoxFit.fitWidth,
            ),
          )
      ),
    );
  }
}