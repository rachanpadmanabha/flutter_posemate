import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math';

import 'package:yoga_training_app/utils/open_cameras.dart';
import 'package:yoga_training_app/utils/render_data.dart';

class PushedPageS extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String title;
  const PushedPageS({required this.cameras, required this.title});
  @override
  _PushedPageSState createState() => _PushedPageSState();
}

class _PushedPageSState extends State<PushedPageS> {
  late List<dynamic> _data;
  late List<dynamic> _data1;
  int _imageHeight = 0;
  int _imageWidth = 0;
  int x = 1;

  @override
  void initState() {
    super.initState();
    var res = loadModel();
    //print('Model Response: ' + res.toString());
  }

  _setRecognitions(data,data1, imageHeight, imageWidth) {
    if (!mounted) {
      return;
    }
    setState(() {
      _data = data;
      _data1 = data1;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
      print('image details');
      print(_imageHeight);
      print(_imageWidth);
    });
  }

  loadModel() async {
    return await Tflite.loadModel(
        model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('AlignAI Squat'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          CameraScreen(cameras: widget.cameras, setRecognitions: _setRecognitions),
            // cameras: widget.cameras,
        ],
      ),
    );
  }
}
