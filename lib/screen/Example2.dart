import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example2 extends StatefulWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  _Example2State createState() => _Example2State();
}

class _Example2State extends State<Example2> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListView Example"),
        ),
        body: ListExample()
     );
  }


}

class ListExample extends StatefulWidget {
  const ListExample({Key? key}) : super(key: key);

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) {
          if (i < 2) {
            return _horizontalListView();
          } else if (i == 3) {
            return _buildBox(color: Colors.blue);
          } else {
            return _buildContainer();
          }
        },
      ),
    );
  }

  Widget _horizontalListView() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => _buildBox(color: Colors.orange),
      ),
    );
  }

  Widget _buildBox({required Color color}) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          )],
        color: color,
      ),
      child: const Center(child: Text("Horizontal Item",style: TextStyle(
          fontSize: 19,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),)),
    );
  }

  Widget _buildContainer() {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/29/14/38/web-1012467__340.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          )],
      ),
      child: const Center(child: Text("Vertical Item",style: TextStyle(
        fontSize: 19,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),)),
    );
  }
}
