import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService instance = SharedPreferencesService._();
  factory SharedPreferencesService() => instance;
  SharedPreferencesService._();

  late SharedPreferences sharedPreferences;

  // Set values to Storage
  void setInt({required String key, required int value}) {
    sharedPreferences.setInt(key, value);
  }

  void setString({required String key, required String value}) {
    sharedPreferences.setString(key, value);
  }

  void setBool({required String key, required bool value}) {
    sharedPreferences.setBool(key, value);
  }

  void setStringList({required String key, required List<String> value}) {
    sharedPreferences.setStringList(key, value);
  }

  void setDouble({required String key, required double value}) {
    sharedPreferences.setDouble(key, value);
  }

// Get values from Storage
  void getInt({required String key}) {
    sharedPreferences.getInt(key);
  }

  void getString({required String key}) {
    sharedPreferences.getString(key);
  }

  void getBool({required String key}) {
    sharedPreferences.getBool(key);
  }

  void getDouble({required String key}) {
    sharedPreferences.getDouble(key);
  }

  void getStrintList({required String key}) {
    sharedPreferences.getStringList(key);
  }
}
