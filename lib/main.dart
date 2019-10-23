import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escolha o celular que quer comprar:',
      home: Produto(),
    );
  }
}

class ProdutoState extends State<Produto> {
  final _suggestions = <String>["MotoG5S","MotoG5Plus","MotoG5Splus","J5","J7 metal",
  "Jota7 Pro","Xiaomi redmi 7","Xiaomi redmi 8"
  ];

  final Set<String> _saved = Set<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha o celular que quer comprar:'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(18.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            return null;
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(String pro) {
    final bool alreadySaved = _saved.contains(pro);
    return ListTile(
        title: Text(pro),
        trailing: Icon(
          alreadySaved ? Icons.check_box : Icons.check_box_outline_blank,
          color: alreadySaved ? Colors.blue : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pro);
            } else {
              _saved.add(pro);
            }
          });
        });
  }
}

class Produto extends StatefulWidget {
  @override
  ProdutoState createState() => ProdutoState();
}