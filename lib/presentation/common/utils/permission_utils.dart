import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

/// Permission utils for project

class PermissionUtil {

  static Future<bool> requestPermission({
    required Permission permission,
    required Function onPermissionDenied,
    required Function onPermissionPermanentlyDenied,
  }) async {
    if(Platform.isAndroid){
      if (await permission.isGranted) {
        return true;
      } else {
        PermissionStatus result = await permission.request();
        if (result == PermissionStatus.granted) {
          return true;
        } else if (result == PermissionStatus.denied) {
          onPermissionDenied();
          return false;
        } else if (result == PermissionStatus.permanentlyDenied) {
          onPermissionPermanentlyDenied();
          return false;
        } else {
          return false;
        }
      }
    } else {
      return true;
    }

  }

  static Future<bool> requestMultiplePermissions({
    required List<Permission> permissions,
    required Function onPermissionDenied,
    required Function onPermissionPermanentlyDenied,
  }) async {
    if(Platform.isAndroid){
      Map<Permission, PermissionStatus> statuses = await permissions.request();
      print('::::::::test ${statuses.values.map((e) => e).toString()}');
      if (statuses.values.every((element) => element.isGranted)) {
        return true;
      } else if (statuses.values.any((element) => element.isDenied)) {
        onPermissionDenied();
        return false;
      } else if (statuses.values.any((element) => element.isPermanentlyDenied)) {
        onPermissionPermanentlyDenied();
        return false;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}
