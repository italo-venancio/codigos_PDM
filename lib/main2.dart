import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final wordPair = ["italo", "marianny", "sara"]; 
  final _suggestions = <String>["italo", "marianny", "sara"];  
  final _saved = <String>{};               // NEW
  final _biggerFont = const TextStyle(fontSize: 18); // NEW
  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
   Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
     
      itemBuilder: (BuildContext _context, int i) {
        
        if (i.isOdd) {
          return Divider();
        }

        
        final int index = i ~/ 2;
        
        if (index >= _suggestions.length) {
         
          _suggestions.addAll(["italo", "marianny", "sara"]);
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
  Widget _buildRow(String pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
      ),
      trailing: Icon(   
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
        semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
      ),                
      onTap: () {      // NEW lines from here...
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else { 
            _saved.add(pair); 
          } 
        });
      },               // ... to here.
    );
  }
}
