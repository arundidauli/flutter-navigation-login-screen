
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


class Utility {

  late SharedPreferences prefs;

  getSharedPreferences () async {
    prefs = await SharedPreferences.getInstance();
  }


  static setStringValue (String key,String value) async {
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  saveIntValue (String key,int value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  saveDoubleValue (String key,double value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  saveBoolValue (String key,bool value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  saveStringListValue (String key,List<String> value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }




 static Future<String?> getStringValue (String value) async {
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    return prefs.getString(value);
  }

  Future<int?> getIntValue (String value) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getInt(value);
  }


  Future<double?> getDoubleValue (String value) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(value);
  }

  Future<bool?> getBoolValue (String value) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getBool(value);
  }

  Future<List<String>?> getListValue (String value) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(value);
  }

  static Future<bool> checkConnection() async {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) || (connectivityResult == ConnectivityResult.wifi)){
      return true;
    } else {
      return false;
    }
  }


  static void showAlert(BuildContext context, String text) {
    var alert =  AlertDialog(
      content: Row(
        children: <Widget>[Text(text)],
      ),
      actions: <Widget>[
         ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }
}