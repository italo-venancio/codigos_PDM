import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

import 'gif.dart';
//import 'gif_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
    String _search = "";
    int _offset = 0;

Future<Map> _getGifs() async {
  http.Response response;
  if(_search == "" || _search.isEmpty){
    response = await http.get(Uri.parse(
      "https://api.giphy.com/v1/gifs/trending?api_key=GW3lTad7GY3TqokBwSCMGpB4sAW4XbWL&limit=20&rating=g"
    ));
  }
  else{
    //response = await http.get(Uri.parse(
    //  "https://api.giphy.com/v1/gifs/trending?api_key=GW3lTad7GY3TqokBwSCMGpB4sAW4XbWL&q=$_search&limit=20&offset=$_offset&rating=g&lang=en"
    //));
    response = await http.get(Uri.parse(
      "https://api.giphy.com/v1/gifs/search?api_key=GW3lTad7GY3TqokBwSCMGpB4sAW4XbWL&q=$_search&limit=25&offset=$_offset&rating=g&lang=pt"
    ));
    
    }
  return json.decode(response.body);
}

@override
void initState() {
  super.initState();
  _getGifs().then((map){
    print("=======================");
    //print(map);
    print("=======================");
  }
  );
}

int _getCount(List data){
  if (_search == null){
    return data.length;
  }
  else {
    return data.length + 1;
  }
}

Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
  return GridView.builder(
    padding: EdgeInsets.all(10.0),
    itemCount: _getCount(snapshot.data["data"]),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, 
      crossAxisSpacing: 10.0, 
      mainAxisSpacing: 10.0,
    ),
    itemBuilder: (context, index){
      if (_search == null || index<snapshot.data["data"].length){
      
        return GestureDetector(child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: snapshot.data["data"][index]["images"]["fixed_height"]["url"],
          height: 200.0,
          ),
          onSecondaryTap: (){
            print("cliquei ...");
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    GifPage(snapshot.data["data"][index])
              )
            );
          }

        );
      }
      else {
        return Container();
      }
    }
  );
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          height: 56, 
          child: Image.network(
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/02dea395998833.5ea460d10b123.gif",
            fit: BoxFit.fitHeight,

          )
          )

        ),
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Pesquise Aqui!",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()
                ),
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.center,
                onSubmitted: (text) {
                  setState(() {
                    _search = text;
                    _offset = 0;
                  });
                },
              )
            ),
            Expanded(
              child: FutureBuilder(
                future: _getGifs(),
                builder: (context, snapshot){

                  switch (snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Container(color: Colors.red,);
                      }
                      else {
                        return _createGifTable(context, snapshot);
                        //return Container(color: Colors.green,); 
                      }
                  }
                }
                  
              )
            )
          ]
        )

      );
    
  }
}

