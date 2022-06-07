
import 'dart:io';
import 'package:flutter_navigation/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example4 extends StatefulWidget {
  const Example4({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}
enum ImageSourceType { gallery, camera }

class _ExampleState extends State<Example4> {

  //bool isOnline = await Utility.checkConnection();

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker Example"),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                color: Colors.blue,
                child: const Text(
                  "Pick Image from Gallery",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.gallery);
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: const Text(
                  "Pick Image from Camera",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.camera);
                },
              ),
            ],
          ),
        ));
  }


}
class ImageFromGalleryEx extends StatefulWidget {
  late var type;
  ImageFromGalleryEx(this.type, {Key? key}) : super(key: key);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  var _image;
  var imagePicker;
  var type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    checkInternet();

  }

  void checkInternet(){
    Future.delayed(Duration.zero,() async{
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(type == ImageSourceType.camera
              ? "Image from Camera"
              : "Image from Gallery")),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 52,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.red[200]),
                child: _image != null
                    ? Image.file(
                  _image,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.fitHeight,
                )
                    : Container(
                  decoration: BoxDecoration(
                      color: Colors.red[200]),
                  width: 200,
                  height: 200,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget errorMsg(String text,bool show){
    //error message widget.
    if(show == true){
      //if error is true then show error message box
      return Container(
        padding: const EdgeInsets.all(10.00),
        margin: const EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [

          Container(
            margin: const EdgeInsets.only(right:6.00),
            child: const Icon(Icons.info, color: Colors.white),
          ), // icon for error message

          Text(text, style: const TextStyle(color: Colors.white)),
          //show error message text
        ]),
      );
    }else{
      return Container();
      //if error is false, return empty container.
    }
  }
}
