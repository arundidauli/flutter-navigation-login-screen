import 'package:flutter/material.dart';

class SecondHomePage extends StatefulWidget {
  const SecondHomePage({Key? key}) : super(key: key);

  @override
  State<SecondHomePage> createState() => _SecondHomePage();
}

class _SecondHomePage extends State<SecondHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, i) {
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
    ),);
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




    );
  }
}
