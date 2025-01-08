import 'package:flutter/foundation.dart';
import 'cart.dart';
import 'cart_item.dart';


class CartProvider extends ChangeNotifier {
  final Cart _cart = Cart();

  List<CartItem> get items => _cart.getItems();

  void addProductToCart(Map<String, dynamic> productData) {
    CartItem newItem = CartItem(
      name: productData['name'],
      description: productData['description'],
      price: productData['price'],
      quantity: productData['quantity']
    );

    bool itemExists = false;
    for (var item in _cart.items) {
      if (item.name == newItem.name) { // Compare based on a unique property, like name
        item.quantity++; // Increment quantity
        itemExists = true;
        break;
      }
    }

    // If the item does not exist, add it to the cart
    if (!itemExists) {
      _cart.addItem(newItem);
    }

    notifyListeners();
  }

  // Method to increase the quantity of an item
  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  // Method to decrease the quantity of an item
  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      // Optionally, remove the item if the quantity reaches 0
      _cart.removeItem(item);
    }
    notifyListeners();
  }

  // Method to remove an item completely from the cart
  void removeItem(CartItem item) {
    _cart.removeItem(item);
    notifyListeners();
  }
  
  double get totalPrice {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }  
}
