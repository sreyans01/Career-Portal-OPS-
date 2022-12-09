//Made this to debug like android studio but a pro version which has no limit of characters
import 'package:permission_handler/permission_handler.dart';

class Log {
  static void i(String tag, String object) async {
    int defaultPrintLength = 1020;
    if (object == null || object.toString().length <= defaultPrintLength) {
      print(tag + ": " + object.toString());
    } else {
      String log = object.toString();
      int start = 0;
      int endIndex = defaultPrintLength;
      int logLength = log.length;
      int tmpLogLength = log.length;
      while (endIndex < logLength) {
        print(tag + ": " + log.substring(start, endIndex));
        endIndex += defaultPrintLength;
        start += defaultPrintLength;
        tmpLogLength -= defaultPrintLength;
      }
      if (tmpLogLength > 0) {
        print(tag + ": " + log.substring(start, logLength));
      }
    }
  }
}

class RequestPermissions {
  static Future<Map<Permission, PermissionStatus>> requestPermission(List<Permission> permissions) async {
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    return statuses;
  }
}
