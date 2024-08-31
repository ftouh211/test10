
import 'dart:convert';

Ecomercy ecomercyFromJson(String str) => Ecomercy.fromJson(json.decode(str));

String ecomercyToJson(Ecomercy data) => json.encode(data.toJson());

class Ecomercy {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  Ecomercy({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Ecomercy.fromJson(Map<String, dynamic> json) => Ecomercy(
    products: List<Product>.from(
      json["products"]?.map((x) => Product.fromJson(x)) ?? [],
    ),
    total: json["total"] ?? 0,
    skip: json["skip"] ?? 0,
    limit: json["limit"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Product {
  final int id;
  final String title;
  final String description;
  final Category category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final AvailabilityStatus availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] ?? 0,
    title: json["title"] ?? '',
    description: json["description"] ?? '',
    category: categoryValues.map[json["category"]] ?? Category.SMARTPHONES,
    price: json["price"]?.toDouble() ?? 0.0,
    discountPercentage: json["discountPercentage"]?.toDouble() ?? 0.0,
    rating: json["rating"]?.toDouble() ?? 0.0,
    stock: json["stock"] ?? 0,
    tags: List<String>.from(json["tags"]?.map((x) => x) ?? []),
    brand: json["brand"] ?? '',
    sku: json["sku"] ?? '',
    weight: json["weight"] ?? 0,
    dimensions: Dimensions.fromJson(json["dimensions"] ?? {}),
    warrantyInformation: json["warrantyInformation"] ?? '',
    shippingInformation: json["shippingInformation"] ?? '',
    availabilityStatus: availabilityStatusValues.map[json["availabilityStatus"]] ?? AvailabilityStatus.IN_STOCK,
    reviews: List<Review>.from(json["reviews"]?.map((x) => Review.fromJson(x)) ?? []),
    returnPolicy: json["returnPolicy"] ?? '',
    minimumOrderQuantity: json["minimumOrderQuantity"] ?? 0,
    meta: Meta.fromJson(json["meta"] ?? {}),
    images: List<String>.from(json["images"]?.map((x) => x) ?? []),
    thumbnail: json["thumbnail"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "category": categoryValues.reverse[category] ?? '',
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "brand": brand,
    "sku": sku,
    "weight": weight,
    "dimensions": dimensions.toJson(),
    "warrantyInformation": warrantyInformation,
    "shippingInformation": shippingInformation,
    "availabilityStatus": availabilityStatusValues.reverse[availabilityStatus] ?? '',
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "returnPolicy": returnPolicy,
    "minimumOrderQuantity": minimumOrderQuantity,
    "meta": meta.toJson(),
    "images": List<dynamic>.from(images.map((x) => x)),
    "thumbnail": thumbnail,
  };
}

enum Category {
  SMARTPHONES
}

final categoryValues = EnumValues({
  "smartphones": Category.SMARTPHONES
});

enum AvailabilityStatus {
  IN_STOCK,
  OUT_OF_STOCK
}

final availabilityStatusValues = EnumValues({
  "In Stock": AvailabilityStatus.IN_STOCK,
  "Out of Stock": AvailabilityStatus.OUT_OF_STOCK
});

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    width: json["width"]?.toDouble() ?? 0.0,
    height: json["height"]?.toDouble() ?? 0.0,
    depth: json["depth"]?.toDouble() ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "depth": depth,
  };
}

class Meta {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now().toIso8601String()),
    barcode: json["barcode"] ?? '',
    qrCode: json["qrCode"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "barcode": barcode,
    "qrCode": qrCode,
  };
}

class Review {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    rating: json["rating"] ?? 0,
    comment: json["comment"] ?? '',
    date: DateTime.parse(json["date"] ?? DateTime.now().toIso8601String()),
    reviewerName: json["reviewerName"] ?? '',
    reviewerEmail: json["reviewerEmail"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "comment": comment,
    "date": date.toIso8601String(),
    "reviewerName": reviewerName,
    "reviewerEmail": reviewerEmail,
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