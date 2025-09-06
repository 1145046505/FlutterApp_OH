import 'package:app/utils/ohos_util.dart';
import 'package:app/utils/platform_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String deviceId = "";

  @override
  Widget build(BuildContext context) {
    bool isOhos = PlatformUtil.isOhos();
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(isOhos ? "鸿蒙" : "其他"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    OHOSUtil.getDeviceId().then((val) {
      debugPrint('device id: $val');
      setState(() {
        deviceId = val;
      });
    });
  }
}
