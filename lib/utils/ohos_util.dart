import 'package:flutter/services.dart';

class OHOSUtil {
  // 定义通道
  static const _channel = MethodChannel('my.app/harmony_ability');

  // 调用鸿蒙原生方法
  static Future<String> getDeviceId() async {
    try {
      return await _channel.invokeMethod('getDeviceId');
    } on PlatformException catch (e) {
      return "Error: ${e.message}";
    }
  }
}
