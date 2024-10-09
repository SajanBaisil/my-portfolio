import 'package:flutter/material.dart';

extension ResponsivePadding on BuildContext {
  EdgeInsets responsivePadding(
      {required double horizontal, required double vertical}) {
    double screenWidth = MediaQuery.of(this).size.width;
    double screenHeight = MediaQuery.of(this).size.height;

    // Assuming 1440px width and 900px height as the base screen size for calculations
    double baseScreenWidth = 1920;
    double baseScreenHeight = 996.4111;

    double horizontalPadding = (horizontal / baseScreenWidth) * screenWidth;
    double verticalPadding = (vertical / baseScreenHeight) * screenHeight;

    return EdgeInsets.symmetric(
        horizontal: horizontalPadding, vertical: verticalPadding);
  }
}

/// border radius
///
extension ResponsiveRadius on BuildContext {
  double responsiveRadius(double baseRadius) {
    double screenWidth = MediaQuery.of(this).size.width;
    double baseScreenWidth =
        1920; // Assuming 1440px as the base width for your design

    return (baseRadius / baseScreenWidth) * screenWidth;
  }
}

/// responsive font size
extension ResponsiveFontSize on BuildContext {
  double responsiveFontSize(double baseFontSize) {
    double screenWidth = MediaQuery.of(this).size.width;
    double baseScreenWidth =
        1920; // Assuming 1440px as the base width for your design

    return (baseFontSize / baseScreenWidth) * screenWidth;
  }
}

/// responsive width

extension ResponsiveWidth on BuildContext {
  double responsiveWidth(double baseWidth) {
    double screenWidth = MediaQuery.of(this).size.width;
    double baseScreenWidth =
        1920; // Assuming 1440px as the base width for your design

    return (baseWidth / baseScreenWidth) * screenWidth;
  }
}

/// responsive height

extension ResponsiveHeight on BuildContext {
  double responsiveHeight(double baseHeight) {
    double screenHeight = MediaQuery.of(this).size.height;
    double baseScreenHeight =
        996.4111; // Assuming 900px as the base height for your design

    return (baseHeight / baseScreenHeight) * screenHeight;
  }
}
