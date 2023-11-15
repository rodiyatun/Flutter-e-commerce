// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductsResponseModel {
    final List<Product>? data;
    final Meta? meta;

    ProductsResponseModel({
        this.data,
        this.meta,
    });

    factory ProductsResponseModel.fromJson(String str) => ProductsResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductsResponseModel.fromMap(Map<String, dynamic> json) => ProductsResponseModel(
        data: json["data"] == null ? [] : List<Product>.from(json["data"]!.map((x) => Product.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta?.toMap(),
    };
}

class Product {
    final int? id;
    final PurpleAttributes? attributes;

  String priceFormat;

  Product({
    this.id,
    this.attributes,
    required this.priceFormat,
  });

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String? get imagePath => null;

  get quantity => null;

  get price => null;

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        attributes: json["attributes"] == null ? null : PurpleAttributes.fromMap(json["attributes"]), priceFormat: '',
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
    };
}

class PurpleAttributes {
    final String? name;
    final String? description;
    final String? price;
    final int? stock;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final DateTime? publishedAt;
    final Images? images;
    final Categories? categories;

    PurpleAttributes({
        this.name,
        this.description,
        this.price,
        this.stock,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.images,
        this.categories,
    });

    factory PurpleAttributes.fromJson(String str) => PurpleAttributes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PurpleAttributes.fromMap(Map<String, dynamic> json) => PurpleAttributes(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        images: json["images"] == null ? null : Images.fromMap(json["images"]),
        categories: json["categories"] == null ? null : Categories.fromMap(json["categories"]),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "images": images?.toMap(),
        "categories": categories?.toMap(),
    };
}

class Categories {
    final List<CategoriesDatum>? data;

    Categories({
        this.data,
    });

    factory Categories.fromJson(String str) => Categories.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Categories.fromMap(Map<String, dynamic> json) => Categories(
        data: json["data"] == null ? [] : List<CategoriesDatum>.from(json["data"]!.map((x) => CategoriesDatum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class CategoriesDatum {
    final int? id;
    final FluffyAttributes? attributes;

    CategoriesDatum({
        this.id,
        this.attributes,
    });

    factory CategoriesDatum.fromJson(String str) => CategoriesDatum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategoriesDatum.fromMap(Map<String, dynamic> json) => CategoriesDatum(
        id: json["id"],
        attributes: json["attributes"] == null ? null : FluffyAttributes.fromMap(json["attributes"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
    };
}

class FluffyAttributes {
    final String? name;
    final String? description;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final DateTime? publishedAt;

    FluffyAttributes({
        this.name,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
    });

    factory FluffyAttributes.fromJson(String str) => FluffyAttributes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FluffyAttributes.fromMap(Map<String, dynamic> json) => FluffyAttributes(
        name: json["name"],
        description: json["description"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
    };
}

class Images {
    final List<ImagesDatum>? data;

  // ignore: prefer_typing_uninitialized_variables
  static var product3;

  // static String iconTrash;

    Images({
        this.data,
    });

    factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Images.fromMap(Map<String, dynamic> json) => Images(
        data: json["data"] == null ? [] : List<ImagesDatum>.from(json["data"]!.map((x) => ImagesDatum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class ImagesDatum {
    final int? id;
    final TentacledAttributes? attributes;

    ImagesDatum({
        this.id,
        this.attributes,
    });

    factory ImagesDatum.fromJson(String str) => ImagesDatum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ImagesDatum.fromMap(Map<String, dynamic> json) => ImagesDatum(
        id: json["id"],
        attributes: json["attributes"] == null ? null : TentacledAttributes.fromMap(json["attributes"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
    };
}

class TentacledAttributes {
    final String? name;
    final dynamic alternativeText;
    final dynamic caption;
    final int? width;
    final int? height;
    final Formats? formats;
    final String? hash;
    final String? ext;
    final String? mime;
    final double? size;
    final String? url;
    final dynamic previewUrl;
    final String? provider;
    final dynamic providerMetadata;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    TentacledAttributes({
        this.name,
        this.alternativeText,
        this.caption,
        this.width,
        this.height,
        this.formats,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.url,
        this.previewUrl,
        this.provider,
        this.providerMetadata,
        this.createdAt,
        this.updatedAt,
    });

    factory TentacledAttributes.fromJson(String str) => TentacledAttributes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TentacledAttributes.fromMap(Map<String, dynamic> json) => TentacledAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: json["formats"] == null ? null : Formats.fromMap(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats?.toMap(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

class Formats {
    final Large? small;
    final Large? thumbnail;
    final Large? medium;
    final Large? large;

    Formats({
        this.small,
        this.thumbnail,
        this.medium,
        this.large,
    });

    factory Formats.fromJson(String str) => Formats.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Formats.fromMap(Map<String, dynamic> json) => Formats(
        small: json["small"] == null ? null : Large.fromMap(json["small"]),
        thumbnail: json["thumbnail"] == null ? null : Large.fromMap(json["thumbnail"]),
        medium: json["medium"] == null ? null : Large.fromMap(json["medium"]),
        large: json["large"] == null ? null : Large.fromMap(json["large"]),
    );

    Map<String, dynamic> toMap() => {
        "small": small?.toMap(),
        "thumbnail": thumbnail?.toMap(),
        "medium": medium?.toMap(),
        "large": large?.toMap(),
    };
}

class Large {
    final String? ext;
    final String? url;
    final String? hash;
    final String? mime;
    final String? name;
    final dynamic path;
    final double? size;
    final int? width;
    final int? height;

    Large({
        this.ext,
        this.url,
        this.hash,
        this.mime,
        this.name,
        this.path,
        this.size,
        this.width,
        this.height,
    });

    factory Large.fromJson(String str) => Large.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Large.fromMap(Map<String, dynamic> json) => Large(
        ext: json["ext"],
        url: json["url"],
        hash: json["hash"],
        mime: json["mime"],
        name: json["name"],
        path: json["path"],
        size: json["size"]?.toDouble(),
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toMap() => {
        "ext": ext,
        "url": url,
        "hash": hash,
        "mime": mime,
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
    };
}

class Meta {
    final Pagination? pagination;

    Meta({
        this.pagination,
    });

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null ? null : Pagination.fromMap(json["pagination"]),
    );

    Map<String, dynamic> toMap() => {
        "pagination": pagination?.toMap(),
    };
}

class Pagination {
    final int? page;
    final int? pageSize;
    final int? pageCount;
    final int? total;

    Pagination({
        this.page,
        this.pageSize,
        this.pageCount,
        this.total,
    });

    factory Pagination.fromJson(String str) => Pagination.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
    );

    Map<String, dynamic> toMap() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
    };
}
