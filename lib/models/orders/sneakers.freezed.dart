// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sneakers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sneakers _$SneakersFromJson(Map<String, dynamic> json) {
  return _Sneakers.fromJson(json);
}

/// @nodoc
mixin _$Sneakers {
// required String id,
  List<String> get images => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get category =>
      throw _privateConstructorUsedError; // required List<String> imageUrl,
  String? get oldPrice => throw _privateConstructorUsedError;
  bool? get isSelected =>
      throw _privateConstructorUsedError; // required List<Size> sizes,
  int? get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SneakersCopyWith<Sneakers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SneakersCopyWith<$Res> {
  factory $SneakersCopyWith(Sneakers value, $Res Function(Sneakers) then) =
      _$SneakersCopyWithImpl<$Res, Sneakers>;
  @useResult
  $Res call(
      {List<String> images,
      int? stock,
      String? name,
      String? title,
      String? category,
      String? oldPrice,
      bool? isSelected,
      int? price,
      String? description});
}

/// @nodoc
class _$SneakersCopyWithImpl<$Res, $Val extends Sneakers>
    implements $SneakersCopyWith<$Res> {
  _$SneakersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? stock = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? oldPrice = freezed,
    Object? isSelected = freezed,
    Object? price = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPrice: freezed == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SneakersImplCopyWith<$Res>
    implements $SneakersCopyWith<$Res> {
  factory _$$SneakersImplCopyWith(
          _$SneakersImpl value, $Res Function(_$SneakersImpl) then) =
      __$$SneakersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> images,
      int? stock,
      String? name,
      String? title,
      String? category,
      String? oldPrice,
      bool? isSelected,
      int? price,
      String? description});
}

/// @nodoc
class __$$SneakersImplCopyWithImpl<$Res>
    extends _$SneakersCopyWithImpl<$Res, _$SneakersImpl>
    implements _$$SneakersImplCopyWith<$Res> {
  __$$SneakersImplCopyWithImpl(
      _$SneakersImpl _value, $Res Function(_$SneakersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? stock = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? oldPrice = freezed,
    Object? isSelected = freezed,
    Object? price = freezed,
    Object? description = freezed,
  }) {
    return _then(_$SneakersImpl(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPrice: freezed == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SneakersImpl with DiagnosticableTreeMixin implements _Sneakers {
  const _$SneakersImpl(
      {required final List<String> images,
      required this.stock,
      required this.name,
      required this.title,
      required this.category,
      required this.oldPrice,
      required this.isSelected,
      required this.price,
      required this.description})
      : _images = images;

  factory _$SneakersImpl.fromJson(Map<String, dynamic> json) =>
      _$$SneakersImplFromJson(json);

// required String id,
  final List<String> _images;
// required String id,
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final int? stock;
  @override
  final String? name;
  @override
  final String? title;
  @override
  final String? category;
// required List<String> imageUrl,
  @override
  final String? oldPrice;
  @override
  final bool? isSelected;
// required List<Size> sizes,
  @override
  final int? price;
  @override
  final String? description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Sneakers(images: $images, stock: $stock, name: $name, title: $title, category: $category, oldPrice: $oldPrice, isSelected: $isSelected, price: $price, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Sneakers'))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('stock', stock))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('oldPrice', oldPrice))
      ..add(DiagnosticsProperty('isSelected', isSelected))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SneakersImpl &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.oldPrice, oldPrice) ||
                other.oldPrice == oldPrice) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      stock,
      name,
      title,
      category,
      oldPrice,
      isSelected,
      price,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SneakersImplCopyWith<_$SneakersImpl> get copyWith =>
      __$$SneakersImplCopyWithImpl<_$SneakersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SneakersImplToJson(
      this,
    );
  }
}

abstract class _Sneakers implements Sneakers {
  const factory _Sneakers(
      {required final List<String> images,
      required final int? stock,
      required final String? name,
      required final String? title,
      required final String? category,
      required final String? oldPrice,
      required final bool? isSelected,
      required final int? price,
      required final String? description}) = _$SneakersImpl;

  factory _Sneakers.fromJson(Map<String, dynamic> json) =
      _$SneakersImpl.fromJson;

  @override // required String id,
  List<String> get images;
  @override
  int? get stock;
  @override
  String? get name;
  @override
  String? get title;
  @override
  String? get category;
  @override // required List<String> imageUrl,
  String? get oldPrice;
  @override
  bool? get isSelected;
  @override // required List<Size> sizes,
  int? get price;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$SneakersImplCopyWith<_$SneakersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
