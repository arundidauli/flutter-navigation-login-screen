
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Constants{

  static const SUCCESS_MESSAGE=" You will be contacted by us very soon.";
  static const List listOfExamples=["Add Two Number","TextView/EditText","Button","Network Call","ListView","Pick Image","Coming soon","Coming soon","Coming soon","Coming soon"];
  static void showSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}