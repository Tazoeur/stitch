import 'package:flutter/material.dart';
import 'rose_pine.dart';

enum RosePineVariant { system, rosePine, rosePineMoon, rosePineDawn }

enum AccentColor { foam, love, gold, rose, pine, iris }

class RosePineThemeController extends ChangeNotifier {
  RosePineVariant _themeVariant = RosePineVariant.system;
  AccentColor _accentColor = AccentColor.foam;

  RosePineVariant get themeVariant => _themeVariant;

  void setTheme(RosePineVariant mode) {
    _themeVariant = mode;
    notifyListeners();
  }

  void setAccentColor(AccentColor color) {
    _accentColor = color;
    notifyListeners();
  }

  bool isCurrentAccent(AccentColor color) => _accentColor == color;

  ThemeMode get materialThemeMode {
    switch (_themeVariant) {
      case RosePineVariant.system:
        return ThemeMode.system;
      case RosePineVariant.rosePineDawn:
        return ThemeMode.light;
      default:
        return ThemeMode.dark;
    }
  }

  ThemeData get theme {
    final baseColors = switch (_themeVariant) {
      RosePineVariant.rosePine => rosePine,
      RosePineVariant.rosePineMoon => rosePineMoon,
      RosePineVariant.rosePineDawn => rosePineDawn,
      RosePineVariant.system => rosePine, // fallback
    };

    final accent = switch (_accentColor) {
      AccentColor.foam => baseColors.foam,
      AccentColor.love => baseColors.love,
      AccentColor.gold => baseColors.gold,
      AccentColor.rose => baseColors.rose,
      AccentColor.pine => baseColors.pine,
      AccentColor.iris => baseColors.iris,
    };

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        primary: accent,
        surface: baseColors.surface,
        secondary: baseColors.surface,
        tertiary: baseColors.overlay,
        onSurface: baseColors.text,
        onPrimary: baseColors.overlay,
        onSecondary: baseColors.text,
        onTertiary: baseColors.text,
        // onSecondary: baseColors.muted,
        // onTertiary: baseColors.subtle,
        error: baseColors.love,
        onError: baseColors.text,
        outline: baseColors.highlightHigh,
        outlineVariant: baseColors.highlightMed,
      ),
      extensions: [baseColors],
    );
  }
}
