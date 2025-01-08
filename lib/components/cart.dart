import 'cart_item.dart';

class Cart {
  final List<CartItem> _items = []; // Private list to store cart items

  // Getter to retrieve the items in the cart
  List<CartItem> get items => _items;

  // Method to add an item to the cart
  void addItem(CartItem item) {
    _items.add(item);
  }

  // Method to remove an item from the cart
  void removeItem(CartItem item) {
    _items.remove(item);
  }

  // Method to get items
  List<CartItem> getItems() {
    return _items;
  }
}


