import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/utils/constants.dart';
import 'package:flutter_navigation/utils/utils.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Example6 extends StatefulWidget {
  const Example6({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example6> {
  @override
  void initState() {
    super.initState();
  }
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      Constants.showSnackBar(context, "$index Clicked");

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example UI Design"),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 160,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
           const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Popular Flats",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87,fontSize: 18),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, i) {
                  return verticalItemRow(i);
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_sharp),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();
}

Widget verticalItemRow(int po) {
  return Card(
    elevation: 8,
    shadowColor: Colors.greenAccent,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: Colors.white10)),
    child: Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/image3.jpg'))),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Nouveautés'),
      ),
    ),
    margin: const EdgeInsets.all(10.0),
  );
}
