import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class AppSVGAssets {
  static const pinkRight = "assets/svg_icons/pink_right.svg";
  static const home = "assets/svg_icons/home.svg";
  static const google = "assets/svg_icons/google.svg";
  static const logo = "assets/svg_icons/logo.svg";
  static const mobile = "assets/svg_icons/mobile.svg";
  static const profile2user = "assets/svg_icons/profile_2user.svg";
  static const success = "assets/svg_icons/success.svg";
  static const logout = "assets/svg_icons/logout.svg";
  static const lock = "assets/svg_icons/lock.svg";

  static SvgPicture getWidget(String assetName,
      {BoxFit fit = BoxFit.none, Color? color, double? width, double? height}) {
    if (width != null && height != null) {
      return SvgPicture.asset(
        assetName,
        fit: fit,
        color: color,
        width: width,
        height: height,
      );
    }
    return SvgPicture.asset(assetName, fit: fit, color: color);
  }
}
