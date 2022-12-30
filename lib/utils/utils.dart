//Made this to debug like android studio but a pro version which has no limit of characters
import 'package:permission_handler/permission_handler.dart';

/**
 * A updated Log class to replicate similar to native android's log.
 * Best part is that it leverages to add very long strings to be visible in the log just that it will separate out the messages after the defaultPrintLength = 1020
 * @param tag - Log tag.
 * @param object - Message or object passed as string to append in the log message.
 */
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

/**
 * It can be used to write all the Permissions to be requested at one place.
 */
class RequestPermissions {
  static Future<Map<Permission, PermissionStatus>> requestPermission(List<Permission> permissions) async {
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    return statuses;
  }
}
