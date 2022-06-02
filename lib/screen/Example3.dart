import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example3 extends StatefulWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example3> {
  late Future<List<Character>> characterList;
  @override
  void initState() {
    super.initState();
    characterList = fetchData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Characters List"),
        ),
        body: Center(
            child: FutureBuilder<List<Character>>(
                future: characterList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Character>? data = snapshot.data;

                    return ListView.builder(
                        itemCount: data?.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(data![index].name),
                            subtitle: Text(data[index].nickname),
                            leading: CircleAvatar(
                              backgroundImage:
                              NetworkImage(data[index].img),
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }))
    );
  }

  Future<List<Character>> fetchData() async {
    final response =
    await http.get(Uri.parse("https://breakingbadapi.com/api/characters"));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Character.fromJson(data)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


}
class Character {
  final int id;
  final String name;
  final String img;
  final String nickname;

  const Character({
    required this.id,
    required this.name,
    required this.img,
    required this.nickname,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['char_id'],
        img: json['img'],
        name: json['name'],
        nickname: json['nickname']);
  }
}
