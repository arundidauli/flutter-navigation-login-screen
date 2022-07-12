import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_navigation/animations/EnterExitRoute.dart';
import 'package:http/http.dart' as http;

import 'Example9.dart';

class Example8 extends StatefulWidget {
  const Example8({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example8> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animations"),
        ),
        body:  Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width*0.9,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, EnterExitRoute(exitPage: Example8(), enterPage: Example9()));
          }, child: const Text("Enter Exit Animation",style: TextStyle(fontSize: 18,color: Colors.white),)),
        ),
        const SizedBox(height: 16,),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width*0.9,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, EnterExitRoute(exitPage: Example8(), enterPage: Example9()));
          }, child: const Text("Enter Exit Animation",style: TextStyle(fontSize: 18,color: Colors.white),)),
        ),
        const SizedBox(height: 16,),

        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width*0.9,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, EnterExitRoute(exitPage: Example8(), enterPage: Example9()));
          }, child: const Text("Enter Exit Animation",style: TextStyle(fontSize: 18,color: Colors.white),)),
        ),
      ],
    ),
    ),);
  }


}
