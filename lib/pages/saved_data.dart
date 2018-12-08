import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedPage extends StatefulWidget {
  Set<WordPair> _saved;
  SavedPage(this._saved);

  @override
  SavedPageData createState() => new SavedPageData(_saved);
}

class SavedPageData extends State<SavedPage> {
  Set<WordPair> _saved;
  final _biggerFont = const TextStyle(fontSize: 18.0);
  SavedPageData(this._saved);

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = _saved.map(
          (WordPair pair) {
        return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
            trailing: new Icon(
              Icons.clear,
              color: Colors.red,
            ),
            onTap: () {
              setState(() {
                _saved.remove(pair);
              });
            }
        );
      },
    );
    final List<Widget> divided = ListTile
        .divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: new ListView(children: divided),
    );
  }
}