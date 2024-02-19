/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon-google.png
  AssetGenImage get iconGoogle =>
      const AssetGenImage('assets/icons/icon-google.png');

  /// File path: assets/icons/nota-icon-32x32.png
  AssetGenImage get notaIcon32x32 =>
      const AssetGenImage('assets/icons/nota-icon-32x32.png');

  /// File path: assets/icons/nota-icon.png
  AssetGenImage get notaIcon =>
      const AssetGenImage('assets/icons/nota-icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [iconGoogle, notaIcon32x32, notaIcon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/desk_illustration.jpg
  AssetGenImage get deskIllustration =>
      const AssetGenImage('assets/images/desk_illustration.jpg');

  /// File path: assets/images/desk_illustration_filled.jpg
  AssetGenImage get deskIllustrationFilled =>
      const AssetGenImage('assets/images/desk_illustration_filled.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [deskIllustration, deskIllustrationFilled];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
