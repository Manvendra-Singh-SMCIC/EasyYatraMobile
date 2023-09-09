import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Global {
  static String loggedin = "";
  static String phone = "";
  static String email = "";
  static bool locationEnabled = false;
  static String baseUrl = "http://localhost:9191";
  static Map<String, dynamic> userMap= {};

  static List<int> hosting = [1, 1, 1];

  static String saveKey = "Y27f&g37g)(*bd6";

  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Global() {
    secureStorage = const FlutterSecureStorage();
  }

  static Future<void> save(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  static Future<String> fetch(String key) async {
    try {
      final storedValue = await secureStorage.read(key: key);
      return storedValue ?? "";
    } catch (e) {
      print('Error fetching $key: $e');
      return "";
    }
  }

  static destroy() {
    userMap = {};
    loggedin = "";
    email = "";
    phone = "";
    Global.save(Constants.LOGGEDIN.toString()+Global.saveKey, "");
    Global.save(Constants.EMAIL.toString()+Global.saveKey, "");
  }
}

enum Constants {
  LOGGEDIN,
  EMAIL
}
