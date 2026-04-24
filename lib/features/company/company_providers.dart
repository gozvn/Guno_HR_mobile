import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers.dart';
import 'data/company_api.dart';
import 'data/dto/calendar_entry_dto.dart';
import 'data/dto/company_doc_dto.dart';
import 'domain/company_doc_tree.dart';

part 'company_providers.g.dart';

@riverpod
CompanyApi companyApi(CompanyApiRef ref) =>
    CompanyApi(ref.watch(dioProvider));

@riverpod
Future<List<CalendarEntryDto>> companyCalendar(
  CompanyCalendarRef ref,
  int year,
  int month,
) async {
  final api = ref.watch(companyApiProvider);
  return api.calendar(year, month);
}

@riverpod
Future<List<CompanyDocDto>> companyDocs(CompanyDocsRef ref) async {
  final api = ref.watch(companyApiProvider);
  return api.docs();
}

// Derived provider — builds tree from flat list, no extra network call.
@riverpod
Future<List<DocNode>> companyDocTree(CompanyDocTreeRef ref) async {
  final flat = await ref.watch(companyDocsProvider.future);
  return CompanyDocTree.build(flat);
}
