

import 'dart:convert';

CostomerGetIdeModel costomerGetIdeModelFromJson(String str) => CostomerGetIdeModel.fromJson(json.decode(str));

String costomerGetIdeModelToJson(CostomerGetIdeModel data) => json.encode(data.toJson());

class CostomerGetIdeModel {
  String? entity;
  int? count;
  List<Item>? items;

  CostomerGetIdeModel({
    this.entity,
    this.count,
    this.items,
  });

  factory CostomerGetIdeModel.fromJson(Map<String, dynamic> json) => CostomerGetIdeModel(
    entity: json["entity"],
    count: json["count"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "entity": entity,
    "count": count,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  String? id;
  Entity? entity;
  String? name;
  String? email;
  String? contact;
  Gstin? gstin;
  dynamic notes;
  List<dynamic>? shippingAddress;
  int? createdAt;

  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    entity: entityValues.map[json["entity"]]!,
    name: json["name"],
    email: json["email"],
    contact: json["contact"],
    gstin: gstinValues.map[json["gstin"]]!,
    notes: json["notes"],
    shippingAddress: json["shipping_address"] == null ? [] : List<dynamic>.from(json["shipping_address"]!.map((x) => x)),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "entity": entityValues.reverse[entity],
    "name": name,
    "email": email,
    "contact": contact,
    "gstin": gstinValues.reverse[gstin],
    "notes": notes,
    "shipping_address": shippingAddress == null ? [] : List<dynamic>.from(shippingAddress!.map((x) => x)),
    "created_at": createdAt,
  };
}

enum Entity {
  CUSTOMER
}

final entityValues = EnumValues({
  "customer": Entity.CUSTOMER
});

enum Gstin {
  EMPTY,
  THE_12_ABCDE2356_F7_GH
}

final gstinValues = EnumValues({
  "": Gstin.EMPTY,
  "12ABCDE2356F7GH": Gstin.THE_12_ABCDE2356_F7_GH
});

class NotesClass {
  String? notesKey1;
  String? notesKey2;

  NotesClass({
    this.notesKey1,
    this.notesKey2,
  });

  factory NotesClass.fromJson(Map<String, dynamic> json) => NotesClass(
    notesKey1: json["notes_key_1"],
    notesKey2: json["notes_key_2"],
  );

  Map<String, dynamic> toJson() => {
    "notes_key_1": notesKey1,
    "notes_key_2": notesKey2,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
