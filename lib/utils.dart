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
