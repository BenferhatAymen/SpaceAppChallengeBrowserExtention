import 'package:flutterext/models/dataset_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataSetsService {
  Future<List<DataSetsModel>> getBestDatasets() async {
    var url = Uri.parse(
        "https://simultaneousseveralcgi.aceiny.repl.co/api/v1/datasets?sort=-watched&limit=5");

    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    Map<String, dynamic> data = jsonDecode(response.body);

    List<DataSetsModel> dataSets = [];
    var dataSetsList = data["datasets"];
    for (int i = 0; i < dataSetsList.length; i++) {
      dataSets.add(DataSetsModel.fromJson(dataSetsList[i]));
    }
    return dataSets;
  }
   Future<List<DataSetsModel>> searchDatasets(query) async {
    var url = Uri.parse(
        "https://simultaneousseveralcgi.aceiny.repl.co/api/v1/datasets?title=$query&limit=5");

    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    Map<String, dynamic> data = jsonDecode(response.body);

    List<DataSetsModel> dataSets = [];
    var dataSetsList = data["datasets"];
    for (int i = 0; i < dataSetsList.length; i++) {
      dataSets.add(DataSetsModel.fromJson(dataSetsList[i]));
    }
    return dataSets;
  }
}
