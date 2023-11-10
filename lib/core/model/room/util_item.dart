import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_smart_rent_admin/core/enums/utilities.dart';
import 'package:flutter_smart_rent_admin/core/model/location/location.dart';

part 'util_item.freezed.dart';
part 'util_item.g.dart';

@freezed
class UtilItem with _$UtilItem {
  const UtilItem._();
  const factory UtilItem(
      {required Utilities utility, required bool isChecked}) = _UtilItem;

  factory UtilItem.fromJson(Map<String, dynamic> json) =>
      _$UtilItemFromJson(json);
}
