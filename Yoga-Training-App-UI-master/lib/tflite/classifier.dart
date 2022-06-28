import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:yoga_training_app/tflite/recognition.dart';
import 'package:yoga_training_app/tflite/stats.dart';
import 'package:yoga_training_app/utils/camera_view_singleton.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:image/image.dart' as imageLib;

class Classifier {
  /// Instance of Interpreter
  late Interpreter _interpreter;

  // Gets the interpreter instance
  Interpreter get interpreter => _interpreter;

  static const String MODEL_FILE_NAME = "movenet_singlepose_lightning_3.tflite";

  /// Shapes of output tensors
  late List<List<int>> _outputShapes;

  /// Types of output tensors
  late List<TfLiteType> _outputTypes;

  /// Input size of image (height = width = 192)
  static const int INPUT_SIZE = 192;

  static const double THRESHOLD = 0.4;

  /// [ImageProcessor] used to pre-process the image
  late ImageProcessor imageProcessor;

  /// Padding the image to transform into square
  late int padSize;

  static const List<String> KEYPOINTS = [
    'nose',
    'leftEye',
    'rightEye',
    'leftEar',
    'rightEar',
    'leftShoulder',
    'rightShoulder',
    'leftElbow',
    'rightElbow',
    'leftWrist',
    'rightWrist',
    'leftHip',
    'rightHip',
    'leftKnee',
    'rightKnee',
    'leftAnkle',
    'rightAnkle'
  ];

  Classifier({Interpreter? interpreter}) {
    loadModel(interpreter: interpreter);
  }

  /// Loads interpreter from asset
  void loadModel({Interpreter? interpreter}) async {
    try {
      _interpreter = interpreter ??
          await Interpreter.fromAsset(
            MODEL_FILE_NAME,
            options: InterpreterOptions()..useNnApiForAndroid = true,
            // ..threads = 4,
          );
    } catch (e) {
      print("Error while creating interpreter: $e");
    }
  }

  // Pre-process the image
  TensorImage getProcessedImage(TensorImage inputImage) {
    padSize = max(inputImage.height, inputImage.width);

    // create ImageProcessor
    imageProcessor = ImageProcessorBuilder()
        // Padding the image
        .add(ResizeWithCropOrPadOp(padSize, padSize))
        // Resizing to input size
        .add(ResizeOp(INPUT_SIZE, INPUT_SIZE, ResizeMethod.BILINEAR))
        .build();

    inputImage = imageProcessor.process(inputImage);
    return inputImage;
  }

  /// Runs object detection on the input image
  dynamic predict(imageLib.Image image) {
    var predictStartTime = DateTime.now().millisecondsSinceEpoch;

    if (_interpreter == null) {
      if (kDebugMode) {
        print("Interpreter not initialized");
      }
      return null;
    }

    var preProcessStart = DateTime.now().millisecondsSinceEpoch;

    // Create TensorImage from image
    // TensorImage inputImage = TensorImage.fromImage(image);
    // _inputImage type TfLiteType.float32
    TensorImage inputImage = TensorImage(TfLiteType.float32);
    inputImage.loadImage(image);

    // Pre-process TensorImage
    inputImage = getProcessedImage(inputImage);

    var preProcessElapsedTime =
        DateTime.now().millisecondsSinceEpoch - preProcessStart;

    var outputList = List.filled(17 * 3, 0).reshape([1, 1, 17, 3]);
    TensorBuffer outputTensorBuffer = TensorBufferFloat(outputList.shape);

    Object output = outputTensorBuffer.buffer;

    // Inputs object for runForMultipleInputs
    // Use [TensorImage.buffer] or [TensorBuffer.buffer] to pass by reference
    Object input = inputImage.buffer;

    var inferenceTimeStart = DateTime.now().millisecondsSinceEpoch;

    // run inference
    // _interpreter.runForMultipleInputs(inputs, outputs);
    _interpreter.run(input, output);

    var inferenceTimeElapsed =
        DateTime.now().millisecondsSinceEpoch - inferenceTimeStart;

    List<dynamic> recognitions1 = [];
    Map recognitions = {'score':0,};
    Map keypoints = {};

    for (int i = 0; i < 17; i++) {
      //   // Prediction score
      var score = outputTensorBuffer.getDoubleValue((3 * i) + 2);

      // Label string
      String label = KEYPOINTS.elementAt(i);

      double x = outputTensorBuffer.getDoubleValue((3 * i) + 1);
      double y = outputTensorBuffer.getDoubleValue(3 * i);
      Point location = Point(x, y);
      keypoints[i] = {'score':score, 'part':label,'x':x,'y':y};
    }
    recognitions['keypoints'] = keypoints;
    // recognitions1.add(recognitions);
    var predictElapsedTime =
        DateTime.now().millisecondsSinceEpoch - predictStartTime;
    return [recognitions];

  }
}
