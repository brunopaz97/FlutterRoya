import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:primera/models/getHistoricProsp3Model.dart';

class GetHistoricProsp3Controller extends GetxController{
  var isLoading = false.obs;
  var getDataModel = GetDataModel(results: []).obs;

  getDataFromApi() async{
    isLoading.value = true;
    try{
      var response = await Dio().get(
          'https://hostembedded.com/FlutterRoya/controller/estacionprosp3.php?op=listar'
      );
      final datax = jsonDecode(response.data);
      getDataModel.value=GetDataModel.fromJson(datax);

      // Ordenar la lista de resultados por 'id' en orden descendente
      getDataModel.value.results.sort((b, a) {
        final int idA = int.parse(a.id);
        final int idB = int.parse(b.id);
        return idB.compareTo(idA);
      });

      isLoading.value = false;
    } catch(e){
      print(e);
    }
  }
}
