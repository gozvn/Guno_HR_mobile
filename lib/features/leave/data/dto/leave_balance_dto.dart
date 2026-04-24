import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_balance_dto.freezed.dart';
part 'leave_balance_dto.g.dart';

@freezed
class LeaveBalanceDto with _$LeaveBalanceDto {
  const factory LeaveBalanceDto({
    required String sourceCode,
    required String sourceName,
    required double total,
    required double used,
    required double remaining,
    @Default(0) double expired,
    String? syncedAt,
  }) = _LeaveBalanceDto;

  factory LeaveBalanceDto.fromJson(Map<String, dynamic> json) =>
      _$LeaveBalanceDtoFromJson(json);
}
