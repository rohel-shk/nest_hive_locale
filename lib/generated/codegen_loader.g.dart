// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "Posts": "Posts",
  "Users": "Users",
  "Post_home": "Post Home",
  "User_home": "User Home"
};
static const Map<String,dynamic> ne = {
  "Posts": "पोस्टहरू",
  "Users": "प्रयोगकर्ताहरू",
  "Post_home": "गृह पोस्ट",
  "User_home": "गृह प्रयोगकर्ता"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ne": ne};
}
