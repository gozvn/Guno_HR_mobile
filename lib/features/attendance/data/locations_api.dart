import 'package:dio/dio.dart';

import 'dto/location_dto.dart';

/// Thin Dio wrapper for /api/hr/locations/* endpoints.
class LocationsApi {
  LocationsApi(this._dio);

  final Dio _dio;

  /// GET /api/hr/locations — list of all office locations.
  Future<List<LocationDto>> fetchAll() async {
    final resp = await _dio.get<List<dynamic>>('/api/hr/locations');
    return (resp.data ?? [])
        .map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/hr/locations/near?gps_lat=&gps_lng= — nearest office + distance.
  Future<NearestLocationDto> fetchNearest(double lat, double lng) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/api/hr/locations/near',
      queryParameters: {'gps_lat': lat, 'gps_lng': lng},
    );
    return NearestLocationDto.fromJson(resp.data!);
  }
}
