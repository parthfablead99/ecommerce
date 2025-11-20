import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;
  static late Orientation orientation;
  static late double textScaleFactor;

  /// Call this method inside every screen's build()
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    orientation = _mediaQueryData.orientation;
    textScaleFactor = _mediaQueryData.textScaleFactor;

    // Base responsive blocks
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }

  /// Responsive height
  static double height(double h) => blockHeight * h;

  /// Responsive width
  static double width(double w) => blockWidth * w;

  /// Responsive font size
  static double font(double f) => f * textScaleFactor;
}