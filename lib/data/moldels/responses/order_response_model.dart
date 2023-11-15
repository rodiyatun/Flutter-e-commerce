import 'dart:convert';

class OrderResponseModel {
    final List<Datum> data;
    final Meta meta;

    OrderResponseModel({
        required this.data,
        required this.meta,
    });

    factory OrderResponseModel.fromRawJson(String str) => OrderResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderResponseModel.fromJson(Map<String, dynamic> json) => OrderResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Datum {
    final int id;
    final Attributes attributes;

    Datum({
        required this.id,
        required this.attributes,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    final List<Item> items;
    final int totalPrice;
    final String deliveryAddress;
    final String courirName;
    final int courirPrice;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;
    final DateTime publishedAt;

    Attributes({
        required this.items,
        required this.totalPrice,
        required this.deliveryAddress,
        required this.courirName,
        required this.courirPrice,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
    });

    factory Attributes.fromRawJson(String str) => Attributes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        totalPrice: json["totalPrice"],
        deliveryAddress: json["deliveryAddress"],
        courirName: json["courirName"],
        courirPrice: json["courirPrice"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "deliveryAddress": deliveryAddress,
        "courirName": courirName,
        "courirPrice": courirPrice,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
    };
}

class Item {
    final int id;
    final int qty;
    final int price;
    final ProductName productName;

    Item({
        required this.id,
        required this.qty,
        required this.price,
        required this.productName,
    });

    factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        qty: json["qty"],
        price: json["price"],
        productName: productNameValues.map[json["productName"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "qty": qty,
        "price": price,
        "productName": productNameValues.reverse[productName],
    };
}

enum ProductName {
    BAJU,
    JACKET
}

final productNameValues = EnumValues({
    "baju": ProductName.BAJU,
    "Jacket": ProductName.JACKET
});

class Meta {
    final Pagination pagination;

    Meta({
        required this.pagination,
    });

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    final int page;
    final int pageSize;
    final int pageCount;
    final int total;

    Pagination({
        required this.page,
        required this.pageSize,
        required this.pageCount,
        required this.total,
    });

    factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
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
