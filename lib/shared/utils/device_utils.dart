import 'package:flutter/material.dart';

class DeviceUtils {
  final BuildContext context;
  DeviceUtils(this.context);

  // Getter to check if the device is a tablet
  bool get isTab {
    var shortestSide = MediaQuery.of(context).size.width;
    return shortestSide > 600 && shortestSide < 900;
  }

  // Getter to check if the device is a mobile
  bool get isMobile {
    var shortestSide = MediaQuery.of(context).size.width;
    return shortestSide < 600;
  }

  // Getter to check if the device is a desktop
  // Improved getter to check if the device is a desktop
  bool get isDesktop {
    var size = MediaQuery.of(context).size;
    // Desktops typically have both a larger shortest side and a landscape orientation
    return size.width >= 900;
  }
}
