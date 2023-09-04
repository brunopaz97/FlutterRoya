import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:primera/models/getDataModel.dart';

class GetDataController extends GetxController{
  var isLoading = false.obs;
  var getDataModel = GetDataModel(results: []).obs;

  getDataFromApi() async{
    isLoading.value = true;
    try{
      var response = await Dio().get(
          'http://10.0.112.7:90/ApiRest_Pokemon/controller/pokemon.php?op=listar'
      );
      final datax = jsonDecode(response.data);
      getDataModel.value=GetDataModel.fromJson(datax);
      isLoading.value = false;
    } catch(e){
      print(e);
    }
  }
}