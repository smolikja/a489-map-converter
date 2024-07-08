# a489-map-converter

This **a489-map-converter** converts file including geo location points collected by [A489](https://www.a489.cz/) to files formated as **GeoJSON** and **GPX**. These output files can be easily imported to [Google Maps](https://www.google.com/maps), [Mapy.cz](https://en.mapy.cz/) or any other navigation application of your choice supporting **GeoJSON** or **GPX** import.

You don't need to run this script, output GeoJSON and GPX files are available to download in [Releases](https://github.com/smolikja/a489-map-converter/releases) and in `/output` directory.

## Prerequisites for running the a489-map-converter

- `Dart` locally installed [[Get the Dart SDK](https://dart.dev/get-dart)]

## How to

1. Get A489 data file or use included one in `/source` directory.
    - The data file can be fetched from [A489 `/map` endpoint](https://www.a489.cz/map).
2. Make sure the data file is in directory `/source`. If is not, move it there.
3. Run script `dart run bin/a489_map_converter.dart [options] <source file name>`,
    - options are `--geojson` (for GeoJSON output) `--gpx` (for GPX output),
    - `dart run bin/a489_map_converter.dart --geojson a489_source.json` example for GeoJSON output from `a489_source.json` included file,
    - `dart run bin/a489_map_converter.dart --gpx a489_source.json` example for GPX output from `a489_source.json` included file,
    - `dart run bin/a489_map_converter.dart --geojson --gpx a489_source.json` example for both (GeoJSON and GPX) output from `a489_source.json` included file.
4. Output files are located in `/output` directory.
5. If anything wrong happens, create an issue with detailed description, please.

### Dev build runner

`dart run build_runner build --verbose --delete-conflicting-outputs`
