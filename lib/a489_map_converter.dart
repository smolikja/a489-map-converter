import 'package:a489_map_converter/a489_model.dart';
import 'package:a489_map_converter/geojson_model.dart';
import 'package:xml/xml.dart' as xml;

// MARK: - convertToGeoJSON
Map<String, dynamic> convertToGeoJSON(Map<String, dynamic> a489) {
  final a489Object = A489Model.fromJson(a489);

  final geoPoints = <PointGeojsonModel>[];

  for (final location in a489Object.locations) {
    final lat = double.tryParse(location.latitude) ?? 0;
    final lon = double.tryParse(location.longitude) ?? 0;

    geoPoints.add(
      PointGeojsonModel(
        geometry: GeometryPointGeojsonModel(coordinates: [lon, lat]),
        properties: PropertiesPointGeojsonModel(
          name: location.title,
          perex: location.perex,
          body: location.body,
          id: location.id.toString(),
          locationId: location.locationId,
          url: location.url,
          image: location.image,
        ),
      ),
    );
  }

  return GeojsonModel(points: geoPoints).toJson();
}

// MARK: - convertToGPX
xml.XmlElement convertToGPX(Map<String, dynamic> a489) {
  final a489Object = A489Model.fromJson(a489);

  final gpx = xml.XmlBuilder()
    ..processing('xml', 'version="1.0" encoding="UTF-8" standalone="no"');
  gpx.element(
    'gpx',
    nest: () {
      gpx
        ..attribute('version', '1.1')
        ..attribute('creator', 'a489 map converter')
        ..attribute('xmlns', 'http://www.topografix.com/GPX/1/1')
        ..attribute('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance')
        ..attribute(
          'xsi:schemaLocation',
          'http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd',
        )
        ..element(
          'metadata',
          nest: () {
            gpx
              ..element('name', nest: 'A489 GPX map')
              ..element('desc', nest: 'https://www.a489.cz/ map in GPX format.')
              ..element(
                'author',
                nest: () {
                  gpx.element('name', nest: 'https://github.com/smolikja');
                },
              )
              ..element('time', nest: DateTime.now().toIso8601String());
          },
        );

      for (final location in a489Object.locations) {
        gpx.element(
          'wpt',
          attributes: {
            'lat': location.latitude,
            'lon': location.longitude,
          },
          nest: () {
            gpx
              ..element('name', nest: location.title)
              ..element('perex', nest: location.perex)
              ..element('body', nest: location.body)
              ..element('id', nest: location.id.toString())
              ..element('locationId', nest: location.locationId)
              ..element('url', nest: location.url)
              ..element('image', nest: location.image);
          },
        );
      }
    },
  );

  return gpx.buildDocument().rootElement;
}
