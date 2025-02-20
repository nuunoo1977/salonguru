// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductResponseModel _$ProductResponseModelFromJson(Map<String, dynamic> json) {
  return _ProductResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProductResponseModel {
  int get statusCode => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;

  /// Create a copy of ProductResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductResponseModelCopyWith<ProductResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductResponseModelCopyWith<$Res> {
  factory $ProductResponseModelCopyWith(
          ProductResponseModel value, $Res Function(ProductResponseModel) then) =
      _$ProductResponseModelCopyWithImpl<$Res, ProductResponseModel>;
  @useResult
  $Res call({int statusCode, List<ProductModel> products});
}

/// @nodoc
class _$ProductResponseModelCopyWithImpl<$Res, $Val extends ProductResponseModel>
    implements $ProductResponseModelCopyWith<$Res> {
  _$ProductResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductResponseModelImplCopyWith<$Res>
    implements $ProductResponseModelCopyWith<$Res> {
  factory _$$ProductResponseModelImplCopyWith(
          _$ProductResponseModelImpl value, $Res Function(_$ProductResponseModelImpl) then) =
      __$$ProductResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, List<ProductModel> products});
}

/// @nodoc
class __$$ProductResponseModelImplCopyWithImpl<$Res>
    extends _$ProductResponseModelCopyWithImpl<$Res, _$ProductResponseModelImpl>
    implements _$$ProductResponseModelImplCopyWith<$Res> {
  __$$ProductResponseModelImplCopyWithImpl(
      _$ProductResponseModelImpl _value, $Res Function(_$ProductResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? products = null,
  }) {
    return _then(_$ProductResponseModelImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ProductResponseModelImpl extends _ProductResponseModel {
  const _$ProductResponseModelImpl(
      {required this.statusCode, required final List<ProductModel> products})
      : _products = products,
        super._();

  factory _$ProductResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductResponseModelImplFromJson(json);

  @override
  final int statusCode;
  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductResponseModel(statusCode: $statusCode, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductResponseModelImpl &&
            (identical(other.statusCode, statusCode) || other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, statusCode, const DeepCollectionEquality().hash(_products));

  /// Create a copy of ProductResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductResponseModelImplCopyWith<_$ProductResponseModelImpl> get copyWith =>
      __$$ProductResponseModelImplCopyWithImpl<_$ProductResponseModelImpl>(this, _$identity);
}

abstract class _ProductResponseModel extends ProductResponseModel {
  const factory _ProductResponseModel(
      {required final int statusCode,
      required final List<ProductModel> products}) = _$ProductResponseModelImpl;
  const _ProductResponseModel._() : super._();

  factory _ProductResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProductResponseModelImpl.fromJson;

  @override
  int get statusCode;
  @override
  List<ProductModel> get products;

  /// Create a copy of ProductResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductResponseModelImplCopyWith<_$ProductResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
