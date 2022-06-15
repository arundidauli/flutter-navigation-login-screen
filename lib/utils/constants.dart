
import 'package:flutter/material.dart';

import 'colors.dart';


class Constants{
  static const List listOfExamples=["Toast,SnackBar,AlertDialog","Button,TextView,EditText,ImageView","List-Horizontal/Vertical","Network Call","Pick Image from (Gallery/Camera)","Session","Example UI Design","Useful Widget","Animation/effect"];

  static void showSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }


  static int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  static const kTextColor = Color(0xFF0D1333);
  static const kBlueColor = Color(0xFF6E8AFA);
  static const kBestSellerColor = Color(0xFFFFD073);
  static const kGreenColor = Color(0xFF49CC96);


// My Text Styles
  static const kHeadingextStyle = TextStyle(
    fontSize: 25,
    color: kTextColor,
    fontWeight: FontWeight.bold,
  );
  static const kSubheadingextStyle = TextStyle(
    fontSize: 24,
    color: Color(0xFFB9B9B9),
    height: 2,
  );

  static const kTitleTextStyle = TextStyle(
    fontSize: 20,
    color: kTextColor,
    fontWeight: FontWeight.bold,
  );

  static const kSubtitleTextSyule = TextStyle(
    fontSize: 18,
    color: kTextColor,
    // fontWeight: FontWeight.bold,
  );
}