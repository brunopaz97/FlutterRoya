import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primera/pages/GaugesScreen.dart';
import 'package:primera/pages/MapScreen.dart';
import 'package:primera/pages/HomeScreen.dart';
import 'package:primera/pages/DetailsScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState()=> _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      //Importante para eliminar el sticker Debug
      debugShowCheckedModeBanner: false,
      home: GaugesScreen(),
    );
  }
}