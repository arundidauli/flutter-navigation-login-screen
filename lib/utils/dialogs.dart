import 'package:flutter/material.dart';

enum alertDialogAction { cancel, save }

class Dialogs {
  static Object alertDialog(
    BuildContext context,
    String title,
    String body,
    String cancel,
    String save,
  ) {
    Future action = showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              TextButton(
                  onPressed: () =>
                      Navigator.pop(context, alertDialogAction.cancel),
                  child: Text(cancel)),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pop(alertDialogAction.save),
                  child: Text(
                    save,
                    style: const TextStyle(color: Colors.black54),
                  )),
            ],
          );
        });
    return (action != null) ? action : alertDialogAction.cancel;
  }

  static showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
