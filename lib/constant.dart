import 'package:flutter/material.dart';

const kBlueClr = Color(0xff0B042E);
const kWhiteClr = Colors.white;
const kGreyClr = Color(0xffC1BAC4);
const kDarkClr = Colors.black;
const kGreenClr = Color(0xff07B20B);
const kRedClr = Color(0xffD81003);

Map<int, Color> colorMap = {
  50: Color.fromRGBO(147, 205, 72, .1),
  100: Color.fromRGBO(147, 205, 72, .2),
  200: Color.fromRGBO(147, 205, 72, .3),
  300: Color.fromRGBO(147, 205, 72, .4),
  400: Color.fromRGBO(147, 205, 72, .5),
  500: Color.fromRGBO(147, 205, 72, .6),
  600: Color.fromRGBO(147, 205, 72, .7),
  700: Color.fromRGBO(147, 205, 72, .8),
  800: Color.fromRGBO(147, 205, 72, .9),
  900: Color.fromRGBO(147, 205, 72, 1),
};

MaterialColor primarySwatchDarkColor = MaterialColor(0xFFFFFFFF, colorMap);
MaterialColor primarySwatchLightColor = MaterialColor(0xff0B042E, colorMap);

//dark and light theme
class Themes {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primarySwatchLightColor,
    ).copyWith(secondary: kGreyClr),
    backgroundColor: kWhiteClr,
    primaryColor: kWhiteClr,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    backgroundColor: kDarkClr,
    primaryColor: kDarkClr,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primarySwatchDarkColor,
    ).copyWith(secondary: kGreyClr),
  );
}

const kPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
const kPadding2 = EdgeInsets.symmetric(horizontal: 15, vertical: 5);
const kPadding3 = EdgeInsets.symmetric(horizontal: 20, vertical: 15);
kPadding1(double horizontal, double vertical) => EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );

BorderRadius radius15 = BorderRadius.circular(15);
BorderRadius radius25 = BorderRadius.circular(25);

var divider = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Divider(
      height: 30,
      thickness: 2,
      color: kGreyClr,
    ));

double sizeHeight(BuildContext context, double fraction) {
  if (fraction <= 0) fraction = 1;
  final mediaQuery = MediaQuery.of(context);
  double height = mediaQuery.size.height;
  fraction =
      (height - (mediaQuery.padding.top + AppBar().preferredSize.height)) /
          fraction;

  return fraction;
}

double sizeWidth(BuildContext context, double fraction) {
  if (fraction <= 0) fraction = 1;
  final mediaQuery = MediaQuery.of(context);
  double width = mediaQuery.size.width;
  return width / fraction;
}

TextStyle get style1 {
  return TextStyle(
    fontWeight: FontWeight.w600,
    color: kDarkClr,
    fontSize: 30,
  );
}

TextStyle get style2 {
  return TextStyle(
    color: kWhiteClr,
    fontSize: 19,
  );
}

TextStyle get style3 {
  return TextStyle(
    fontWeight: FontWeight.w600,
    color: kDarkClr,
    fontSize: 17,
  );
}

TextStyle get style4 {
  return TextStyle(
    color: kDarkClr,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

TextStyle get buttonStyle {
  return TextStyle(
    color: kBlueClr,
    fontSize: 16,
  );
}
