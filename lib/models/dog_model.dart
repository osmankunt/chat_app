class DogModel {
  String message;
  String status;

  DogModel({required this.message, required this.status});

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        message: json['message'] as String,
        status: json['status'] as String,
      );

  Map<String, dynamic> dogModelToJson(DogModel instance) => <String, dynamic>{
        'message': instance.message,
        'status': instance.status,
      };
}
