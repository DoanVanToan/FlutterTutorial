import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'product.dart';

class TutorialHome extends StatelessWidget {
  var _generateProducts =
      List.generate(1000, (index) => Product(name: 'Eggs $index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation icon',
          onPressed: null,
        ),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
            tooltip: 'Search',
          )
        ],
      ),
      body: Center(
        child: ShoppingList(
          products: _generateProducts,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
