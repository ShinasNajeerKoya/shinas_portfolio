import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension PlatformExtensions on BuildContext {
  bool get isMacOS => kIsWeb ? _isMacDummy : _isRealMac;

  static bool _isMacDummy = true; // Default to Mac UI
  static bool get _isRealMac => defaultTargetPlatform == TargetPlatform.macOS;

  /// Toggle between MacOS and Windows UI for Web
  static void togglePlatform() {
    _isMacDummy = !_isMacDummy;
  }
}
