import 'package:json_annotation/json_annotation.dart';

part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel {
  String activity;
  String type;

  @JsonKey(name: 'participants')
  int numberOfParticipants;
  double price;
  String key;

  ActivityModel(
      {required this.activity, required this.type, required this.numberOfParticipants, required this.price, required this.key});

  factory ActivityModel.fromJson(Map<String, dynamic> json) => _$ActivityModelFromJson(json);

  /// Connect the generated [_$ActivityModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}
