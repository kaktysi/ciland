import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeApp {
  static const themeLightKey = 'light';
  static const themeDarkKey = 'dark';

  static const scaffoldBackgoundColor = Color.fromRGBO(17, 17, 18, 1.0);
  static const buttonColor = Color.fromRGBO(254, 186, 43, 1.0);
  static const buttonColor2 = Color.fromRGBO(45, 48, 53, 1.0);
  static const buttonColorDisabled = Color.fromRGBO(28, 29, 33, 1.0);
  static const whiteColor = Colors.white;
  static const subTitleColor = Color.fromRGBO(86, 92, 103, 1.0);
  static const subTitleColor2 = Color.fromRGBO(134, 143, 160, 1.0);
  static const subTitleColor3 = Color.fromRGBO(206, 206, 207, 1);
  static const borderColor = Color.fromRGBO(49, 50, 54, 1.0);
  static const borderColor2 = Color.fromRGBO(72, 82, 94, 1.0);
  static const infoCardBoxColor = Color.fromRGBO(28, 35, 43, 1.0);
  static const infoCardBoxColor2 = Color.fromRGBO(209, 222, 237, 1);

  static ThemeData _theme = _themeLight;

  static ThemeData get theme => _theme;

  static final ThemeData _themeDark = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      backgroundColor: scaffoldBackgoundColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    scaffoldBackgroundColor: scaffoldBackgoundColor,
    brightness: Brightness.dark,
    primaryColor: Colors.grey,
    primarySwatch: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(
      buttonColor: buttonColor,
      disabledColor: buttonColorDisabled,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        disabledBackgroundColor: const Color.fromRGBO(205, 209, 210, 1.0),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    fontFamily: "Lato",
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 10),
      unselectedLabelStyle: TextStyle(fontSize: 10),
      selectedItemColor: buttonColor,
      unselectedItemColor: Colors.white,
    ),
  );

  static final ThemeData _themeLight = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white70,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white70,
    primaryColor: Colors.grey,
    primarySwatch: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey,
      disabledColor: Colors.grey[300],
      colorScheme: const ColorScheme.dark(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        disabledBackgroundColor: const Color.fromRGBO(218, 222, 223, 0.5),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    fontFamily: "Lato",
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 10),
      unselectedLabelStyle: TextStyle(fontSize: 10),
      selectedItemColor: buttonColor,
      unselectedItemColor: Colors.black,
    ),
  );

  static ThemeData get themeLight => _themeLight;

  static ThemeData get themeDark => _themeDark;

  static void setTheme(String value) {
    if (value == themeDarkKey) {
      _theme = _themeDark;
    } else {
      _theme = _themeLight;
    }
  }

  static void setCustomTheme(ThemeData value) {
    _theme = value;
  }

  static bool themeAppIsDark() {
    return _theme == themeDark;
  }
}

class ThemeChange extends ChangeNotifier {
  ThemeChange() {
    _loadTheme();
  }

  bool _isDark = true;

  bool get isDark => _isDark;

  ThemeData get theme => _isDark ? ThemeApp.themeDark : ThemeApp.themeLight;

  void toggleTheme() async {
    _isDark = !_isDark;
    ThemeApp.setTheme(_isDark ? ThemeApp.themeDarkKey : ThemeApp.themeLightKey);

    notifyListeners(); 
    _saveTheme();
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('isDarkTheme') ?? true;
    ThemeApp.setTheme(_isDark ? ThemeApp.themeDarkKey : ThemeApp.themeLightKey);

    notifyListeners();
  }

  Future<void> _saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', _isDark);
  }
}
