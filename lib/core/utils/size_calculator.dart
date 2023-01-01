import 'package:flutter/material.dart';

/// Size calculator used for calculate each component size
/// Design team use 812 height & 375 width
class SizeCalculator {
  /// get device height
  /// @param [context] : build context
  /// @return [double] - height of device
  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// get device Width
  /// @param [context] : build context
  /// @return [double] - width of device
  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// get component height
  /// @param [context] : context
  /// @param [value] : percentile height
  /// @return [double] - height of component
  /// UI team taken 812 px height - App Bar is 46px so
  /// Percentile height (46 / 812) = 0.056
  static double getComponentHeight(BuildContext context, double value) {
    return getDeviceHeight(context) * value;
  }

  /// get component width
  /// @param [context] : context
  /// @param [value] : percentile width
  /// @return [double] - width of component
  /// UI team taken 375px width - splash icon is 144 by 144 px so
  /// Percentile height (144 / 375) = 0.384
  /// If component is square then use width
  static double getComponentWidth(BuildContext context, double value) {
    return getDeviceWidth(context) * value;
  }
}
