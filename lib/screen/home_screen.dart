import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView Example"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        actions: <Widget>[
          IconButton(onPressed: (){

          }, icon:  Icon(Icons.notifications),
            tooltip: "Save Todo and Retrun to List",
          ),

        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(10, (index) => _myCardItem(context)),
        ),
      ),
    );
  }
}

Widget _myCardItem(BuildContext context) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          )
        ],
        image: const DecorationImage(
          image: NetworkImage(
              "https://cdn.pixabay.com/photo/2015/10/29/14/38/web-1012467__340.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
