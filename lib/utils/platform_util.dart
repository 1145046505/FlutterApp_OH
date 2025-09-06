import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class PlatformUtil {
  static bool isOhos() {
    return Platform.isOhos;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIos() {
    return Platform.isIOS;
  }

  static bool isMacOs() {
    return Platform.isMacOS;
  }

  static bool isWindows() {
    return Platform.isWindows;
  }

  static bool isWeb() {
    return kIsWeb;
  }
}
