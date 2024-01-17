import 'dart:convert';
import 'package:chat_app/models/dog_model.dart';
import 'package:http/http.dart' as http;

class DogRepo {
  Future<DogModel> getDogImages() async {
    var _urlEndPoint = Uri.parse("https://dog.ceo/api/breeds/image/random");

    final response = await http.get(_urlEndPoint);

    if (response.statusCode == 200) {
      final dynamic decodedList = jsonDecode(response.body);

      final _dogImages = DogModel.fromJson(decodedList);
      //final List<ImageModel> _networkImages = decodedList.map((e) {
      //  return ImageModel.fromJson(e);
      //}).toList();

      print(_dogImages.status);
      return _dogImages;
    } else {
      print("couldnt find dog images.");
      throw Exception('API has no data');
    }
  }
}
