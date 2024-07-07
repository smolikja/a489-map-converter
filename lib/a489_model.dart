import 'package:json_annotation/json_annotation.dart';

part 'a489_model.g.dart';

@JsonSerializable()
class A489Model {
  A489Model({required this.locations});

  factory A489Model.fromJson(Map<String, dynamic> json) =>
      _$A489ModelFromJson(json);

  @JsonKey(name: 'Data')
  final List<A489ModelLocation> locations;

  Map<String, dynamic> toJson() => _$A489ModelToJson(this);
}

@JsonSerializable()
class A489ModelLocation {
  A489ModelLocation({
    required this.id,
    required this.locationId,
    required this.title,
    required this.perex,
    required this.latLng,
    required this.url,
    required this.image,
    required this.body,
    required this.images,
  }) {
    _setLatLng();
  }

  factory A489ModelLocation.fromJson(Map<String, dynamic> json) =>
      _$A489ModelLocationFromJson(json);

  final int id;
  final String locationId;
  final String title;
  final String perex;
  final String latLng;
  final String url;
  final String image;
  final String body;
  final List<String> images;

  @JsonKey(includeFromJson: false, includeToJson: false)
  late final String longitude;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late final String latitude;

  void _setLatLng() {
    const splitChar = ',';
    final latLngSplitted = latLng.split(splitChar);
    latitude = latLngSplitted.first;
    longitude = latLngSplitted.last;
  }
}
