import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:analisis_roya/presentation/widgets/side_menu.dart';
import 'utils.dart';

class Detector extends StatefulWidget {
  static const String name = 'detector_screen';
  const Detector({super.key});

  @override
  State<Detector> createState() => _DetectorState();
}



class _DetectorState extends State<Detector> {

  @override
  void initState() {
    super.initState();
    _dirPath();
  }

  late InputImage _inputImage;
  File? _pickedImage;
  /*static final ImageLabelerOptions _options = ImageLabelerOptions(
    confidenceThreshold: 0.5,
  );*/

  static final LocalLabelerOptions _options = LocalLabelerOptions(
    modelPath: "/data/user/0/com.example.analisis_roya/files/assets/model.tflite",
    confidenceThreshold: 0.5
  );
  final imageLabeler = ImageLabeler(options: _options);
 
  final ImagePicker _imagePicker = ImagePicker();

  String text = "";

  pickImageFromGallery() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    setState(() {
      _pickedImage = File(image.path);
    });
    _inputImage = InputImage.fromFile(_pickedImage!);
    identifyImage(_inputImage);
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detector de roya'),
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: Container(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_pickedImage != null)
              Image.file(
                _pickedImage!,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            else
              Container(
                height: 300,
                color: Colors.black,
                width: double.infinity,
              ),
            Expanded(
                child: Container()
            ),
            Text(text, style: const TextStyle(fontSize: 20),),
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Cargar imagen'),
                onPressed: () {
                  pickImageFromGallery();
                },
              )
            ),
          ],
        ),
      ),
    );
  }

  void identifyImage(InputImage inputImage) async {
    final List<ImageLabel> image = await imageLabeler.processImage(inputImage);
    if (image.isEmpty) {
      setState(() {
        text = "No pude identificar la imagen";
      });
      return;
    }
    if(inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null){
    }
    for (ImageLabel img in image) {
      setState(() {
        text = "Label : ${img.label}\nConfidence : ${img.confidence.toStringAsFixed(2)}\n";
      });
    }
    imageLabeler.close();
  }
}

void _dirPath() async{
  const path = "assets/model.tflite";
  final modelPath = await getAssetPath(path);
  print(modelPath);
}
