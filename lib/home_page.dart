import 'package:flutter/material.dart';
import 'package:flutter_navigation/main.dart';

class SecondHomePage extends StatefulWidget {
  const SecondHomePage({Key? key}) : super(key: key);


  @override
  State<SecondHomePage> createState() => _SecondHomePage();
}

class _SecondHomePage extends State<SecondHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Welcome to Second Screen"),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                }, child: Text("Go Back"))
              ],
            )
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}