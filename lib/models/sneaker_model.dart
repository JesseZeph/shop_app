import 'dart:convert';

import 'orders/sneakers.dart';

List<Sneakers> sneakersFromJson(String str) => List<Sneakers>.from(json.decode(str).map((x) => Sneakers.fromJson(x)));

String sneakersToJson(List<Sneakers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/*class Sneakers {
    final String id;
    final String name;
    final String title;
    final String category;
    final List<String> imageUrl;
    final String oldPrice;
    final List<dynamic> sizes;
    final String price;
    final String description;

    Sneakers({
        required this.id,
        required this.name,
        required this.title,
        required this.category,
        required this.imageUrl,
        required this.oldPrice,
        required this.sizes,
        required this.price,
        required this.description,
    });

    factory Sneakers.fromJson(Map<String, dynamic> json) => Sneakers(
        id: json["_id"] ?? "",
        name: json["name"],
        title: json["title"],
        category: json["category"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        oldPrice: json["oldPrice"],
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        price: json["price"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "title": title,
        "category": category,
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
        "oldPrice": oldPrice,
        "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
        "price": price,
        "description": description,
    };
}

class Size {
    final String size;
    final bool isSelected;
    final String id;

    Size({
        required this.size,
        required this.isSelected,
        required this.id,
    });

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        size: json["size.dart"] as String,
        isSelected: json["isSelected"] as bool,
        id: json["_id"] as String,
    );

    Map<String, dynamic> toJson() => {
        "size.dart": size,
        "isSelected": isSelected,
        "_id": id,
    };
}*/
