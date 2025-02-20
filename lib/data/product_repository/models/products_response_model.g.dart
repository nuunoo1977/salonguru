// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductResponseModelImpl _$$ProductResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductResponseModelImpl(
      statusCode: (json['statusCode'] as num).toInt(),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
