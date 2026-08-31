# Flutter Profile Card Screen Assignment (Light Blue Theme)

A modern, clean, and elegant Light Blue Profile Card application built in Flutter demonstrating the composition of essential layout and styling widgets with custom theme colors.

---

## 🎯 Assignment Objective
Design and implement a Profile Card screen incorporating:
- **`Column`** for vertical layout arrangement.
- **`Row`** for horizontal layout structuring.
- **`Container`** for custom cards, Sky Blue gradient styling, border radii, shadows, and paddings.
- **`CircleAvatar`** for circular profile avatars and glowing light-blue gradient badges.
- **`Text`** with hierarchical typography styling (Slate 900 bold headlines, Sky Blue subtitles, high contrast).
- **`Icon`** for visual status indicators, verification badges, contact links, and interactive buttons.
- **Custom Theme Colors** featuring a clean Light Blue, Sky Blue, Pure White, and Slate light mode palette.

---

## 📂 Project Structure

```
profile_card_assignment/
├── lib/
│   ├── main.dart                   # Application entry point with Light ThemeData
│   ├── screens/
│   │   └── profile_screen.dart     # Main Profile Card Screen (Light Blue UI)
│   └── theme/
│       └── app_colors.dart         # Light Blue & Light Theme Color Palette
├── test/
│   └── widget_test.dart            # Flutter Widget Tests (Passing 100%)
├── generate_docx.py                # DOCX Assignment Report Generator script
├── Profile_Card_Assignment.docx    # Complete Word Assignment Documentation
├── pubspec.yaml                    # Flutter dependencies and assets configuration
└── README.md                       # Assignment Documentation
```

---

## 🛠️ Required Widgets Used in Detail

| Widget | Usage & Implementation in this Assignment |
| :--- | :--- |
| **`Column`** | • Stacks Sky Blue Header Banner, Avatar, User Details, Bio, Skills, Stats, and Action Buttons.<br>• Vertically aligns stat numbers over labels inside individual stat columns.<br>• Organizes contact details rows vertically. |
| **`Row`** | • Horizontally positions Name and Verified Badge icon (`Icons.verified_rounded`).<br>• Arranges Location pin with City/Country text.<br>• Evenly distributes Projects, Followers, and Rating statistics across the card width.<br>• Places Follow and Message action buttons side-by-side. |
| **`Container`** | • Outer Profile Card with `BorderRadius.circular(28)`, Sky Blue border (`#BAE6FD`), and soft drop shadow.<br>• Header Banner with curved top corners and Sky Blue gradient (`#38BDF8` to `#0284C7`).<br>• Avatar outer ring with soft sky-blue glow.<br>• Pastel skill chip badges with custom light backgrounds and borders. |
| **`CircleAvatar`** | • Encapsulates the user profile picture (`radius: 42` and `radius: 39`).<br>• Positioned overlapping the sky blue header banner with a glowing border.<br>• Houses high-contrast fallback icon (`Icons.person_rounded`) in Sky Blue. |
| **`Text`** | • Headline: User's Name with bold typography (`fontSize: 24`, `fontWeight: FontWeight.bold`, Slate 900).<br>• Designation: Professional title in Sky Blue 600.<br>• Bio: Multi-line description text with `height: 1.45`.<br>• Numerical Metrics: Emphasized stat numbers with muted labels. |
| **`Icon`** | • Verified checkmark badge (`Icons.verified_rounded`).<br>• Location marker (`Icons.location_on_rounded`).<br>• Skills icons (Flutter dash, Code, Cloud, Architecture).<br>• Interactive action icons (Follow/Check, Message, Bookmark). |

---

## 🎨 Custom Light Blue Palette (`AppColors`)

- **Primary Sky Blue:** `#0284C7` (Sky Blue 600)
- **Primary Gradient Start:** `#38BDF8` (Sky Blue 400)
- **Primary Ultra Light:** `#E0F2FE` (Sky Blue 100)
- **Surface / Card Background:** `#FFFFFF` (Pure White)
- **Screen Background Tint:** `#F0F7FF` (Ice Sky)
- **Card Border:** `#BAE6FD` (Sky Blue 200)
- **Text Primary:** `#0F172A` (Slate 900)
- **Text Secondary:** `#475569` (Slate 600)

---

## 🚀 How to Run the App

1. **Navigate to the assignment directory:**
   ```bash
   cd "profile_card_assignment"
   ```

2. **Fetch packages (if needed):**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

4. **Run tests:**
   ```bash
   flutter test
   ```

---

## 📄 Assignment Word Document (`.docx`)
The documentation file [`Profile_Card_Assignment.docx`](file:///Users/ashutoshrai/Desktop/flutter%20/profile_card_assignment/Profile_Card_Assignment.docx) is updated with:
1. Cover & Assignment Metadata (Light Theme)
2. Objectives & Concept Overview
3. Widget Breakdown & Architectural Tree
4. Light Blue Theme Color Palette & Hex Specifications
5. Full Source Code
6. Verification & Test Results
