import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tender_app_test/models/tender_model.dart';

class TenderApi {
  Future<TenderModel> getData({String searcheType = ""}) async {
    http.Response response = await http
        .get(Uri.parse("url/$searcheType"));
    String utf8Text = utf8.decode(response.bodyBytes);

    List data = jsonDecode(utf8Text);
    // print(data[0]["tender_title"]);
    TenderModel tenderModel = TenderModel.fromjson(data);
    return tenderModel;
  }
}

// void main(List<String> args) {
//   TenderApi api = TenderApi();
//   api.getData(searcheType: "irrigation");
// }

abstract class HTTPRequest<TenderModel> {
  Future<List<dynamic>> execute();
}

class RequestTender implements HTTPRequest<TenderModel> {
  final String url;
  RequestTender({required this.url});
  @override
  Future<List<TenderModel>> execute() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw http.ClientException("error in reponse");
    }
    return _parseJson(response);
  }

  List<TenderModel> _parseJson(var response) {
    String utf8Text = utf8.decode(response.bodyBytes);

    List data = jsonDecode(utf8Text);
    // solution
    // 1- make empty list
    List<TenderModel> tender_app_test = [];
    //  2- loop throgh list
    for (var tender in data) {
      tender_app_test.add(TenderModel.fromjson(tender));
    }

    return tender_app_test;
  }
}

// this map made two jobs first it take List of json ad make TenderModel object
// second it make list of all these TenderModels objs called myList

// var myList = data.map((dynamic tender) {
//   print(tender["tender_title"]);
//   return TenderModel(
//       tenderTitle: tender["tender_title"], entity: tender["entity"]);
// }).toList();
