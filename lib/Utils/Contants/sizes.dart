import 'package:flutter/cupertino.dart';

class XSizes {
  XSizes._();

  // padding and margin sizes
  static double xs = 4.0;
  static double sm = 6.0;
  static double md = 8.0;
  static double lg = 12.0;
  static double xl = 16.0;

  // Icon sizes
  static double iconXs = 12.0;
  static double iconSm = 16.0;
  static double iconMd = 24.0;
  static double iconLg = 32.0;

  // Font size
  static double fontSizeSm = 14.0;
  static double fontSizeMd = 16.0;
  static double fontSizeLg = 18.0;

  static sizeBoxXsm(){
    return SizedBox(height: xs,);
  }

  static sizeBoxSm(){
    return SizedBox(height: sm,);
  }
  static sizeBoxMm(){
    return SizedBox(height: lg,);
  }
  static sizeBoxLg(){
    return SizedBox(height: xl,);
  }
  static sizeBoxXLg(){
    return SizedBox(height: xl+xl,);
  }

}