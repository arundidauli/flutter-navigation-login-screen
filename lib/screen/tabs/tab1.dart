
import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget{
  const Tab1({Key? key}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab1"),
      ),
      body: _tab1Body(),
    );
  }
}

Widget _tab1Body() {
  return const Center(child:  Text("Tab1"));
}