import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  static const borderColor = Color.fromRGBO(49, 50, 54, 1.0);
  static const borderColor2 = Color.fromRGBO(72, 82, 94, 1.0);
  static const infoCardBoxColor = Color.fromRGBO(28, 35, 43, 1.0);

  static ThemeData _theme = _themeLight;

  static ThemeData get theme => _theme;

  static final ThemeData _themeLight = ThemeData(
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
    ),
  );

  // static final ThemeData _themeDark = ThemeData(
  //   useMaterial3: false,
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: colorBlueDark,
  //     systemOverlayStyle: SystemUiOverlayStyle.dark,
  //   ),
  //   brightness: Brightness.dark,
  //   scaffoldBackgroundColor: colorDarkGray,
  //   primaryColor: colorBlueDark,
  //   primarySwatch: Colors.blue,
  //   visualDensity: VisualDensity.adaptivePlatformDensity,
  //   buttonTheme: ButtonThemeData(
  //     buttonColor: colorBlueDark,
  //     disabledColor: Colors.grey[300],
  //     colorScheme: const ColorScheme.dark(),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: colorBlueDark,
  //       disabledBackgroundColor: const Color.fromRGBO(218, 222, 223, 0.5),
  //     ),
  //   ),
  //   snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
  //   fontFamily: "Lato",
  //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //     selectedItemColor: activeColorDark,
  //     unselectedItemColor: inactiveColorDark,
  //     showUnselectedLabels: true,
  //     selectedLabelStyle: TextStyle(fontSize: 10),
  //     unselectedLabelStyle: TextStyle(fontSize: 10),
  //     backgroundColor: navigationBarColorDark,
  //   ),
  // );

  static ThemeData get themeLight => _themeLight;

  // static ThemeData get themeDark => _themeDark;

  static void setTheme(String value) {
    if (value == themeDarkKey) {
      // _theme = _themeDark;
    } else {
      _theme = _themeLight;
    }
  }

  static void setCustomTheme(ThemeData value) {
    _theme = value;
  }

  static bool themeAppIsDark() {
    return _theme.brightness.index == 0;
  }
}

class ThemeChange extends ChangeNotifier {
  set theme(ThemeData value) {
    ThemeApp.setCustomTheme(value);
    notifyListeners();
  }
}
