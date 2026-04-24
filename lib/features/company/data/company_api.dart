import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import 'dto/calendar_entry_dto.dart';
import 'dto/company_doc_dto.dart';

class CompanyApi {
  const CompanyApi(this._dio);

  final Dio _dio;

  Future<List<CalendarEntryDto>> calendar(int year, int month) async {
    final res = await _dio.get(
      '/api/hr/company-calendar',
      queryParameters: {'year': year, 'month': month},
    );
    final list = res.data as List<dynamic>;
    return list
        .map((e) => CalendarEntryDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<CompanyDocDto>> docs() async {
    final res = await _dio.get('/api/hr/company-docs');
    final list = res.data as List<dynamic>;
    return list
        .map((e) => CompanyDocDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // Downloads file to tmp dir. Caller opens via share sheet.
  // Prefix filename with timestamp to avoid collision (tmp purged on reboot).
  Future<File> download(
    int id,
    String filename,
    ProgressCallback onProgress,
  ) async {
    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/${DateTime.now().millisecondsSinceEpoch}_$filename';
    await _dio.download(
      '/api/hr/company-docs/$id/download',
      path,
      onReceiveProgress: onProgress,
    );
    return File(path);
  }
}
