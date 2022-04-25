import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Example",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: const HomePages(),
    );
  }
}

class HomePages extends StatelessWidget{

  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(crossAxisCount: 3,
        children: List.generate(10, (index) => _myCardItem(context)),
        ),
      ),
    );
  }

}













Widget _myCardItem(BuildContext context) {
  // TODO: implement build
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          )],
        image: const DecorationImage(
          image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/29/14/38/web-1012467__340.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}