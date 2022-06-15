
import 'package:flutter/material.dart';

class Tab3 extends StatefulWidget{
  const Tab3({Key? key}) : super(key: key);

  @override
  State<Tab3> createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab3"),
      ),
      body: _tab3Body(),
    );
  }
}

Widget _tab3Body() {
  return const Center(child:  Text("Tab3"));
}