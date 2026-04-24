import 'package:flutter_test/flutter_test.dart';
import 'package:gu_hr_mobile/features/requests/data/dto/create_request_payload.dart';

void main() {
  group('CreateRequestPayload.toJson', () {
    test('serialises all fields correctly', () {
      const payload = CreateRequestPayload(
        type: 'leave_annual',
        startDate: '2026-05-01',
        endDate: '2026-05-03',
        reason: 'Nghỉ phép năm',
        attachmentUrls: ['/uploads/img1.jpg', '/uploads/img2.jpg'],
      );

      final json = payload.toJson();
      expect(json['type'], 'leave_annual');
      expect(json['start_date'], '2026-05-01');
      expect(json['end_date'], '2026-05-03');
      expect(json['reason'], 'Nghỉ phép năm');
      expect(json['attachment_urls'], ['/uploads/img1.jpg', '/uploads/img2.jpg']);
    });

    test('empty attachment_urls serialises as empty list', () {
      const payload = CreateRequestPayload(
        type: 'wfh',
        startDate: '2026-05-01',
        endDate: '2026-05-01',
      );
      final json = payload.toJson();
      expect(json['attachment_urls'], isEmpty);
    });

    test('null reason serialises as null', () {
      const payload = CreateRequestPayload(
        type: 'sick',
        startDate: '2026-04-10',
        endDate: '2026-04-11',
      );
      final json = payload.toJson();
      expect(json['reason'], isNull);
    });
  });

  group('AttachmentUploadResult.fromJson', () {
    test('parses url and filename', () {
      final result = AttachmentUploadResult.fromJson({
        'url': '/api/hr/uploads/request-attachments/1234-photo.jpg',
        'filename': '1234-photo.jpg',
      });
      expect(result.url, contains('photo.jpg'));
      expect(result.filename, '1234-photo.jpg');
    });
  });

  group('CreatedRequest.fromJson', () {
    test('parses id and status', () {
      final r = CreatedRequest.fromJson({
        'id': 42,
        'status': 'pending',
        'firstApproverId': 7,
      });
      expect(r.id, 42);
      expect(r.status, 'pending');
      expect(r.firstApproverId, 7);
    });

    test('null firstApproverId is allowed', () {
      final r = CreatedRequest.fromJson({
        'id': 1,
        'status': 'pending',
        'firstApproverId': null,
      });
      expect(r.firstApproverId, isNull);
    });
  });
}
