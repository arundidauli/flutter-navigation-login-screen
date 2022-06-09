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
  late Future<List<Posts>> postsList;

  @override
  void initState() {
    super.initState();
    characterList = fetchData();
    postsList = fetchPosts();
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
                          return _buildContainer(data![index]);
                        });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                })));
  }

  Widget _buildContainer(Character data) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(data.img),
                backgroundColor: Colors.greenAccent,
                radius: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.nickname,
                      style: const TextStyle(fontSize: 15, color: Colors.black26),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      elevation: 5,
      shadowColor: Colors.greenAccent,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white10)),
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

  Future<List<Posts>> fetchPosts() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Posts.fromJson(data)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class Posts {
  int? userId;
  int? id;
  String? title;
  String? body;

  Posts({this.userId, this.id, this.title, this.body});

  Posts.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
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
