import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotenote/utilities/colors.dart';

ThemeData appMainTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColors[0],
  appBarTheme: AppBarTheme(
    color:  backgroundColors[9],
    elevation: 0,
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
    ),
  ),
);
