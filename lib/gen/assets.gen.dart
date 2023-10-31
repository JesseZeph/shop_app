/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Checkmark.png
  AssetGenImage get checkmark =>
      const AssetGenImage('assets/images/Checkmark.png');

  /// File path: assets/images/No.png
  AssetGenImage get no => const AssetGenImage('assets/images/No.png');

  /// File path: assets/images/Pose23.png
  AssetGenImage get pose23 => const AssetGenImage('assets/images/Pose23.png');

  /// File path: assets/images/adidas.png
  AssetGenImage get adidas => const AssetGenImage('assets/images/adidas.png');

  /// File path: assets/images/bg.jpg
  AssetGenImage get bg => const AssetGenImage('assets/images/bg.jpg');

  /// File path: assets/images/gucci.png
  AssetGenImage get gucci => const AssetGenImage('assets/images/gucci.png');

  /// File path: assets/images/jordan.png
  AssetGenImage get jordan => const AssetGenImage('assets/images/jordan.png');

  /// File path: assets/images/nike.png
  AssetGenImage get nike => const AssetGenImage('assets/images/nike.png');

  /// File path: assets/images/top_image.png
  AssetGenImage get topImage =>
      const AssetGenImage('assets/images/top_image.png');

  /// File path: assets/images/usa.svg
  String get usa => 'assets/images/usa.svg';

  /// File path: assets/images/user.jpeg
  AssetGenImage get user => const AssetGenImage('assets/images/user.jpeg');

  /// List of all assets
  List<dynamic> get values => [
        checkmark,
        no,
        pose23,
        adidas,
        bg,
        gucci,
        jordan,
        nike,
        topImage,
        usa,
        user
      ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/kids_shoes.json
  String get kidsShoes => 'assets/json/kids_shoes.json';

  /// File path: assets/json/men_shoes.json
  String get menShoes => 'assets/json/men_shoes.json';

  /// File path: assets/json/women_shoes.json
  String get womenShoes => 'assets/json/women_shoes.json';

  /// List of all assets
  List<String> get values => [kidsShoes, menShoes, womenShoes];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
