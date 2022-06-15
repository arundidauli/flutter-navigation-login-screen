
import 'package:flutter/material.dart';

class Tab2 extends StatefulWidget{
  const Tab2({Key? key}) : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab2"),
      ),
      body: _tab2Body(),
    );
  }
}

Widget _tab2Body() {
  return const Center(child:  Text("Tab2"));
}