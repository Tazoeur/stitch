import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stitch/core/theme/app.dart';
import 'package:stitch/core/theme/rose_pine.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<RosePineThemeController>();
    final theme = Theme.of(context);
    final rose = theme.extension<RosePineColors>()!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        title: Text(
          'Appearance',
          style: TextStyle(fontSize: 30.0, color: theme.colorScheme.onTertiary),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Theme', style: theme.textTheme.titleLarge),
          const SizedBox(height: 18),
          ...RosePineVariant.values.map((mode) {
            final label = switch (mode) {
              RosePineVariant.system => 'System (auto)',
              RosePineVariant.rosePine => 'Rosé Pine',
              RosePineVariant.rosePineMoon => 'Rosé Pine Moon',
              RosePineVariant.rosePineDawn => 'Rosé Pine Dawn',
            };
            final selected = mode == themeController.themeVariant;
            return ListTile(
              title: Text(label),
              trailing: selected
                  ? Icon(Icons.check, color: theme.colorScheme.primary)
                  : null,
              selected: selected,
              selectedTileColor: theme.colorScheme.outline,
              onTap: () => themeController.setTheme(mode),
            );
          }),

          const Divider(height: 32),

          Text('Accent color', style: theme.textTheme.titleLarge),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _AccentCircle(color: rose.love, label: 'Love'),
              _AccentCircle(color: rose.gold, label: 'Gold'),
              _AccentCircle(color: rose.rose, label: 'Rose'),
              _AccentCircle(color: rose.pine, label: 'Pine'),
              _AccentCircle(color: rose.foam, label: 'Foam'),
              _AccentCircle(color: rose.iris, label: 'Iris'),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccentCircle extends StatelessWidget {
  final Color color;
  final String label;

  const _AccentCircle({required this.color, required this.label});

  AccentColor get accent {
    return switch (label) {
      'Love' => AccentColor.love,
      'Gold' => AccentColor.gold,
      'Rose' => AccentColor.rose,
      'Pine' => AccentColor.pine,
      'Foam' => AccentColor.foam,
      'Iris' => AccentColor.iris,
      _ => AccentColor.foam,
    };
  }

  @override
  Widget build(BuildContext context) {
    final themeController = context.read<RosePineThemeController>();
    return ColorCircle(
      color: color,
      label: label,
      selected: themeController.isCurrentAccent(accent),
      onTap: () {
        themeController.setAccentColor(accent);
      },
    );
  }
}

class ColorCircle extends StatelessWidget {
  final Color color;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const ColorCircle({
    super.key,
    required this.color,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: selected
                  ? Border.all(color: theme.colorScheme.outline, width: 3)
                  : null,
            ),
            child: selected
                ? Icon(Icons.check, color: theme.colorScheme.outline)
                : null,
          ),
          const SizedBox(height: 4),
          Text(label, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
