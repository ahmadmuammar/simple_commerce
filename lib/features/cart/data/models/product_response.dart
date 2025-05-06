import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  ProductResponse({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "rating")
  final Rating? rating;

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class Rating {
  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  @JsonKey(name: "rate")
  final double? rate;
  @JsonKey(name: "count")
  final int? count;

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
