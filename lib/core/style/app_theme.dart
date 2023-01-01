import 'package:flutter/material.dart';
import 'package:flare/core/style/color_constants.dart';
import 'package:flare/core/style/styles.dart';

/// customize text theme for app theme
const TextTheme textTheme = TextTheme(
    headline1: Styles.h1Regular,
    headline2: Styles.h2Regular,
    headline3: Styles.h3Regular,
    headline4: Styles.h4Regular,
    headline5: Styles.h5Regular,
);

/// Light theme - Light brightness
var themeLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorConstants.primary,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorConstants.primary,
        primary: ColorConstants.primary,
        brightness: Brightness.light
    ),
    textTheme: textTheme,

);

/// Dark theme - Dark brightness - For now set light brightness because we don't have dark theme design
var themeDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorConstants.black,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorConstants.primary,
        primary: ColorConstants.primary,
        brightness: Brightness.dark),
    textTheme: textTheme);

/// Application Theme class which hold current application theme
/// @_themeData : Flutter theme data class hold the current theme
class AppTheme extends ChangeNotifier {
  ThemeData _themeData;

  AppTheme(this._themeData);

  get getTheme => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  ThemeData getThemeData() {
    return _themeData;
  }
}
