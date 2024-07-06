import 'dart:convert';
import 'dart:io';

import 'package:a489_to_geojson/a489_to_geojson.dart' as a489_to_geojson;
import 'package:path/path.dart' as path;

// TODO: arg as name of the a489 json file (a489_source.json)
void main(List<String> arguments) async {
  // MARK: - load json
  print(await loadA489(fileName: 'a489_source.json'));

  // convert a489 to geojson
  a489_to_geojson.convert();

  // export geojson
}

dynamic loadA489({required fileName}) async {
  // current dir
  final currentDir = Directory.current.path;

  // path to the file
  final a489Path = path.join(currentDir, 'source', fileName);

  // a489 json file
  final a489File = File(a489Path);
  final a489 = await a489File.readAsString().then(json.decode);
  return a489;
}
