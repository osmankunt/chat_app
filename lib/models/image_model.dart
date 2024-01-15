import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  String activity;
  String type;

  @JsonKey(name: 'participants')
  int numberOfParticipants;
  double price;
  String key;

  ImageModel(
      {required this.activity, required this.type, required this.numberOfParticipants, required this.price, required this.key});

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  /// Connect the generated [_$ImageModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
