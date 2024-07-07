// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'a489_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

A489Model _$A489ModelFromJson(Map<String, dynamic> json) => A489Model(
      locations: (json['Data'] as List<dynamic>)
          .map((e) => A489ModelLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$A489ModelToJson(A489Model instance) => <String, dynamic>{
      'Data': instance.locations,
    };

A489ModelLocation _$A489ModelLocationFromJson(Map<String, dynamic> json) =>
    A489ModelLocation(
      id: (json['id'] as num).toInt(),
      locationId: json['locationId'] as String,
      title: json['title'] as String,
      perex: json['perex'] as String,
      latLng: json['latLng'] as String,
      url: json['url'] as String,
      image: json['image'] as String,
      body: json['body'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    )
      ..longitude = json['longitude'] as String
      ..latitude = json['latitude'] as String;

Map<String, dynamic> _$A489ModelLocationToJson(A489ModelLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locationId': instance.locationId,
      'title': instance.title,
      'perex': instance.perex,
      'latLng': instance.latLng,
      'url': instance.url,
      'image': instance.image,
      'body': instance.body,
      'images': instance.images,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
