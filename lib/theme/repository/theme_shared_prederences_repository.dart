import 'package:ciland/theme/repository/theme_preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPreferencesRepository extends ThemePreferencesRepository {
  static const String themeAppKey = 'app_theme';

  @override
  Future<String> getAppTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(themeAppKey);
    return value ?? 'no_theme_saved';
  }

  @override
  Future<void> saveAppTheme(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(themeAppKey, value);
  }
}
