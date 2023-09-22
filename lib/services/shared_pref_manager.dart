import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  late SharedPreferences _sharedPreferences;
 
 
  initStateSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveData(DataKeys key, String value) async {
    // ignore: unnecessary_null_comparison
    if (_sharedPreferences != null) {
      return await _sharedPreferences.setString(key.name, value);
    } else {
      return false;
    }
  }

   getData(DataKeys key) {
    // ignore: unnecessary_null_comparison
    if (_sharedPreferences != null) {
      return _sharedPreferences.getString(key.name);
    } else {
      return null;
    }
  }
}

enum DataKeys { notes }
