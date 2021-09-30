
   
import 'package:flutter/material.dart';
import 'package:monibie/models/cart_item.dart';

class ShoppingCart with ChangeNotifier {
  List<CartItemModel> _shoppingCart = [];

  int get count => _shoppingCart.length;

  List<CartItemModel> get cart => _shoppingCart;

  void addItem(CartItemModel item) {
    _shoppingCart.add(item);
    notifyListeners();
  }

 void removeItem(CartItemModel item) {
    _shoppingCart.remove(item);
    notifyListeners();
  }
}