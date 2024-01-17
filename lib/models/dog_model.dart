class DogModel {
  String url;
  String status;

  DogModel({required this.url, required this.status});

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        url: json['message'] as String,
        status: json['status'] as String,
      );

  Map<String, dynamic> dogModelToJson(DogModel instance) => <String, dynamic>{
        'message': instance.url,
        'status': instance.status,
      };
}
