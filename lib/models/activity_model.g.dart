// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) => ActivityModel(
      activity: json['activity'] as String,
      type: json['type'] as String,
      numberOfParticipants: json['participants'] as int,
      price: (json['price'] as num).toDouble(),
      key: json['key'] as String,
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) => <String, dynamic>{
      'activity': instance.activity,
      'type': instance.type,
      'participants': instance.numberOfParticipants,
      'price': instance.price,
      'key': instance.key,
    };
