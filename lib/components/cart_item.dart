// This represents a single item in the cart.
class CartItem {
  final String name;
  final String description;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}
