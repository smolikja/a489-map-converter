import 'package:json_annotation/json_annotation.dart';

part 'geojson_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GeojsonModel {
  GeojsonModel({required this.points});
  factory GeojsonModel.fromJson(Map<String, dynamic> json) =>
      _$GeojsonModelFromJson(json);

  final String type = 'FeatureCollection';

  @JsonKey(name: 'features') // supports type 'Point' only
  final List<PointGeojsonModel> points;

  Map<String, dynamic> toJson() => _$GeojsonModelToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
)
class PointGeojsonModel {
  PointGeojsonModel({required this.geometry, required this.properties});
  factory PointGeojsonModel.fromJson(Map<String, dynamic> json) =>
      _$PointGeojsonModelFromJson(json);

  final String type = 'Feature';
  final GeometryPointGeojsonModel geometry;
  final PropertiesPointGeojsonModel properties;

  Map<String, dynamic> toJson() => _$PointGeojsonModelToJson(this);
}

@JsonSerializable()
class GeometryPointGeojsonModel {
  GeometryPointGeojsonModel({required this.coordinates});
  factory GeometryPointGeojsonModel.fromJson(Map<String, dynamic> json) =>
      _$GeometryPointGeojsonModelFromJson(json);

  final String type = 'Point';
  final List<double> coordinates;

  Map<String, dynamic> toJson() => _$GeometryPointGeojsonModelToJson(this);
}

@JsonSerializable()
class PropertiesPointGeojsonModel {
  PropertiesPointGeojsonModel({
    required this.name,
    required this.perex,
    required this.body,
    required this.id,
    required this.locationId,
    required this.url,
    required this.image,
  });
  factory PropertiesPointGeojsonModel.fromJson(Map<String, dynamic> json) =>
      _$PropertiesPointGeojsonModelFromJson(json);

  final String name;
  final String perex;
  final String body;
  final String id;
  final String locationId;
  final String url;
  final String image;

  Map<String, dynamic> toJson() => _$PropertiesPointGeojsonModelToJson(this);
}
