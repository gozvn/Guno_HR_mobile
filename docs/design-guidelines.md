# Design Guidelines — GU HR Mobile

**Last Updated:** 2026-04-24  
**Design System:** Material 3 (from `guhrapp/theme/stitch_modern_hr_hub/DESIGN.md`)  
**Platform:** iOS 14+ (Flutter)  
**Language:** Vietnamese (primary), English (fallback)

---

## Color System

### Material 3 Palette

**Primary (Teal)**
- Primary: `#0F4C5C` (dark teal, brand dominant)
- On Primary: `#FFFFFF` (white text on primary)
- Primary Container: `#A3E4F3` (light teal background)
- On Primary Container: `#001F25` (dark text on light teal)

**Secondary (Sage)**
- Secondary: `#669087` (muted green)
- On Secondary: `#FFFFFF` (white text)
- Secondary Container: `#EAF8F4` (very light green background)
- On Secondary Container: `#1F352E` (dark text)

**Tertiary (Emerald)**
- Tertiary: `#6A8532` (organic green)
- On Tertiary: `#FFFFFF` (white text)
- Tertiary Container: `#EBF1B8` (pale green background)
- On Tertiary Container: `#1F3600` (dark text)

**Neutral (Grays)**
- Surface: `#FFFBFE` (near white)
- On Surface: `#1C1B1F` (almost black text)
- Surface Variant: `#F3EEF5` (light gray background)
- On Surface Variant: `#49454E` (medium gray text)
- Outline: `#9E9EA0` (border/divider)
- Outline Variant: `#C4C7C5` (lighter border)
- Scrim: `#000000` (modal overlay, 32% opacity)

**Error**
- Error: `#B3261E` (red, inherited from Material Design)
- On Error: `#FFFFFF` (white text)
- Error Container: `#F9DEDC` (light red background)
- On Error Container: `#410E0B` (dark text)

### Usage in Flutter

**File:** `lib/app/theme/colors.dart`

```dart
class GuHrColors extends ThemeExtension<GuHrColors> {
  GuHrColors({
    required this.primaryTeal,
    required this.sageBg,
    required this.emeraldSuccess,
    required this.neutralText,
    // ...
  });

  final Color primaryTeal;
  final Color sageBg;
  final Color emeraldSuccess;
  final Color neutralText;
  // ...

  static const light = GuHrColors(
    primaryTeal: Color(0xFF0F4C5C),
    sageBg: Color(0xFF669087),
    emeraldSuccess: Color(0xFF6A8532),
    neutralText: Color(0xFF1C1B1F),
    // ...
  );

  // Never implement dark mode without design review
  static const dark = light;  // Force light mode only

  @override
  GuHrColors copyWith({...});

  @override
  GuHrColors lerp(GuHrColors? other, double t) {...}
}

// Usage in widgets:
Container(
  color: Theme.of(context).extension<GuHrColors>()?.primaryTeal,
  child: Text('Đăng nhập'),
)
```

### Accessibility
- **Contrast ratios:** All text ≥4.5:1 (WCAG AA)
- **Color alone:** Never use color alone to convey meaning (add icons/text)
- **Don't use red/green pairs** if possible (color-blind friendly)

---

## Typography

### Font: Inter

**Source:** Google Fonts (`google_fonts: ^6.2.1`)

```dart
// lib/app/theme/typography.dart
final googleFontsConfig = GoogleFontsTextTheme(
  textTheme: const TextTheme(),
).apply(
  fontFamily: GoogleFonts.inter().fontFamily,  // 'Inter'
);
```

### Scale

| Style | Size | Weight | Line Height | Use Case |
|-------|------|--------|-------------|----------|
| **Display Large** | 57px | 400 (regular) | 64px | Page headers |
| **Display Medium** | 45px | 400 (regular) | 52px | Section titles |
| **Headline Large** | 32px | 400 (regular) | 40px | Card titles |
| **Headline Medium** | 28px | 500 (medium) | 36px | Dialog titles |
| **Headline Small** | 24px | 500 (medium) | 32px | Feature section headers |
| **Title Large** | 22px | 500 (medium) | 28px | Primary button text |
| **Title Medium** | 16px | 500 (medium) | 24px | Secondary headers |
| **Title Small** | 14px | 500 (medium) | 20px | Card subtitles |
| **Body Large** | 16px | 400 (regular) | 24px | Paragraphs, long content |
| **Body Medium** | 14px | 400 (regular) | 20px | Body text, form inputs |
| **Body Small** | 12px | 400 (regular) | 16px | Helper text, captions |
| **Label Large** | 14px | 500 (medium) | 20px | Button labels (caps) |
| **Label Medium** | 12px | 500 (medium) | 16px | Badges, small labels |
| **Label Small** | 11px | 500 (medium) | 16px | Tiny labels (caps) |

### Vietnamese Copy Guidelines
- **Always viết hoa các từ đặc biệt:** Nghỉ phép, Công tác, Check-in, WFH
- **Use consistent terminology:**
  - Check-in (not "kiểm tra", "xác nhận")
  - Check-out (not "kết thúc", "rời đi")
  - Phê duyệt (approve, not "đồng ý", "chấp nhận")
  - Từ chối (reject, not "từ chối", "không đồng ý")
  - Lưu nháp (draft, not "bản sao", "tạm thời")
- **Pronoun:** Use "Bạn" (you) in first-person scenarios
- **Tone:** Professional but friendly; avoid formal "Quý khách"

### Typography Example

```dart
class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(GuHrSpacing.containerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hồ sơ cá nhân',
            style: Theme.of(context).textTheme.headlineSmall,  // 24px, 500 weight
          ),
          const SizedBox(height: GuHrSpacing.base),
          Text(
            user.email,
            style: Theme.of(context).textTheme.bodyLarge,  // 16px, 400 weight
          ),
          const SizedBox(height: GuHrSpacing.double),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Cập nhật',
              style: Theme.of(context).textTheme.labelLarge,  // 14px, 500 weight
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## Spacing & Layout

### Base Unit
**8px** (all spacing multiples of 8)

### Spacing Constants

**File:** `lib/app/theme/tokens.dart`

```dart
abstract final class GuHrSpacing {
  static const base = 8.0;           // 8px
  static const double = 16.0;        // 16px
  static const triple = 24.0;        // 24px
  static const quad = 32.0;          // 32px
  static const large = 48.0;         // 48px
  
  // Semantic names
  static const containerPadding = 24.0;  // Card/container inner padding
  static const gutter = 24.0;            // Grid item spacing
  static const sectionGap = 32.0;        // Gap between major sections
}
```

### Layout Grid
- **Phone width:** 360–428px (iPhone SE → iPhone 15 Pro)
- **Safe area:** 16px margins on left/right (iPhone notch/Dynamic Island safe)
- **Grid columns:** 2 (for manager roster), 1 (for employee dashboard)
- **Card max width:** 320px (portrait), 400px (landscape, if enabled)

### Common Paddings

| Context | Padding |
|---------|---------|
| Screen top/sides | 16px (safe area) + 8px = 24px |
| Card/container | 24px |
| Button height | 48px (Material spec) |
| Text field height | 56px (Material spec) |
| Dialog padding | 24px |
| List item vertical | 12px |
| List item horizontal | 16px |

### Example Layout

```dart
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: GuHrSpacing.containerPadding,
          vertical: GuHrSpacing.double,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tổng quan', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: GuHrSpacing.sectionGap),
            
            // Cards in grid
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: GuHrSpacing.gutter,
              crossAxisSpacing: GuHrSpacing.gutter,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _Card(title: 'Check-in hôm nay'),
                _Card(title: 'Đơn đang chờ'),
              ],
            ),
            
            const SizedBox(height: GuHrSpacing.sectionGap),
            
            // Another section
            Text('Hoạt động gần đây', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: GuHrSpacing.double),
            _ActivityList(),
          ],
        ),
      ),
    );
  }
}
```

---

## Border Radius

### Radii Scale

**File:** `lib/app/theme/tokens.dart`

```dart
abstract final class GuHrRadii {
  static const sm = 2.0;      // Subtle curves (buttons, tags)
  static const xs = 4.0;      // Extra small (dividers, small badges)
  static const md = 8.0;      // Medium (cards, input fields)
  static const lg = 12.0;     // Large (modals, snackbars)
  static const xl = 16.0;     // Extra large (large containers)
}
```

### Usage

```dart
Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(GuHrRadii.md),  // 8px
  ),
  child: ...,
)

ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(GuHrRadii.sm),  // 2px
    ),
  ),
  onPressed: () {},
  child: const Text('Gửi'),
)

TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GuHrRadii.md),  // 8px
    ),
  ),
)
```

---

## Elevation & Shadows

### Elevation Levels

| Level | Use Case | Shadow |
|-------|----------|--------|
| **0** | Surface (background) | None |
| **1** | Subtle lift (dividers) | `0 1px 3px rgba(0,0,0,0.12)` |
| **2** | Cards, input fields | `0 2px 6px rgba(0,0,0,0.15)` |
| **3** | Floating action buttons | `0 3px 12px rgba(0,0,0,0.18)` |
| **5** | Modals, menus, bottom sheets | `0 5px 20px rgba(0,0,0,0.25)` |

### Material 3 Elevation

Flutter's Material 3 handles elevation automatically via `elevation` and `shadowColor` parameters.

```dart
Card(
  elevation: 2,  // Standard card
  shadowColor: Theme.of(context).colorScheme.shadow,
  child: ...,
)

FloatingActionButton(
  elevation: 3,  // FAB
  onPressed: () {},
  child: const Icon(Icons.add),
)

AlertDialog(
  elevation: 5,  // Modal
  child: ...,
)
```

---

## Component Specifications

### Buttons

**Elevated Button** (primary action)
- Height: 48px
- Padding: 16px horizontal
- Background: Primary color
- Text color: On Primary (white)
- Text style: Label Large (14px, 500 weight)
- Radius: 2px
- Example: "Đăng nhập", "Gửi đơn"

**Filled Button** (secondary action)
- Height: 48px
- Padding: 16px horizontal
- Background: Secondary container
- Text color: On Secondary container
- Text style: Label Large
- Radius: 2px
- Example: "Lưu nháp", "Cập nhật"

**Outlined Button** (tertiary action)
- Height: 48px
- Padding: 16px horizontal
- Border: 1px, outline color
- Background: Transparent
- Text color: On Surface
- Text style: Label Large
- Radius: 2px
- Example: "Hủy", "Từ chối"

**Text Button** (minimal action)
- Height: auto (typically 40px min)
- Padding: 8px horizontal
- Background: Transparent
- Text color: Primary
- Text style: Label Large
- Radius: 2px
- Example: "Xem thêm", "Đóng"

### Input Fields

**Height:** 56px (including label)
- Label: 12px, above field, "Nhập email..."
- Input text: 14px, body medium
- Padding: 12px horizontal, 8px vertical
- Border: 1px solid outline-variant (unfocused), outline (focused)
- Border radius: 8px
- Cursor: Primary color
- Background: Surface variant (unfocused), surface (focused)

### Dialogs

**Minimum width:** 280px (portrait), up to 560px (landscape)
- Title: 28px, headline medium, top padding 24px
- Content: 16px, body large, padding 24px top/bottom/sides
- Actions: Bottom 16px padding, buttons 48px height
- Border radius: 12px
- Elevation: 5
- Overlay (scrim): 32% black

### Snackbars

**Position:** Bottom, above safe area
- Height: 48px (single line) / 64px (two lines)
- Padding: 12px horizontal, 12px vertical
- Text: 14px, body medium
- Background: #323232 (inverse surface)
- Text color: #FFF (on inverse surface)
- Border radius: 4px
- Duration: 4s (default), 10s (error)
- Action button: Tertiary color text

### Loading Indicators

**Spinners:**
- Use `gu_loading_indicator.dart` (branded custom spinner in primary teal)
- Size: 48px diameter (medium), 32px (small)
- Stroke width: 2px
- Color: Primary teal

**Skeleton/Shimmer:**
- Use `skeleton_shimmer.dart` (gradient animate effect)
- Height: match content (card 120px, list item 60px)
- Radius: 8px
- Shimmer duration: 1.5s

---

## Accessibility

### No HTTP Image Loads
- All images must be HTTPS or local assets
- Never load user avatars or company logos over HTTP (man-in-the-middle risk)
- Use placeholder icons (Material Icons) if image unavailable

### ATS (App Transport Security)
- **Production:** HTTP disabled (ATS enforced)
- **Development:** HTTP allowed for localhost only via Info.plist
  ```xml
  <key>NSExceptionDomains</key>
  <dict>
    <key>localhost</key>
    <dict>
      <key>NSExceptionAllowsInsecureHTTPLoads</key>
      <true/>
    </dict>
  </dict>
  ```

### Color Contrast
- **Text on background:** ≥4.5:1 ratio (WCAG AA)
- **Large text (18px+):** ≥3:1 ratio
- **Use tools:** WebAIM Contrast Checker, Figma color contrast plugin

### Touch Targets
- **Minimum size:** 44×44pt (Apple spec)
- **Recommended:** 48×48pt (Material spec)
- **Spacing:** ≥8pt between touch targets

### Semantic HTML/Widgets
- Use `Semantics` widget for accessibility announcements:
```dart
Semantics(
  button: true,
  label: 'Phê duyệt đơn',
  onTap: () => _approveRequest(),
  child: ElevatedButton(...),
)
```

### Dark Mode
- **Not planned for R1/R2:** Light mode only
- Force light theme in ThemeData:
```dart
final themeData = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0F4C5C),
    // ...
  ),
);
```

---

## Responsive Design (Future)

### Landscape Orientation
- **Not currently enabled:** Portrait-only in R1/R2
- **Future enablement:** May require layout adjustments for wider screens
- **Recommendation:** Test on iPad Air (1188×834) if enabling

### Tablet Support
- **Not planned R1/R2:** iPhone target only
- **iPad:** Consider 2-column layouts for roster/approvals if adding support
- **Use `LayoutBuilder` for responsive:**
```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return TwoColumnLayout();  // Tablet
    } else {
      return SingleColumnLayout();  // Phone
    }
  },
)
```

---

## Imagery & Icons

### Icons
- **Source:** Material Icons (Flutter native)
- **Size:** 24px (standard), 32px (headers), 16px (inline)
- **Color:** Use theme colors (not hardcoded hex)
- **Density:** Material 3 recommended (`Icon` with default density)

### Images
- **Format:** PNG (photos, avatars), SVG via flutter_svg (logos, illustrations)
- **Resolution:** 1x (mobile), optimize with TinyPNG
- **Avatars:** 48px default, 64px for detail views
- **App icon:** 1024×1024 PNG (no alpha channel)

### Illustrations
- **Source:** Not used in MVP (R1/R2); text + icons sufficient
- **Future:** Vector illustrations for empty states, onboarding

---

## Localization

### Vietnamese Strings
All user-facing strings in Vietnamese first (vi_VN locale):

**File:** `lib/l10n/app_vi.arb`
```json
{
  "appTitle": "GU HR Mobile",
  "loginTitle": "Đăng nhập",
  "loginEmail": "Nhập email",
  "loginPassword": "Nhập mật khẩu",
  "loginButton": "Đăng nhập",
  "errorInvalidEmail": "Email không hợp lệ",
  "errorPasswordTooShort": "Mật khẩu tối thiểu 8 ký tự",
  "checkinSuccess": "Đã check-in lúc {time}",
  "approvalApproved": "Đã phê duyệt lúc {time}",
  "approvalRejected": "Đã từ chối lúc {time}"
}
```

**File:** `lib/l10n/app_en.arb` (fallback)
```json
{
  "appTitle": "GU HR Mobile",
  "loginTitle": "Login",
  "loginEmail": "Enter email",
  "loginPassword": "Enter password",
  "loginButton": "Sign In",
  "errorInvalidEmail": "Invalid email",
  "errorPasswordTooShort": "Password must be at least 8 characters",
  "checkinSuccess": "Checked in at {time}",
  "approvalApproved": "Approved at {time}",
  "approvalRejected": "Rejected at {time}"
}
```

### Integration
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      children: [
        Text(l10n.loginTitle),  // "Đăng nhập"
        TextField(hint: l10n.loginEmail),  // "Nhập email"
        ElevatedButton(
          child: Text(l10n.loginButton),  // "Đăng nhập"
        ),
      ],
    );
  }
}
```

---

## Motion & Animation

### Transitions
- **Page push:** Fade + slide (default go_router)
- **Modal appear:** Fade in (AlertDialog default)
- **Button press:** Ripple effect (Material default)
- **Duration:** 300ms standard, 150ms for micro-interactions

### Loading States
- **Spinner:** Continuous rotation (1.5s per rotation)
- **Skeleton:** Gradient shimmer (1.5s pulse)
- **Fade transitions:** 200ms fade-in/out

### Performance
- **Animations:** Use `RepaintBoundary` to isolate expensive repaints
- **Test on low-end iPhone SE (1st gen) for 60fps baseline**
- **Avoid:** Expensive shadows, heavy blur effects in scroll

---

## Bottom Navigation Persistence

### Requirement
Bottom nav bar must remain visible when user navigates to secondary screens (modals, detail pages). This improves UX — users can tap tab to escape without explicitly closing modal.

### Implementation
All sub-routes (check-in, request creation, manager approvals, etc.) are nested under parent `StatefulShellBranch` in go_router:

```dart
// lib/app/router.dart
StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) {
    return TabShellScreen(navigationShell: navigationShell);
  },
  branches: [
    // Home branch
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
          routes: [
            // Nested sub-routes (nav persists)
            GoRoute(
              path: 'leave',
              builder: (context, state) => const LeavePage(),
            ),
            GoRoute(
              path: 'calendar',
              builder: (context, state) => const CompanyCalendarPage(),
            ),
          ],
        ),
      ],
    ),
    // Attendance branch
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/attendance',
          builder: (context, state) => const AttendanceTabPage(),
          routes: [
            GoRoute(
              path: 'check-in',
              builder: (context, state) => const CheckInFlowPage(),
            ),
          ],
        ),
      ],
    ),
    // ... other branches
  ],
)
```

### Navigation Paths
- `/home/leave` — Leave balances (nested under Home)
- `/attendance/check-in` — Check-in flow (nested under Attendance)
- `/requests/create` — Create request (nested under Requests)
- `/profile/edit` — Edit profile (nested under Profile)
- `/manager/approvals/:id` — Approval detail (nested under Manager)

### Touch Targets & Spacing
- **Tab button size:** 56px height + 16px padding (Material spec)
- **Safe area:** Respect Safe Area widget to avoid Dynamic Island overlap
- **Spacing:** 8px minimum between touch targets

---

## Unresolved

- **Dark mode:** Deferred to R3+
- **Landscape layout:** Not enabled in R1/R2
- **iPad support:** Not planned for initial release
- **Font size scaling:** Accessibility text scale not yet tested (assume 100%)
- **Animation accessibility:** `reduceMotion` not yet implemented
