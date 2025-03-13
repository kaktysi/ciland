abstract class ThemePreferencesRepository {
  Future<String> getAppTheme();

  Future<void> saveAppTheme(String value);
}
