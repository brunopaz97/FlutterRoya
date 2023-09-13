import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:primera/models/getLastProsp3Model.dart';

class GetLastProsp3Controller extends GetxController{
  var isLoading = false.obs;
  var getDataModel = GetDataModel(results: Results(tempsuelo: '', humsuelo: '')).obs;

  getDataFromApi() async{
    isLoading.value = true;
    try{
      var response = await Dio().get(
          'https://hostembedded.com/FlutterRoya/controller/estacionprosp3.php?op=ultimo'
      );
      final datax = jsonDecode(response.data);
      getDataModel.value=GetDataModel.fromJson(datax);
      isLoading.value = false;
    } catch(e){
      print(e);
    }
  }
}
