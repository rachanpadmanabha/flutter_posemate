import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_training_app/constants/constants.dart';
import 'package:yoga_training_app/main.dart';
import 'package:yoga_training_app/models/style.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'dart:math' as math;
import 'package:camera/camera.dart';
import 'package:yoga_training_app/screens/home/home_screen.dart';

import 'package:yoga_training_app/utils/open_cameras.dart';
import 'package:yoga_training_app/utils/pushed_pageS.dart';


class Yoga_ScreenPage extends StatefulWidget {
  final Style style;

  final List<CameraDescription> cameras;


  const Yoga_ScreenPage({Key? key,  required this.style,required this.cameras}) : super(key: key);
  @override
  _Yoga_ScreenPageState createState() => _Yoga_ScreenPageState(style);
}

class _Yoga_ScreenPageState extends State<Yoga_ScreenPage> {
  final Style style;
  bool isOpened = false;

  _Yoga_ScreenPageState(this.style);

  // Widget buildSectionTitle(BuildContext context, String text) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Text(
  //       text,
  //       style: Theme.of(context).textTheme.title,
  //     ),
  //   );
  // }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(left:10,right:10,top:10,),
      padding: EdgeInsets.only(left:10,right:10,top:10,),
      height: 370,
      width: 400,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        title: Text('${style.title}',style:TextStyle(color:black,fontFamily: 'LexendTera')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
               width: size.width * 30,
                    height: size.height * 0.3,
              child: Image(
                      image: AssetImage(style.gifurl),
                      fit: BoxFit.contain,
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(left:12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Steps",style:TextStyle(color:black,fontFamily: 'Montserrat',fontSize: 24,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}',style:TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                      ),
                      title: Text(
                        style.steps[index],style: TextStyle(fontFamily: 'TitilliumWeb',fontWeight: FontWeight.w600),
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: style.steps.length,
              ),
            ),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:50.0,right:80),
                  child: Text("Note*: Use Camera in Good Lighting condition"),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:20.0,right: 10),
        child: FloatingActionButton(
                onPressed:() => onSelectA(context: context, modelName: 'posenet') ,
            backgroundColor: black,
            tooltip: "open Camera to record",
                child: Icon( Icons.camera_rounded,
                color: Colors.blue,
                size: 55,)
              ),
      ),
    );
  }
}

void onSelectA({ required BuildContext context, required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageS(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}