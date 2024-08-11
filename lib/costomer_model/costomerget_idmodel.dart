

import 'dart:convert';

CostomerGetIdeModel costomerGetIdeModelFromJson(String str) => CostomerGetIdeModel.fromJson(json.decode(str));

String costomerGetIdeModelToJson(CostomerGetIdeModel data) => json.encode(data.toJson());

class CostomerGetIdeModel {
  String? id;
  String? entity;
  String? name;
  String? email;
  String? contact;
  String? gstin;
  List<dynamic>? notes;
  List<dynamic>? shippingAddress;
  int? createdAt;

  CostomerGetIdeModel({
    this.id,
    this.entity,
    this.name,
    this.email,
    this.contact,
    this.gstin,
    this.notes,
    this.shippingAddress,
    this.createdAt,
  });

  factory CostomerGetIdeModel.fromJson(Map<String, dynamic> json) => CostomerGetIdeModel(
    id: json["id"],
    entity: json["entity"],
    name: json["name"],
    email: json["email"],
    contact: json["contact"],
    gstin: json["gstin"],
    notes: json["notes"] == null ? [] : List<dynamic>.from(json["notes"]!.map((x) => x)),
    shippingAddress: json["shipping_address"] == null ? [] : List<dynamic>.from(json["shipping_address"]!.map((x) => x)),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "entity": entity,
    "name": name,
    "email": email,
    "contact": contact,
    "gstin": gstin,
    "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
    "shipping_address": shippingAddress == null ? [] : List<dynamic>.from(shippingAddress!.map((x) => x)),
    "created_at": createdAt,
  };
}
