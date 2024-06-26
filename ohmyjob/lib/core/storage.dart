import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }

  Future<bool> isFirstLaunch() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final runned = storage.getBool("runned");

    if (runned == null) {
      return true;
    } else {
      return false;
    }
  }

  firstLauched() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setBool("runned", true);
  }

  setConfig({String? language, bool? darkMode}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    if (language != null) {
      await storage.setString("language", language);
    }

    if (darkMode != null) {
      await storage.setBool("darkMode", darkMode);
    }
  }

  getConfig() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    return {
      "language": storage.getString("language"),
      "darkMode": storage.getBool("darkMode"),
    };
  }

  getProfile() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    String? path = storage.getString("profile");

    if (path == null) {
      return null;
    } else {
      return path;
    }
  }
}
