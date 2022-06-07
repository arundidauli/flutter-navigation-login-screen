import 'package:flutter/material.dart';
import 'package:flutter_navigation/utils/utils.dart';

class Example5 extends StatefulWidget {
  const Example5({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example5> {
  final TextEditingController _controller = TextEditingController();
  late String name = "Click on Get value";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Utility.setStringValue("name", _controller.text);
                    },
                    child: const Text("Save Value")),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Future.delayed(Duration.zero, () async {
                        name = (await Utility.getStringValue("name"))!;
                      });
                      setState(() {});
                    },
                    child: const Text("Get Value")),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
