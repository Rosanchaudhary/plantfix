import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Plantfix/screens/prediction_screen.dart';

class ImagePreview extends StatefulWidget {
  const ImagePreview({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;
  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.file(
            File(widget.imagePath),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => Prediction(
                            imagePath: widget.imagePath,
                          )));
            },
            child: Icon(CupertinoIcons.checkmark),
            backgroundColor: Colors.green,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(CupertinoIcons.multiply),
            backgroundColor: Colors.red,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
