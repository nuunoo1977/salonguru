// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckoutItemModel {
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this CheckoutItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutItemModelCopyWith<CheckoutItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutItemModelCopyWith<$Res> {
  factory $CheckoutItemModelCopyWith(
          CheckoutItemModel value, $Res Function(CheckoutItemModel) then) =
      _$CheckoutItemModelCopyWithImpl<$Res, CheckoutItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'quantity') int quantity});
}

/// @nodoc
class _$CheckoutItemModelCopyWithImpl<$Res, $Val extends CheckoutItemModel>
    implements $CheckoutItemModelCopyWith<$Res> {
  _$CheckoutItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutItemModelImplCopyWith<$Res>
    implements $CheckoutItemModelCopyWith<$Res> {
  factory _$$CheckoutItemModelImplCopyWith(_$CheckoutItemModelImpl value,
          $Res Function(_$CheckoutItemModelImpl) then) =
      __$$CheckoutItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'quantity') int quantity});
}

/// @nodoc
class __$$CheckoutItemModelImplCopyWithImpl<$Res>
    extends _$CheckoutItemModelCopyWithImpl<$Res, _$CheckoutItemModelImpl>
    implements _$$CheckoutItemModelImplCopyWith<$Res> {
  __$$CheckoutItemModelImplCopyWithImpl(_$CheckoutItemModelImpl _value,
      $Res Function(_$CheckoutItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_$CheckoutItemModelImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$CheckoutItemModelImpl extends _CheckoutItemModel {
  const _$CheckoutItemModelImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'quantity') required this.quantity})
      : super._();

  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  @JsonKey(name: 'quantity')
  final int quantity;

  @override
  String toString() {
    return 'CheckoutItemModel(productId: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutItemModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity);

  /// Create a copy of CheckoutItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutItemModelImplCopyWith<_$CheckoutItemModelImpl> get copyWith =>
      __$$CheckoutItemModelImplCopyWithImpl<_$CheckoutItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutItemModelImplToJson(
      this,
    );
  }
}

abstract class _CheckoutItemModel extends CheckoutItemModel {
  const factory _CheckoutItemModel(
          {@JsonKey(name: 'product_id') required final int productId,
          @JsonKey(name: 'quantity') required final int quantity}) =
      _$CheckoutItemModelImpl;
  const _CheckoutItemModel._() : super._();

  @override
  @JsonKey(name: 'product_id')
  int get productId;
  @override
  @JsonKey(name: 'quantity')
  int get quantity;

  /// Create a copy of CheckoutItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutItemModelImplCopyWith<_$CheckoutItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
