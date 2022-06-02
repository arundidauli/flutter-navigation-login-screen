
import 'package:flutter/material.dart';

import 'colors.dart';


class Constants{
  static const SUCCESS_MESSAGE=" You will be contacted by us very soon.";
  static const List listOfExamples=["Toast,SnackBar,AlertDialog","Button,TextView,EditText,ImageView","List-Horizontal/Vertical","Network Call","Pick Image from (Gallery/Camera)","Session","Navigation/push/Pop","Useful Widget","Animation/effect"];
  static void showSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}