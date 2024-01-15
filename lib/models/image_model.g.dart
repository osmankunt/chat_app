// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      activity: json['activity'] as String,
      type: json['type'] as String,
      numberOfParticipants: json['participants'] as int,
      price: (json['price'] as num).toDouble(),
      key: json['key'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'type': instance.type,
      'participants': instance.numberOfParticipants,
      'price': instance.price,
      'key': instance.key,
    };
