import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenUtil {
  static ScreenUtil? _instance;

  double width;
  double height;
  bool allowFontScaling;

  static MediaQueryData? _mediaQueryData;

  static double? _screenWidth;
  static double? _screenHeight;
  static double? _pixelRatio;
  static double? _statusBarHeight;
  static double? _bottomBarHeight;
  static double? _textScaleFactor;

  ScreenUtil({
    this.width = 1080,
    this.height = 1920,
    this.allowFontScaling = false,
  });

  static ScreenUtil get instance {
    _instance ??= ScreenUtil();
    return _instance!;
  }

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQuery.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  static MediaQueryData get mediaQueryData {
    return _mediaQueryData!;
  }

  static double get textScaleFactory {
    return _textScaleFactor!;
  }

  static double get pixelRatio {
    return _pixelRatio!;
  }

  static double get screenWidthDp {
    return _screenWidth!;
  }

  static double get screenHeightDp {
    return _screenHeight!;
  }

  static double get screenWidth {
    return _screenWidth! * _pixelRatio!;
  }

  static double get screenHeight {
    return _screenHeight! * _pixelRatio!;
  }

  static double get statusBarHeight {
    return _statusBarHeight! * _pixelRatio!;
  }

  static double get bottomBarHeight {
    return _bottomBarHeight! * _pixelRatio!;
  }

  get scaleWidth => _screenWidth! / instance.width;
  get scaleHeight => _screenHeight! / instance.height;
  setWidth(int width) => width * scaleWidth;
  setHeight(int height) => height * scaleHeight;

  setSp(int fontSize) =>
      allowFontScaling ? setWidth(fontSize) : setWidth(fontSize) / _textScaleFactor!;

  void printScreenInformation() {
    print('Device width dp:${ScreenUtil.screenWidth}'); //Device width
    print('Device height dp:${ScreenUtil.screenHeight}'); //Device height
    print('Device pixel density:${ScreenUtil.pixelRatio}'); //Device pixel density
    print('Bottom safe zone distance dp:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance
    print('Status bar height px:${ScreenUtil.statusBarHeight}dp'); //Status bar height
    print('Ratio of actual width dp to design draft px:${ScreenUtil().scaleWidth}');
    print('Ratio of actual height dp to design draft px:${ScreenUtil().scaleHeight}');
    print('The ratio of font and width to the size of the design:${ScreenUtil().scaleWidth * ScreenUtil.pixelRatio}');
    print('The ratio of height width to the size of the design:${ScreenUtil().scaleHeight * ScreenUtil.pixelRatio}');
    print('System font scaling:${ScreenUtil.textScaleFactory}');
    print('0.5 times the screen width:${0.5}');
    print('0.5 times the screen height:${0.5}');
  }
}
