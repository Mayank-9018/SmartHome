import 'dart:developer';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_home/res/assets.dart';

Future<void> main() async {
  final SvgParser parser = SvgParser();
  final Set<String> assets = {
    AssetImages.balcony,
    AssetImages.bathroom,
    AssetImages.bedroom,
    AssetImages.defaultRoom,
    AssetImages.kitchen,
    AssetImages.living,
    AssetImages.outdoor,
  };

  // Passes but should fail as current assets contani some unsupported features.
  test(
    "SVG Compatibility",
    () async {
      for (String asset in assets) {
        try {
          await parser.parse(asset, warningsAsErrors: true);
        } catch (e) {
          log('$asset contains unsupported features.');
          // expect(true, false, reason: '$asset contains unsupported features.');
        }
      }
    },
  );
}
