import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  Product({this.name});

  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatefulWidget {
  ShoppingListItem({this.product, this.onCartChanged, this.isInCart});

  final Product product;
  final CartChangedCallback onCartChanged;
  final bool Function() isInCart;

  @override
  _ShoppingListItemState createState() => _ShoppingListItemState();
}

class _ShoppingListItemState extends State<ShoppingListItem> {
  Color _getColor(BuildContext context) {
    return widget.isInCart() ? Colors.red : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!widget.isInCart()) return null;
    return TextStyle(color: Colors.red, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(widget.product.name),
      onTap: () {
        setState(() {
          widget.onCartChanged(widget.product, !widget.isInCart());
        });
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(widget.product.name[0]),
      ),
      title: Text(
        widget.product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    return _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  final Set<Product> _shoppingCart = Set();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: widget.products.map((product) {
        var bool = _shoppingCart.contains(product);
        print("Contains $bool");
        print("_shoppingCart ${_shoppingCart}");
        return ShoppingListItem(
          product: product,
          isInCart: () {
            return _shoppingCart.contains(product);
          },
          onCartChanged: _handleCartChanged,
        );
      }).toList(),
    );
  }

  void _handleCartChanged(Product product, bool inCart) {
    print("_handleCartChanged ${product}");
      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
  }
}
