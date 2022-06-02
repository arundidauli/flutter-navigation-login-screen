import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';


class Utility {

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