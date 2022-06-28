import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RenderData extends StatefulWidget {
  final List<dynamic> data;
  final List<dynamic> data1;

  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  RenderData(
      {required this.data,required  this.data1,required  this.previewH,required  this.previewW, required this.screenH, required this.screenW});
  @override
  _RenderDataState createState() => _RenderDataState();
}

class _RenderDataState extends State<RenderData> {
  late Map<String, List<double>> inputArr;

  late String excercise = 'squat';
  late double upperRange = 280;
  late double lowerRange = 500;
  late bool midCount, isCorrectPosture;
  late int _counter;
  late Color correctColor;
  late double shoulderLY;
  late double shoulderRY;
  late double kneeRY;
  late double kneeLY;
  late bool squatUp;
  String whatToDo = 'Finding Posture';

  var leftEyePos = Vector(0, 0);
  var rightEyePos = Vector(0, 0);
  var leftShoulderPos = Vector(0, 0);
  var rightShoulderPos = Vector(0, 0);
  var leftHipPos = Vector(0, 0);
  var rightHipPos = Vector(0, 0);
  var leftElbowPos = Vector(0, 0);
  var rightElbowPos = Vector(0, 0);
  var leftWristPos = Vector(0, 0);
  var rightWristPos = Vector(0, 0);
  var leftKneePos = Vector(0, 0);
  var rightKneePos = Vector(0, 0);
  var leftAnklePos = Vector(0, 0);
  var rightAnklePos = Vector(0, 0);

  @override
  void initState() {
    inputArr = new Map();
    midCount = false;
    isCorrectPosture = false;
    _counter = 0;
    correctColor = Colors.red;
    shoulderLY = 0;
    shoulderRY = 0;
    kneeRY = 0;
    kneeLY = 0;
    squatUp = true;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    print(widget.data);
    print("rew");
    print(widget.data1);

    void _getKeyPoints(k, x, y) {
      if (k['part'] == 'leftEye') {
        leftEyePos.x = x - 280;
        leftEyePos.y = y - 100;
      }
      if (k["part"] == 'rightEye') {
        rightEyePos.x = x - 280;
        rightEyePos.y = y - 100;
      }
      if (k["part"] == 'leftShoulder') {
        leftShoulderPos.x = x - 280;
        leftShoulderPos.y = y - 100;
      }
      if (k["part"] == 'rightShoulder') {
        rightShoulderPos.x = x - 280;
        rightShoulderPos.y = y - 100;
      }
      if (k["part"] == 'leftElbow') {
        leftElbowPos.x = x - 280;
        leftElbowPos.y = y - 100;
      }
      if (k["part"] == 'rightElbow') {
        rightElbowPos.x = x - 280;
        rightElbowPos.y = y - 100;
      }
      if (k["part"] == 'leftWrist') {
        leftWristPos.x = x - 280;
        leftWristPos.y = y - 100;
      }
      if (k["part"] == 'rightWrist') {
        rightWristPos.x = x - 280;
        rightWristPos.y = y - 100;
      }
      if (k["part"] == 'leftHip') {
        leftHipPos.x = x - 280;
        leftHipPos.y = y - 100;
      }
      if (k["part"] == 'rightHip') {
        rightHipPos.x = x - 280;
        rightHipPos.y = y - 100;
      }
      if (k["part"] == 'leftKnee') {
        leftKneePos.x = x - 280;
        leftKneePos.y = y - 100;
      }
      if (k["part"] == 'rightKnee') {
        rightKneePos.x = x - 280;
        rightKneePos.y = y - 100;
      }
      if (k["part"] == 'leftAnkle') {
        leftAnklePos.x = x - 280;
        leftAnklePos.y = y - 100;
      }
      if (k["part"] == 'rightAnkle') {
        rightAnklePos.x = x - 280;
        rightAnklePos.y = y - 100;
      }
    }

    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      widget.data.forEach((re) {
        var list = re["keypoints"].values.map<Widget>((k) {
          var _x = k["x"];
          var _y = k["y"];
          var _score = k["score"];

          if (_score > 0.1){
          var scaleW, scaleH, x, y;
          print('screenW is ${widget.screenW}\n screenH is ${widget.screenH}\n previewH is ${widget.previewH}\n previewW is ${widget.previewW}\n');
          if (widget.screenH / widget.screenW >
              widget.previewH / widget.previewW) {
            scaleW = widget.screenH / widget.previewH * widget.previewW;
            scaleH = widget.screenH;
            var difW = (scaleW - widget.screenW) / scaleW;
            x = (_x - difW / 2) * scaleW;
            y = _y * scaleH;
            print('scaleH1 is ${scaleH}\nscaleW is ${scaleW}\ndifH is ${difW}\nsx is ${x}\ny is ${y}\n');
          } else {
            scaleH = widget.screenW / widget.previewW * widget.previewH;
            scaleW = widget.screenW;
            var difH = (scaleH - widget.screenH) / scaleH;
            x = _x * scaleW;
            y = (_y - difH / 2) * scaleH;
            print('scaleH is ${scaleH}\nscaleW is ${scaleW}\ndifH is ${difH}\nsx is ${x}\ny is ${y}\n');
          }
          inputArr[k['part']] = [x, y];
          //Mirroring
          if (x > 320) {
            var temp = x - 320;
            x = 320 - temp;
          } else {
            var temp = 320 - x;
            x = 320 + temp;
          }

          _getKeyPoints(k, x, y);

          // if (k["part"] == 'leftEye') {
          //   leftEyePos.x = x - 280;
          //   leftEyePos.y = y - 100;
          // }
          // if (k["part"] == 'rightEye') {
          //   rightEyePos.x = x - 280;
          //   rightEyePos.y = y - 100;
          // }
          return Positioned(
            left: x - 280,
            top: y - 50,
            width: 100,
            height: 15,
            child: Container(
                child: Text(
                  "● ${k["part"]}",
                  style: TextStyle(
                    color: Color.fromRGBO(37, 213, 253, 1.0),
                    fontSize: 12.0,
                  ),
                ),
                ),
          );
        }
        else{return Positioned(child: Container());}
        }).toList();

        inputArr.clear();

        lists..addAll(list);
      
      });
      //lists.clear();

      return lists;
    }

    return Stack(
      children: <Widget>[
        Stack(
          children: [
            CustomPaint(
              painter:
                  MyPainter(left: leftShoulderPos, right: rightShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftElbowPos, right: leftShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftWristPos, right: leftElbowPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightElbowPos, right: rightShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightWristPos, right: rightElbowPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftShoulderPos, right: leftHipPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftHipPos, right: leftKneePos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftKneePos, right: leftAnklePos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightShoulderPos, right: rightHipPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightHipPos, right: rightKneePos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightKneePos, right: rightAnklePos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftHipPos, right: rightHipPos),
            ),
          ],
        ),
        Stack(children: _renderKeypoints()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            width: widget.screenW,
            decoration: BoxDecoration(
              color: correctColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25)),
            ),
            child: Column(
              children: [
                Text(
                  '$whatToDo\nArm Presses: ${_counter.toString()}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Vector {
  double x, y;
  Vector(this.x, this.y);
}

class MyPainter extends CustomPainter {
  Vector left;
  Vector right;
  MyPainter({required this.left, required this.right});
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(left.x, left.y);
    final p2 = Offset(right.x, right.y);
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

// class MyPainter extends CustomPainter {
//   Vector leftShoulderPos;
//   Vector rightShoulderPos;
//   Vector leftHipPos;
//   Vector rightHipPos;
//   Vector leftElbowPos;
//   Vector rightElbowPos;
//   Vector leftWristPos;
//   Vector rightWristPos;
//   Vector leftKneePos;
//   Vector rightKneePos;
//   Vector leftAnklePos;
//   Vector rightAnklePos;
//   MyPainter(
//       {this.leftShoulderPos,
//       this.leftAnklePos,
//       this.leftElbowPos,
//       this.leftHipPos,
//       this.leftKneePos,
//       this.leftWristPos,
//       this.rightAnklePos,
//       this.rightElbowPos,
//       this.rightHipPos,
//       this.rightKneePos,
//       this.rightShoulderPos,
//       this.rightWristPos});
//   @override
//   void paint(Canvas canvas, Size size) {
//     final pointMode = ui.PointMode.polygon;
//     final points = [
//       Offset(leftWristPos.x, leftWristPos.y),
//       Offset(leftElbowPos.x, leftElbowPos.y),
//       Offset(leftShoulderPos.x, leftShoulderPos.y),
//       Offset(leftHipPos.x, leftHipPos.y),
//       Offset(leftKneePos.x, leftKneePos.y),
//       Offset(leftAnklePos.x, leftAnklePos.y),
//       Offset(rightHipPos.x, rightHipPos.y),
//       Offset(rightKneePos.x, rightKneePos.y),
//       Offset(rightAnklePos.x, rightAnklePos.y),
//       Offset(rightShoulderPos.x, rightShoulderPos.y),
//       Offset(rightElbowPos.x, rightElbowPos.y),
//       Offset(rightWristPos.x, rightWristPos.y),
//     ];
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 4
//       ..strokeCap = StrokeCap.round;
//     canvas.drawPoints(pointMode, points, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter old) {
//     return false;
//   }
// }

// CustomPaint(
//               painter: MyPainter(
//                   leftShoulderPos: leftShoulderPos,
//                   leftElbowPos: leftElbowPos,
//                   leftWristPos: leftWristPos,
//                   leftHipPos: leftHipPos,
//                   leftKneePos: leftKneePos,
//                   leftAnklePos: leftAnklePos,
//                   rightHipPos: rightHipPos,
//                   rightKneePos: rightKneePos,
//                   rightAnklePos: rightAnklePos,
//                   rightShoulderPos: rightShoulderPos,
//                   rightElbowPos: rightElbowPos,
//                   rightWristPos: rightWristPos),
//             ),
