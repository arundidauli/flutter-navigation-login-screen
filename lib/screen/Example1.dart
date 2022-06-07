import 'package:flutter/material.dart';
import 'package:flutter_navigation/utils/utils.dart';

class Example1 extends StatefulWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  _Example1State createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  late String title = "This is Login Form";

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passController=TextEditingController();
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _emailController.text=(await Utility.getStringValue("email"))!;
      _passController.text=(await Utility.getStringValue("password"))!;

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example 1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.height * 0.10,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/image1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                    label: Text("Email")),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                    label: Text("Password")),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        title = "This is Login Form";
                      });
                      Utility.showAlert(context, "This is Login Form");
                      /* Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const HomePages()),
                      );*/
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "If you are a new user register here",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),

              Container(
                width: 200,
                margin: EdgeInsets.all(20),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        title = "This is Register Form";
                      });
                      Utility.setStringValue("email", _emailController.text.toString());
                      Utility.setStringValue("password", _passController.text.toString());
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(color: Colors.red)
                          )
                      )
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.menu, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.menu, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
