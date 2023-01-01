import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///Styles class that hold all widget styles - i.e - typography, buttons, etc.
class Styles{

  ///fontWeight
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightRegular = FontWeight.w400;

  ///fontSize
  static const fontSizeH1 = 32.0;
  static const fontSizeH2 = 28.0;
  static const fontSizeH3 = 24.0;
  static const fontSizeH4 = 20.0;
  static const fontSizeH5 = 16.0;
  static const fontSizeH6 = 12.0;

  ///Headline
  static const h1SemiBold = TextStyle(fontWeight: fontWeightSemiBold, fontSize: fontSizeH1);
  static const h1Regular = TextStyle(fontWeight: fontWeightRegular, fontSize: fontSizeH1);
  static const h2SemiBold = TextStyle(fontWeight: fontWeightSemiBold, fontSize: fontSizeH2);
  static const h2Regular = TextStyle(fontWeight: fontWeightRegular, fontSize: fontSizeH2);
  static const h3SemiBold = TextStyle(fontWeight: fontWeightSemiBold, fontSize: fontSizeH3);
  static const h3Regular = TextStyle(fontWeight: fontWeightRegular, fontSize: fontSizeH3);
  static const h4SemiBold = TextStyle(fontWeight: fontWeightSemiBold, fontSize: fontSizeH4);
  static const h4Regular = TextStyle(fontWeight: fontWeightRegular, fontSize: fontSizeH4);
  static const h5SemiBold = TextStyle(fontWeight: fontWeightSemiBold, fontSize: fontSizeH5);
  static const h5Regular = TextStyle(fontWeight: fontWeightRegular, fontSize: fontSizeH5);

}
