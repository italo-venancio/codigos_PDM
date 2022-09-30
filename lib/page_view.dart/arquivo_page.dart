import 'package:flutter/material.dart';

import 'Pagina01.dart';
import 'Pagina02.dart';
import 'arquivo_drawer.dart';

class Page_View extends StatefulWidget {
  const Page_View({ Key? key }) : super(key: key);

  @override
  State<Page_View> createState() => _Page_ViewState();
}

class _Page_ViewState extends State<Page_View> {
  PageController _pageController = PageController(initialPage: 0);
  int _indexBottomNavigationBar = 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PageView")),
      body: PageView(
        controller: _pageController,
        children: [
          Pagina01(),
          Pagina02(),
        ],
      ),
      drawer: const meuDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexBottomNavigationBar,
        onTap: (index) {
          setState(() {
            _indexBottomNavigationBar = index;
          });
          _pageController.animateToPage(
            index, 
            duration: Duration(milliseconds: 300), 
            curve: Curves.easeInCirc,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Star",
          ),
        ]
      ),
    );
  }
}
void main() {
  runApp(
    MaterialApp(
      title: 'Aplicacao MovieDB',
      theme: ThemeData.light(),
      home: Page_View(),

    ),
  );
}