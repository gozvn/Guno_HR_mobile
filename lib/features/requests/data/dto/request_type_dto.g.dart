// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestTypeDtoImpl _$$RequestTypeDtoImplFromJson(Map<String, dynamic> json) =>
    _$RequestTypeDtoImpl(
      code: json['code'] as String,
      nameVi: json['name_vi'] as String? ?? '',
      nameEn: json['name_en'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      color: json['color'] as String? ?? '',
      orderIdx: (json['order_idx'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$RequestTypeDtoImplToJson(
  _$RequestTypeDtoImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'name_vi': instance.nameVi,
  'name_en': instance.nameEn,
  'icon': instance.icon,
  'color': instance.color,
  'order_idx': instance.orderIdx,
};
