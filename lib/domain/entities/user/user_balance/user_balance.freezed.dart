// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBalance _$UserBalanceFromJson(Map<String, dynamic> json) {
  return _UserBalance.fromJson(json);
}

/// @nodoc
mixin _$UserBalance {
  User get user => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  /// Serializes this UserBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBalanceCopyWith<UserBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBalanceCopyWith<$Res> {
  factory $UserBalanceCopyWith(
          UserBalance value, $Res Function(UserBalance) then) =
      _$UserBalanceCopyWithImpl<$Res, UserBalance>;
  @useResult
  $Res call({User user, double balance});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserBalanceCopyWithImpl<$Res, $Val extends UserBalance>
    implements $UserBalanceCopyWith<$Res> {
  _$UserBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserBalanceImplCopyWith<$Res>
    implements $UserBalanceCopyWith<$Res> {
  factory _$$UserBalanceImplCopyWith(
          _$UserBalanceImpl value, $Res Function(_$UserBalanceImpl) then) =
      __$$UserBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, double balance});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserBalanceImplCopyWithImpl<$Res>
    extends _$UserBalanceCopyWithImpl<$Res, _$UserBalanceImpl>
    implements _$$UserBalanceImplCopyWith<$Res> {
  __$$UserBalanceImplCopyWithImpl(
      _$UserBalanceImpl _value, $Res Function(_$UserBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? balance = null,
  }) {
    return _then(_$UserBalanceImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBalanceImpl implements _UserBalance {
  const _$UserBalanceImpl({required this.user, required this.balance});

  factory _$UserBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBalanceImplFromJson(json);

  @override
  final User user;
  @override
  final double balance;

  @override
  String toString() {
    return 'UserBalance(user: $user, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBalanceImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, balance);

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBalanceImplCopyWith<_$UserBalanceImpl> get copyWith =>
      __$$UserBalanceImplCopyWithImpl<_$UserBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBalanceImplToJson(
      this,
    );
  }
}

abstract class _UserBalance implements UserBalance {
  const factory _UserBalance(
      {required final User user,
      required final double balance}) = _$UserBalanceImpl;

  factory _UserBalance.fromJson(Map<String, dynamic> json) =
      _$UserBalanceImpl.fromJson;

  @override
  User get user;
  @override
  double get balance;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBalanceImplCopyWith<_$UserBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
