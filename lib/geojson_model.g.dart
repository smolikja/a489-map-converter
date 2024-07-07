// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeojsonModel _$GeojsonModelFromJson(Map<String, dynamic> json) => GeojsonModel(
      points: (json['features'] as List<dynamic>)
          .map((e) => PointGeojsonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeojsonModelToJson(GeojsonModel instance) =>
    <String, dynamic>{
      'features': instance.points.map((e) => e.toJson()).toList(),
    };

PointGeojsonModel _$PointGeojsonModelFromJson(Map<String, dynamic> json) =>
    PointGeojsonModel(
      geometry: GeometryPointGeojsonModel.fromJson(
          json['geometry'] as Map<String, dynamic>),
      properties: PropertiesPointGeojsonModel.fromJson(
          json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PointGeojsonModelToJson(PointGeojsonModel instance) =>
    <String, dynamic>{
      'geometry': instance.geometry.toJson(),
      'properties': instance.properties.toJson(),
    };

GeometryPointGeojsonModel _$GeometryPointGeojsonModelFromJson(
        Map<String, dynamic> json) =>
    GeometryPointGeojsonModel(
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$GeometryPointGeojsonModelToJson(
        GeometryPointGeojsonModel instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
    };

PropertiesPointGeojsonModel _$PropertiesPointGeojsonModelFromJson(
        Map<String, dynamic> json) =>
    PropertiesPointGeojsonModel(
      name: json['name'] as String,
      perex: json['perex'] as String,
      body: json['body'] as String,
      id: json['id'] as String,
      locationId: json['locationId'] as String,
      url: json['url'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$PropertiesPointGeojsonModelToJson(
        PropertiesPointGeojsonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'perex': instance.perex,
      'body': instance.body,
      'id': instance.id,
      'locationId': instance.locationId,
      'url': instance.url,
      'image': instance.image,
    };
