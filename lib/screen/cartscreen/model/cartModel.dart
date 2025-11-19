class CartItemModel {
  final String name;
  final String brand;
  final String image;
  final double price;
  int qty;

  CartItemModel({
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    this.qty = 1,
  });
}
