import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:yoga_training_app/constants/constants.dart';
import 'package:yoga_training_app/screens/login/name_page.dart';
import 'package:camera/camera.dart';

class SplashPage extends StatefulWidget {

  
  final List<CameraDescription> cameras;

  SplashPage({Key? key,required this.cameras}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff2e2e2d));
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return EasySplashScreen(
      logo: Image.asset(
          'assets/images/splash1.jpeg'),
          logoSize: 180.0,
      title: Text(
        "PoseMate",
        style: TextStyle(
          color: white,
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontFamily: 'LexendTera'
        ),
      ),
      
      backgroundColor:  Color(0xff2e2e2d),
      showLoader: true,
      loaderColor: white,
      loadingText: Text("from\nYARC",style:TextStyle(color: white, fontWeight: FontWeight.bold,fontFamily: 'LexendTera')),
      navigator: NamePage(widget.cameras),
      durationInSeconds: 3,
    );
  }
}