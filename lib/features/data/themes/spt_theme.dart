/* Military Theme */
import 'package:flutter/material.dart';

/* OOAK Theme */

/*
const primaryColor = Color(0xffdeb068); //Color(0xff4d784e);
const secondaryColor = Color.fromRGBO(143, 95, 67, 1.0); // Color(0xff6ea171);
const textColor =  Color(0xff000000); //Color(0xff01a75e);//Color(0xffe1d798);
const backUpColor = Color(0xff675645);
const finalColor = Color(0xff424756);
const surfaceWhite = Color(0xFFFFFBFA);
const backgroundColor = Colors.white; //  Colors.white; // Color(0xffdeb068); //Colors.white;
const errorColor = Colors.red;

 */

// Color(0xffFFC773);


Color primaryColor = Color.fromRGBO(25, 28, 36,1.0); // Color(0xffffffff); //Color(0xfff2eb91); //Color(0xff4d784e);

Color secondaryColor = Color.fromRGBO(25, 135, 84, 1.0); //Color.fromRGBO(139,156,246,1.0); //(143, 95, 67, 1.0); // Color(0xff6ea171);
Color logoColor = Color.fromRGBO(235, 25, 32, 1.0);
Color surfaceColor =  Color.fromRGBO(25, 28, 36,1.0); // Color(0xff000000);  //Color(0xff7b5656); //Color(0xffdd9393);
Color backgroundColor = Color.fromRGBO(0, 0, 0,1.0); //Color(0xFF660a0a); // Color(0xff7b5656); // Color(0xfff5b700);
Color errorColor = Color(0xfff80000);
Color textColor = Color.fromRGBO(108, 114, 133, 1.0);// Color(0xff660a0a); //Color(0xffa75454);
Color colorWhite = Color(0xffffffff); //Color(0xffa75454);
Color textBodyColor = Color.fromRGBO(108, 114, 133, 1.0);// Color(0xff000000);  //Color(0xffefda06); //Color(0xffa75454);
Color onPrimaryColor = Color.fromRGBO(108, 114, 133, 1.0);// Color(0xff000000);  //Color(0xffefda06); // Color(0xffa75454);
Color onSecondaryColor = Color.fromRGBO(255, 255, 255, 1.0);// Color(0xff000000);  //Color(0xff000000);
Color onSurfaceColor = Color.fromRGBO(108, 114, 133, 1.0);// Color(0xff000000);  //Color(0xffefda06); // Color(0xff7b5656);
Color onBackgroundColor = Color.fromRGBO(255, 255, 255, 1.0);// Color(0xff000000);
Color iconColor = Color.fromRGBO(108, 114, 133, 1.0);//Colors.black;



TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline5: base.headline5!.copyWith(
      fontWeight: FontWeight.w500,
    ),
    headline6: base.headline6!.copyWith(
      fontSize: 18.0,
    ),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'MyanmarPhetsot',
    displayColor: textColor,
    bodyColor: textBodyColor,
  );
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: base.colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: onPrimaryColor,
        secondary: secondaryColor,
        onSecondary: onSecondaryColor,
        error: errorColor,
        background: backgroundColor,
        surface: surfaceColor,
        onBackground: onBackgroundColor,
        onSurface: onSurfaceColor
    ),
    textTheme: _buildTextTheme(base.textTheme),
    /*
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: textColor,
    ),

     */
    iconTheme: IconThemeData(color: iconColor),

    // TODO: Add the text themes (103)
    // TODO: Add the icon themes (103)
    // TODO: Decorate the inputs (103)
  );
}

ThemeData sptTheme = _buildTheme();