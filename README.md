# Stitch


```
lib/
 ├─ main.dart
 ├─ app/
 │   ├─ app.dart                 # MaterialApp, theme, localization setup
 │   ├─ router.dart              # GoRouter or AutoRoute configuration
 │   ├─ theme/
 │   │   ├─ app_theme.dart       # Light/dark theme data
 │   │   └─ theme_extensions.dart
 │   └─ localization/
 │       ├─ app_localizations.dart
 │       └─ l10n/                # ARB translation files (en, fr)
 ├─ core/
 │   ├─ utils/
 │   │   ├─ file_utils.dart      # File IO, pickers, paths
 │   │   └─ pdf_utils.dart       # Merge/split helpers
 │   ├─ services/
 │   │   ├─ pdf_service.dart     # Wrapper around pdf manipulation library
 │   │   └─ logger.dart
 │   └─ models/
 │       └─ document.dart        # Model for user-selected files, etc.
 ├─ features/
 │   ├─ home/
 │   │   ├─ view/
 │   │   │   └─ home_page.dart
 │   │   ├─ widgets/
 │   │   └─ controller.dart
 │   ├─ merge_pdfs/
 │   ├─ images_to_pdf/
 │   └─ extract_pages/
 └─ widgets/
     └─ common_ui.dart
```


* internationalization : https://docs.flutter.dev/ui/internationalization

