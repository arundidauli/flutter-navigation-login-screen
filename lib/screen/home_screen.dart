import 'package:flutter/material.dart';
import 'package:flutter_navigation/screen/listview_horizontal_vertical.dart';
import 'package:flutter_navigation/screen/networking_example.dart';
import 'package:flutter_navigation/utils/constants.dart';
import 'package:flutter_navigation/utils/dialogs.dart';

import 'networking_example1.dart';

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
        title: const Text("Flutter Examples"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(Constants.listOfExamples.length, (index) => _myCardItem(context, Constants.listOfExamples[index])),
        ),
      ),
    );
  }
}

Widget _myCardItem(BuildContext context, String index) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
        splashColor: Colors.blueAccent,
        onTap: () async {

          Constants.showSnackBar(context,"Clicked on $index");

          if (index == Constants.listOfExamples[1]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const VerticalHorizontalList()),
            );

          } else if (index == Constants.listOfExamples[2]) {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const NetworkingExample()),
            );
          }else if (index == Constants.listOfExamples[3]) {

            final action= Dialogs.alertDialog(context,"Title","Body","Cancel","Save");
            //cancel and save are the button text for cancel and save operation
            if(action==alertDialogAction.save){
              //do something
              Navigator.pop(context);
            }
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const AlbumApp()),
            );*/
          }else if (index == Constants.listOfExamples[4]) {

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CustomDialogBox(title: "Title",descriptions: "You will see a full code on a GitHub, and this is a small demo example of Custom Dialog in a flutter; and this below video shows how Custom Dialog will work and pop up show.",text: "Got it",)));
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const AlbumApp()),
            );*/
          }

        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: AssetImage("assets/images/image1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black.withOpacity(0.7),
              ),
              child: Center(
                child: Text(
                  index,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        )),
  );


}

