import 'dart:convert';

String addToCartToJson(AddToCart data) => json.encode(data.toJson());

class AddToCart {
    String productId;
    int quantity;

    AddToCart({
        required this.productId,
        required this.quantity,
    });


    Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
    };
}
