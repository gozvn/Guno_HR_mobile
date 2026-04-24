# Backend Deliverables — Required Before Production

This document lists all backend API endpoints and configuration items the mobile team needs confirmed/delivered before GU HR Mobile R1 production release.

## Critical (blocks TestFlight)

### 1. Refresh Token Endpoint
- **Route:** `POST /api/hr/auth/refresh`
- **Request:** `{ "refresh_token": "..." }` or cookie-based
- **Response:** `{ "token": "new.jwt", "refresh_token": "new.refresh" }`
- **Why:** RefreshInterceptor (already in mobile) calls this on 401. Without it, sessions expire and users are force-logged-out hourly.

### 2. Server-Side Logout (Token Revocation)
- **Route:** `DELETE /api/hr/auth/logout`
- **Auth:** Bearer token
- **Why:** Invalidate JWT server-side so push notifications stop on logged-out devices.

### 3. FCM Device Registration
- **Route:** `POST /api/hr/notifications/register-device`
- **Request:** `{ "fcm_token": "...", "device_id": "...", "platform": "ios" }`
- **Route:** `DELETE /api/hr/notifications/register-device`
- **Request:** `{ "fcm_token": "..." }`
- **Why:** Mobile registers token after login; deregisters on logout to stop push delivery.

## Important (blocks full feature parity)

### 4. Timezone Documentation
- **Question:** Does `/api/hr/attendance/mobile-checkin` store timestamps in UTC or GMT+7?
- **Impact:** Mobile shows local time; if server stores UTC, display logic is correct. If server stores GMT+7, we need to strip offset before display.
- **Action:** Document in API spec or response includes `timezone` field.

### 5. Rate Limiting on Check-In
- **Route:** `POST /api/hr/attendance/mobile-checkin`
- **Required:** ≤ 10 requests/minute/user to prevent duplicate submissions
- **Client-side:** Mobile already generates UUID idempotency key in note field (`ck:<uuid>`)
- **Server-side:** Deduplicate within 60s window on note UUID prefix

### 6. GPS Radius Threshold Documentation
- **Question:** What is the check-in radius for each office location (in metres)?
- **Impact:** Mobile shows distance indicator. Server rejects if outside radius.
- **Required:** Document threshold per `location_code` or include in `GET /api/hr/locations` response as `gps_radius_m` field (already consumed by mobile).

### 7. Attachment URL Format
- **Route:** `POST /api/hr/requests`
- **Question:** Does `attachment_urls` accept an array of pre-signed S3 URLs or base64 blobs?
- **Current mobile implementation:** Passes array of URLs after upload.
- **Required:** Confirm accepted format: `["https://s3.../file.jpg"]` or `["data:image/jpeg;base64,..."]`

## Nice-to-Have (post-R1)

### 8. X-Idempotency-Key Header Support
- **Header:** `X-Idempotency-Key: <uuid>`
- **Benefit:** Cleaner idempotency than embedding UUID in note field
- **Current workaround:** UUID embedded in `note` field as `ck:<uuid>|<user-note>`

### 9. Pagination on Request List
- **Route:** `GET /api/hr/requests`
- **Current:** Returns all requests — may be slow for employees with 100+ requests
- **Required:** `?page=1&per_page=20` with `{ "data": [...], "meta": { "total": 150, "page": 1 } }`

### 10. Push Notification Payload Schema
- **Confirm:** All push payloads include `type` field matching values in `NotificationType` enum:
  - `request_status_changed`
  - `new_pending_approval`
  - `leave_balance_updated`
  - `check_in_reminder`
  - `team_checkin_alert`

## Checklist Tracking

| # | Item | Status | Owner | ETA |
|---|------|--------|-------|-----|
| 1 | Refresh token endpoint | pending | Backend | — |
| 2 | Server-side logout | pending | Backend | — |
| 3 | FCM device register/deregister | pending | Backend | — |
| 4 | Timezone documentation | pending | Backend | — |
| 5 | Rate limiting on check-in | pending | Backend | — |
| 6 | GPS radius documentation | pending | Backend | — |
| 7 | Attachment URL format confirmed | pending | Backend | — |
| 8 | X-Idempotency-Key | post-R1 | Backend | — |
| 9 | Request list pagination | post-R1 | Backend | — |
| 10 | Push payload schema confirmed | pending | Backend | — |
