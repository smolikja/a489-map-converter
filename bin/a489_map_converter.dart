import 'dart:convert';
import 'dart:io';

import 'package:a489_map_converter/a489_map_converter.dart' as a489_converter;
import 'package:args/args.dart';
import 'package:path/path.dart' as path;

const String kFlagGeoJSON = 'geojson';
const String kFlagGpx = 'gpx';

void main(List<String> arguments) async {
  // MARK: - read arguments
  final parser = ArgParser()
    ..addFlag(kFlagGeoJSON, defaultsTo: false)
    ..addFlag(kFlagGpx, defaultsTo: false);

  final argResults = parser.parse(arguments);

  // MARK: - set properties
  final isGeoJSON = argResults.flag(kFlagGeoJSON);
  final isGpx = argResults.flag(kFlagGpx);

  if (argResults.rest.length != 1) {
    throw ArgumentError(
      "Run 'a489_map_converter' with flag(s) and name of the a489 file after. For example 'a489_map_converter --gpx a489_source.json'",
    );
  }
  final fileName = argResults.rest.first;

  // MARK: - load a489 json
  final a489 = await _loadA489(fileName: fileName);

  // convert a489
  if (isGeoJSON) {
    try {
      a489_converter.convertToGeoJSON(a489);
    } catch (e) {
      rethrow;
    }
  } else if (isGpx) {
    try {
      a489_converter.convertToGPX(a489);
    } catch (e) {
      rethrow;
    }
  } else {
    throw ArgumentError(
      "Run 'a489_map_converter' with flag '--geojson', '--gpx' or both for converting to wanted format.",
    );
  }
}

Future<Map<String, dynamic>> _loadA489({required fileName}) async {
  // current dir
  final currentDir = Directory.current.path;

  // path to the file
  final a489Path = path.join(currentDir, 'source', fileName);

  // a489 json file
  final a489File = File(a489Path);
  final a489 = await a489File.readAsString().then(json.decode);
  return a489;
}
