// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCartResponse _$AllCartResponseFromJson(Map<String, dynamic> json) =>
    AllCartResponse(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AllCartResponseToJson(AllCartResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date?.toIso8601String(),
      'products': instance.products,
      '__v': instance.v,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: (json['productId'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
