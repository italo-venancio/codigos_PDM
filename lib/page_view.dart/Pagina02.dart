import 'package:flutter/material.dart';

class Pagina02 extends StatefulWidget {
  const Pagina02({ Key? key }) : super(key: key);

  @override
  State<Pagina02> createState() => _Pagina02State();
}

class _Pagina02State extends State<Pagina02> {
  @override
  Widget build(BuildContext context) {
    return Container(
            child:
              Center(child: Text('Pagina02')),
            color: Colors.cyan,
    );
  }
}