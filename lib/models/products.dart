import 'dart:convert';


List<Products> productFromJson(String str) => new List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

class Products{
  int id;
  String title;
  String images;
  String ed_massa;
  String price;
  DateTime createdAt;
  DateTime updatedAt;

  Products({
    this.id,
    this.title,
    this.images,
    this.ed_massa,
    this.price,
    this.createdAt,
    this.updatedAt
  });


  factory Products.fromJson(Map<String, dynamic> json) => new Products(
    //createdAt: DateTime.parse(json["created_at"]).toUtc(),
    //updatedAt: DateTime.parse(json["updated_at"]),
    id: json["id"],
    title: json["title"],
    images: json["images"],
    ed_massa: json["ed_massa"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "id": id,
    "title": title,
    "images": images,
    "ed_massa": ed_massa,
    "price": price,
  };

}