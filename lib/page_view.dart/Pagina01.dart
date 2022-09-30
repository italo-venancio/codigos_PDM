
import 'package:flutter/material.dart';

class Pagina01 extends StatefulWidget {
  const Pagina01({ Key? key }) : super(key: key);

  @override
  State<Pagina01> createState() => _Pagina01State();
}

class _Pagina01State extends State<Pagina01> {
  @override
  Widget build(BuildContext context) {
    return Container(
            child: 
              Center(child: Image.network('https://live.staticflickr.com/2268/2273155758_f3cf37c942_b.jpg')),
            color: Colors.green,
            
    );
  }
}