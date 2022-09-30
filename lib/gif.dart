import 'package:flutter/material.dart';

class GifPage extends StatelessWidget {
  
  final Map _gifData;
  GifPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_gifData["title"]),
          backgroundColor: Colors.black,
          //actions: <Widgets>[
          //IconButton(
          //icon: Icon(Icons.share),
          //onPressed: () {},
          //)
          //],
        ),
        body: Center(
          child: Image.network(_gifData["images"]["fixed_height"]["url"]),
        ));
  }
}
