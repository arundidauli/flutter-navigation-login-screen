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
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            tooltip: "Save Todo and Retrun to List",
          ),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(9, (index) => _myCardItem(context,index)),
        ),
      ),
    );
  }
}

Widget _myCardItem(BuildContext context, int index) {

  return Padding(
    padding:  const EdgeInsets.all(8.0),
    child: InkWell(
      splashColor: Colors.blueAccent,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          content: Text("Clicked"),
        ));
      },
      child: Stack(
        children: [Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: const DecorationImage(
              image: AssetImage("assets/images/image3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black54,
            ),

          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  "Button #$index",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              ],
            ),
          ),
      ],

      )
    ),
  );
}
