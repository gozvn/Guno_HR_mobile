import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers.dart';
import 'data/dto/leave_balance_dto.dart';
import 'data/leave_api.dart';

part 'leave_providers.g.dart';

@riverpod
LeaveApi leaveApi(LeaveApiRef ref) => LeaveApi(ref.watch(dioProvider));

/// Leave balances for a given year. Server filters by JWT (employee sees own).
@riverpod
Future<List<LeaveBalanceDto>> leaveBalances(
        LeaveBalancesRef ref, int year) =>
    ref.watch(leaveApiProvider).balances(year: year);
