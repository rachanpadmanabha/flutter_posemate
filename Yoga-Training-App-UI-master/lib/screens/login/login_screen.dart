import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:yoga_training_app/constants/pallette.dart';
import 'package:yoga_training_app/screens/login/components/background_image_clipper.dart';
import 'package:yoga_training_app/screens/login/components/circle_button.dart';
import 'package:yoga_training_app/screens/login/components/login_credentials.dart';
import 'package:camera/camera.dart';

class LoginScreen extends StatefulWidget {

  final List<CameraDescription> cameras;
  LoginScreen(this.cameras);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue[100]!);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackgroundImage(),
                LoginCredentials(widget.cameras),

              ],
            ),
            //CircleButton(),
          ],
        ),
      ),
    );
  }
}
