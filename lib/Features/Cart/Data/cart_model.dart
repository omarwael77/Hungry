// ignore_for_file: non_constant_identifier_names

class CartModel {
  final int id;
  final int qty;
  final double spaicy;
  final List<int> toppings;
  final List<int> side_options;

  CartModel({
    required this.id,
    required this.qty,
    required this.spaicy,
    required this.toppings,
    required this.side_options,
  });

  Map<String, dynamic> toJson() => {
        "product_id": id,
        "quantity": qty,
        "spicy": spaicy,
        "toppings": toppings,
        "side_options": side_options,
      };
}

class CartRequestModel {
  final List<CartModel> items;

  CartRequestModel({required this.items});

  Map<String, dynamic> toJson() => {
        "items": items.map((e) => e.toJson()).toList(),
      };
}