import 'dart:convert';

import 'package:chat_app/models/activity_model.dart';
import 'package:http/http.dart' as http;

class ActivityRepo {
  Future<ActivityModel> getNetworkImages() async {
    var urlEndPoint = Uri.parse("https://www.boredapi.com/api/activity");

    final response = await http.get(urlEndPoint);

    if (response.statusCode == 200) {
      final dynamic decodedList = jsonDecode(response.body);

      final _networkImage = ActivityModel.fromJson(decodedList);
      //final List<ImageModel> _networkImages = decodedList.map((e) {
      //  return ImageModel.fromJson(e);
      //}).toList();

      print(_networkImage.price);
      return _networkImage;
    } else {
      print("bulunamadi.");
      throw Exception('API has no data');
    }
  }
}
