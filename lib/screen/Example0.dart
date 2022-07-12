import 'package:flutter/material.dart';
import '../utils/dialogs.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Example0 extends StatefulWidget {
  const Example0({Key? key}) : super(key: key);

  @override
  _Example0State createState() => _Example0State();
}

class _Example0State extends State<Example0> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example 0"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () {
                // Respond to button press
                Fluttertoast.showToast(
                    msg: "This is a Toast message", // message
                    toastLength: Toast.LENGTH_SHORT, // length
                    gravity: ToastGravity.CENTER, // location
                    timeInSecForIosWeb: 1 // duration
                    );
              },
              child: const Text('TOAST EXAMPLE BUTTON'),
            ),
            const SizedBox(height: 8.0),
            OutlinedButton(
              onPressed: () {
                // Respond to button press
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("OUTLINED BUTTON Clicked"),
                ));
              },
              child: const Text("SNACKBar EXAMPLE BUTTON"),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
                final action = Dialogs.alertDialog(
                    context,
                    "Alert Dialog",
                    "Would you like to continue learning how to use Flutter alerts?",
                    "Cancel",
                    "Save");
                //cancel and save are the button text for cancel and save operation
                if (action == alertDialogAction.save) {
                  //do something
                  Navigator.pop(context);
                }
              },
              child: const Text("EXAMPLE Alert Dialog BUTTON"),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
                Dialogs.showAlertDialog(context);
              },
              child: const Text("CUSTOM Alert Dialog BUTTON"),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
                setState(() {
                  _isLoading = true;
                });

                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    _isLoading = false;
                  });
                });

              },
              child: SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width*0.80,
                child: Center(
                    child: _isLoading ? const CircularProgressIndicator(color:  Colors.white,) : const Text(
                      "Show ProgressBar",style: TextStyle(fontSize: 18,color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
