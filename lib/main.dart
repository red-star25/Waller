import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:waller/Loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PermissionHandlerPlatform get _handler => PermissionHandlerPlatform.instance;
  _askPermission() async {
    await _handler.requestPermissions([Permission.storage]);
  }

  @override
  void initState() {
    _askPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loading(),
    );
  }
}


