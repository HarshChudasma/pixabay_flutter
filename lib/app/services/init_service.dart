import 'dart:io';
import 'package:android_id/android_id.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';


final _InitService initService = _InitService();

/// Init service when run Project
class _InitService{

  static final _InitService _instance = _InitService.internal();
  _InitService.internal();

  factory _InitService() => _instance;

  _InitService._();

  String versionName = '';
  String deviceId = '';

  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    await getPackageInfo();
  }


  /// Get Package Information
  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    switch(Platform.operatingSystem){
      case 'android':
        versionName = "${packageInfo.version}+${packageInfo.buildNumber}";
        break;
      case 'ios':
        versionName = "${packageInfo.version}+${packageInfo.buildNumber}";
        break;
      default:
        break;
    }
    print('App name: ${packageInfo.appName}');
    print('Package name: ${packageInfo.packageName}');
    print('Version: ${packageInfo.version}');
    print('Build number: ${packageInfo.buildNumber}');
  }

  /// Get Device Information
  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    const androidIdPlugin = AndroidId();
    final String? androidId = await androidIdPlugin.getId();
    switch(Platform.operatingSystem){
      case 'android':
        deviceId = androidId!;
        break;
      case 'ios':
        IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
        deviceId = iosDeviceInfo.identifierForVendor ?? 'Unknown';
        break;
      default:
        break;
    }
  }

}