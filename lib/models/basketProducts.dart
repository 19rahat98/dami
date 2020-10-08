import 'dart:convert';


List<Baskets> basketsFromJson(String str) => new List<Baskets>.from(json.decode(str).map((x) => Baskets.fromJson(x)));

class Baskets{
  int id;
  String title;
  String images;
  String ed_massa;
  String price;
  DateTime createdAt;
  DateTime updatedAt;

  Baskets({
    this.id,
    this.title,
    this.images,
    this.ed_massa,
    this.price,
    this.createdAt,
    this.updatedAt
  });


  factory Baskets.fromJson(Map<String, dynamic> json) => new Baskets(
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