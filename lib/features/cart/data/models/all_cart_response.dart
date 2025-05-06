import 'package:json_annotation/json_annotation.dart';

part 'all_cart_response.g.dart';

@JsonSerializable()
class AllCartResponse {
  AllCartResponse({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.v,
  });

  factory AllCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AllCartResponseFromJson(json);

  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "userId")
  final int? userId;
  @JsonKey(name: "date")
  final DateTime? date;
  @JsonKey(name: "products")
  final List<Product>? products;
  @JsonKey(name: "__v")
  final int? v;

  Map<String, dynamic> toJson() => _$AllCartResponseToJson(this);
}

@JsonSerializable()
class Product {
  Product({
    this.productId,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @JsonKey(name: "productId")
  final int? productId;
  @JsonKey(name: "quantity")
  final int? quantity;

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
