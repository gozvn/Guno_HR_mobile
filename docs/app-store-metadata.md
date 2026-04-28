# App Store Metadata — GU HR Mobile

Metadata for iOS App Store Connect and Android Google Play Console. Fill in all fields before submission to each platform.

**Status:** iOS TestFlight-ready; Android Play Console beta-ready (deferred to Phase R3)

## Basic Info

| Field | Value |
|-------|-------|
| **App Name** | GU HR |
| **Subtitle** | Chấm công & đơn từ |
| **Primary Category** | Business |
| **Secondary Category** | Productivity |
| **Age Rating** | 4+ |
| **Primary Language** | Vietnamese (vi) |

## Description (Vietnamese — max 4000 chars)

```
GU HR là ứng dụng quản lý nhân sự dành cho nhân viên và quản lý trong hệ thống GU Online.

DÀNH CHO NHÂN VIÊN:
• Chấm công check-in/check-out với xác minh GPS và ảnh selfie
• Xem lịch sử chấm công theo tháng
• Gửi đơn nghỉ phép, làm thêm giờ, WFH và các đơn nhân sự khác
• Theo dõi trạng thái đơn theo thời gian thực
• Xem số ngày phép còn lại
• Chấm công ngoại tuyến — tự động đồng bộ khi có mạng trở lại

DÀNH CHO QUẢN LÝ:
• Duyệt/từ chối đơn nhân sự của nhân viên
• Xem dashboard tổng quan nhân sự hôm nay
• Theo dõi ca làm việc trực tiếp (Live Shifts)
• Quản lý thành viên trong nhóm

BẢO MẬT:
• Dữ liệu chấm công được bảo vệ bằng JWT và mã hóa truyền thông HTTPS
• Ảnh selfie lưu trữ an toàn trên server, không lưu trên thiết bị
• Đăng xuất xóa toàn bộ phiên đăng nhập

Yêu cầu tài khoản: Chỉ dành cho nhân viên thuộc hệ thống GU Online. Liên hệ HR để được cấp tài khoản.
```

## Keywords (100 chars max, comma-separated)

```
chấm công,HR,nhân sự,GU,đơn nghỉ phép,quản lý,attendance,timesheet,leave request,phê duyệt
```

## URLs

| Field | Value |
|-------|-------|
| **Support URL** | https://guop.app/support |
| **Marketing URL** | https://guop.app |
| **Privacy Policy URL** | https://guop.app/privacy |

## Screenshots

### iPhone 6.7" (1290×2796) — required, min 3

1. Login screen with GU HR branding
2. Dashboard with today's attendance status + quick actions
3. Check-in flow (GPS confirmation step)
4. Request list with status chips
5. Manager approval inbox

### iPhone 6.5" (1284×2778) — required, min 3

Same set as 6.7" (resize/re-export from Simulator).

### iPad (optional for future)

Not required for iOS-only release.

## Privacy Nutrition Labels

Declare in App Store Connect under App Privacy → Data Collection.

### Data Linked to Identity

| Data Type | Category | Purpose |
|-----------|----------|---------|
| Email Address | Contact Info | Authentication / App Functionality |
| Photos/Videos (selfie) | User Content | App Functionality (attendance verification) |
| Photos/Videos (attachments) | User Content | App Functionality (request evidence) |
| Precise Location | Location | App Functionality (GPS check-in radius) |
| User ID (employee ID) | Identifiers | App Functionality + Analytics |
| Device ID (FCM token) | Identifiers | App Functionality (push notifications) |
| Product Interaction | Usage Data | Analytics |

### Data Not Linked to Identity

None — all data collected is linked to authenticated user identity.

### Data Not Collected

- [ ] Health & Fitness
- [ ] Financial Info
- [ ] Browsing History
- [ ] Search History
- [ ] Contacts
- [ ] Diagnostics (Crashlytics error logs are not linked to identity in production)

## Review Notes

```
Demo Account:
  Employee: employee-demo@guop.app / DemoPass2024!
  Manager:  manager-demo@guop.app  / DemoPass2024!

Notes for reviewer:
- App requires backend authentication. Demo accounts above are pre-provisioned.
- GPS check-in will show "outside radius" in simulator — this is expected.
  The check-in flow can still be completed via the WFH option.
- Push notifications require physical device. Simulator screenshots provided.
- The app is designed for Vietnamese enterprise HR workflows; UI is in Vietnamese.
```

## Release Strategy

### iOS: App Store Connect
- **Timeline:** Week 11–12 (TBD)
- **Prerequisites:** Firebase real config, Apple signing, TestFlight validation
- **Submission path:** Internal TestFlight → External Beta (optional) → Production
- **Review time:** 1–3 days (Apple review)

### Android: Google Play Console (Deferred to Phase R3)
- **Timeline:** Week 12–13 (after iOS validation)
- **Prerequisites:** Firebase real config, Play Store upload key, Play Console app record
- **Submission path:** Internal Testing (3+ days) → Closed Beta → Production
- **Review time:** 24–48 hours (Google review)

**Note:** Both platforms use identical codebase (Flutter); separate app records required for iOS App Store ID + Android Package Name.

---

## Version History Template

| Version | Build | Platform | What's New (VN) |
|---------|-------|----------|-----------------|
| 1.0.0 | 1 | iOS + Android | Ra mắt phiên bản đầu tiên: chấm công, đơn từ, phê duyệt, live team, live shifts (R1 + R2 features) |
