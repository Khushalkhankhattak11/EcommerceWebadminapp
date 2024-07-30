import 'package:ecommerceadmin/models/Review.dart';

class Product {
  String? id;
  String? name;
  String? description;
  double? stock;
  double? sellPrice;
  double? purchasePrice;
  String? unit;
  double? unitPrice;
  List<String>? tags;
  String? category;
  String? subCategory;
  String? unitType;
  List<String>? images;
  String? createAt;
  String? updatedAt;
  bool? isActive;
  List<Review>? reviews;
  double? discount;
  String? discountStartDate;
  String? discountEndData;
  String? supplier;
  double? averageRating;

  Product({
    this.id,
    this.name,
    this.description,
    this.stock,
    this.sellPrice,
    this.purchasePrice,
    this.unit,
    this.unitPrice,
    this.tags,
    this.category,
    this.subCategory,
    this.unitType,
    this.images,
    this.createAt,
    this.updatedAt,
    this.isActive,
    this.reviews,
    this.discount,
    this.discountStartDate,
    this.discountEndData,
    this.supplier,
    this.averageRating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      stock: (json["stock"] as num?)?.toDouble(),
      sellPrice: (json["sellPrice"] as num?)?.toDouble(),
      purchasePrice: (json["purchasePrice"] as num?)?.toDouble(),
      unit: json["unit"],
      unitPrice: (json["unitPrice"] as num?)?.toDouble(),
      tags: List<String>.from(json["tags"] ?? []),
      category: json["category"],
      subCategory: json["subCategory"],
      unitType: json["unitType"],
      images: List<String>.from(json["images"] ?? []),
      createAt: json["createAt"],
      updatedAt: json["updatedAt"],
      isActive: json["isActive"] as bool?,
      reviews: (json["reviews"] as List?)?.map((review) => Review.fromJson(review)).toList(),
      discount: (json["discount"] as num?)?.toDouble(),
      discountStartDate: json["discountStartDate"],
      discountEndData: json["discountEndData"],
      supplier: json["supplier"],
      averageRating: (json["averageRating"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["stock"] = stock;
    data["sellPrice"] = sellPrice;
    data["purchasePrice"] = purchasePrice;
    data["unit"] = unit;
    data["unitPrice"] = unitPrice;
    data["tags"] = tags;
    data["category"] = category;
    data["subCategory"] = subCategory;
    data["unitType"] = unitType;
    data["images"] = images;
    data["createAt"] = createAt;
    data["updatedAt"] = updatedAt;
    data["isActive"] = isActive;
    data["reviews"] = reviews?.map((review) => review.toJson()).toList();
    data["discount"] = discount;
    data["discountStartDate"] = discountStartDate;
    data["discountEndData"] = discountEndData;
    data["supplier"] = supplier;
    data["averageRating"] = averageRating;
    return data;
  }
}
