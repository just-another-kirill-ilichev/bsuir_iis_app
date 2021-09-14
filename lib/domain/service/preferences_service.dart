import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future<String?> getGroup() async {
    var instance = await SharedPreferences.getInstance();

    return instance.getString('group');
  }

  Future<void> setGroup(String group) async {
    var instance = await SharedPreferences.getInstance();

    instance.setString('group', group);
  }
}
