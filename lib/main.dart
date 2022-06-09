
import 'package:flutter/material.dart';
import 'package:flutter_navigation/screen/Example0.dart';
import 'package:flutter_navigation/screen/Example1.dart';
import 'package:flutter_navigation/screen/Example2.dart';
import 'package:flutter_navigation/screen/Example3.dart';
import 'package:flutter_navigation/screen/Example4.dart';
import 'package:flutter_navigation/screen/Example5.dart';
import 'package:flutter_navigation/screen/Example6.dart';
import 'package:flutter_navigation/screen/Example7.dart';
import 'package:flutter_navigation/screen/Example8.dart';
import 'package:flutter_navigation/screen/Example9.dart';
import 'package:flutter_navigation/utils/colors.dart';
import 'package:flutter_navigation/utils/constants.dart';
import 'package:flutter_navigation/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Example',
      theme: _buildShrineTheme(),
      home: const HomePages(),
    );
  }
}

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String? email="";

  @override
  void initState() {
    super.initState();

    setState(() {
      checkInternet();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Flutter Examples"),
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
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
          children: List.generate(Constants.listOfExamples.length,
              (index) => _myCardItem(context, Constants.listOfExamples[index])),
        ),
      ),
      drawer: _drawerHome(context,email),

    );
  }


  void checkInternet(){
    Future.delayed(Duration.zero,() async{
      email=(await Utility.getStringValue("email"))!;
      bool status=await Utility.checkConnection();
      setState(() {
        if(!status){
          final snackBar = SnackBar(
            content: const Text('There is no internet connection!'),
            backgroundColor: (Colors.redAccent),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () {
                setState(() {
                });
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });

    });
  }
}

Widget _drawerHome(BuildContext context,String? email) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text(email!),
          accountName: const Text("Arun Android"),
          currentAccountPicture: ClipRRect(
            borderRadius: BorderRadius.circular(110),
            child: Image.asset(
              "assets/images/image3.jpg",
              fit: BoxFit.cover,
            ),
          ),
          otherAccountsPictures: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(110),
              child: Image.asset(
                "assets/images/image3.jpg",
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(110),
              child: Image.asset(
                "assets/images/image1.jpg",
                fit: BoxFit.cover,
              ),
            )
          ],
          decoration: const BoxDecoration(color: AppColor.shrineBrown600),
        ),
        ListTile(
          leading: const Icon(Icons.assessment),
          title: const Text("Assessment"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.school),
          title: const Text("School"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.announcement),
          title: const Text("Announcement"),
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> NewScreen()));
          },
        )
      ],
    ),
  );
}

Widget _myCardItem(BuildContext context, String index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
        splashColor: Colors.orange,
        onTap: () async {
          if (index == Constants.listOfExamples[0]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Example0()),
            );
          } else if (index == Constants.listOfExamples[1]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Example1()),
            );
          } else if (index == Constants.listOfExamples[2]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Example2()),
            );
          } else if (index == Constants.listOfExamples[3]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Example3()),
            );
          } else if (index == Constants.listOfExamples[4]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Example4()),
            );
          } else if (index == Constants.listOfExamples[5]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Example5()),
            );
          } else if (index == Constants.listOfExamples[6]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Example6()),
            );
          } else if (index == Constants.listOfExamples[7]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Example7()),
            );
          } else if (index == Constants.listOfExamples[8]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Example8()),
            );
          } else if (index == Constants.listOfExamples[9]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Example9()),
            );
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    index,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 16, height: 1.5),
                  ),
                ),
              ),
            ),
          ],
        )),
  );
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: AppColor.appShrineColorScheme,
    toggleableActiveColor: AppColor.shrinePink400,
    accentColor: AppColor.shrineBrown900,
    primaryColor: AppColor.shrinePink100,
    buttonColor: AppColor.shrinePink100,
    scaffoldBackgroundColor: AppColor.shrineBackgroundWhite,
    cardColor: AppColor.shrineBackgroundWhite,
    textSelectionColor: AppColor.shrinePink100,
    errorColor: AppColor.shrineErrorRed,
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: AppColor.shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: AppColor.defaultLetterSpacing,
        ),
        button: base.button!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: AppColor.defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: AppColor.shrineBrown900,
        bodyColor: AppColor.shrineBrown900,
      );
}


