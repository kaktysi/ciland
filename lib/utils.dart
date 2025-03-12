import 'package:flutter/material.dart';

extension BuildContextEnv on BuildContext {
  bool get isMobileView {
    return MediaQuery.of(this).size.width < 600;
  }

  bool get isNarrowWebView {
    return MediaQuery.of(this).size.width >= 600 &&
        MediaQuery.of(this).size.width < 1100;
  }

  bool get isMediumWebView {
    return MediaQuery.of(this).size.width >= 1100 &&
        MediaQuery.of(this).size.width < 1350;
  }

  bool get isWideWebView {
    return MediaQuery.of(this).size.width >= 1350;
  }
}

class MovieCardScaleProvider extends ChangeNotifier {
  bool _visibility = false;
  double _scale = 1.0;

  bool get visibility => _visibility;
  double get scale => _scale;

  void onEnter() {
    _scale = 1.05;
    _visibility = true;
    notifyListeners();
  }

  void onExit() {
    _scale = 1.00;
    _visibility = false;
    notifyListeners();
  }
}

class PageIndex extends ChangeNotifier {
  int _pageindex = 0;

  int get pageIndex => _pageindex;

  void changeIndex(int index) {
    _pageindex = index;
    notifyListeners();
  }
}
