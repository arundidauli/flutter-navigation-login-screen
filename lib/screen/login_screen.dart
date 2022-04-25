import 'package:flutter/material.dart';
import 'package:flutter_navigation/screen/networking_example.dart';
import 'package:flutter_navigation/screen/networking_example1.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Navigation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.15,
                    width: MediaQuery.of(context).size.height*0.15,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/lock.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),


                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      label: Text("Email")),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      label: Text("Password")),
                  obscureText: true,
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(onPressed: () async {


                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const NetworkingExample()),
                    );

                  }, child: const Text("Login")),
                )

              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
