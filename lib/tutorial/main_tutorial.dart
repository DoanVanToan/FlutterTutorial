import 'package:flutter/material.dart';
import 'package:flutter_widget/tutorial/tutorial_home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              tooltip: 'Navigation menu',
              onPressed: null),
          Expanded(child: title),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              tooltip: 'Search',
              onPressed: null),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded(
              child: Center(
            child: Text('Hello world'),
          ))
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'My app',
    home: TutorialHome(),
  ));
}
