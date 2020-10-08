import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';

List<Catalogs> todoFromJson(String str) => new List<Catalogs>.from(json.decode(str).map((x) => Catalogs.fromJson(x)));


class Catalogs{
  int id;
  String name;
  String slug;
  String path;
  DateTime createdAt;
  DateTime updatedAt;

  Catalogs({
    this.id,
    this.name,
    this.slug,
    this.path,
    this.createdAt,
    this.updatedAt
});


  factory Catalogs.fromJson(Map<String, dynamic> json) => new Catalogs(
    //createdAt: DateTime.parse(json["created_at"]).toUtc(),
    //updatedAt: DateTime.parse(json["updated_at"]),
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "id": id,
    "name": name,
    "slug": slug,
    "path": path,
  };

}