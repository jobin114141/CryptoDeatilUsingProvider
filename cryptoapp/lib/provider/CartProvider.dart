import 'package:cryptoapp/model/CartcryptoModel.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductCart> _items = [];
  List<ProductCart> get items => _items;

  void add(ProductCart item) {
    _items.add(item);
    print("added");
    notifyListeners();
  }

  void remove(ProductCart item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeall() {
    _items.clear();
    notifyListeners();
  }

  double getCartTotal() {
    return _items.fold(0, (previousValue, item) => previousValue + item.price);
  }
}
