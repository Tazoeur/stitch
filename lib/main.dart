import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stitch/core/theme/app.dart';
import 'package:stitch/features/dashboard/components/import_zone.dart';
import 'package:stitch/features/theme_swap/page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RosePineThemeController(),
      child: StitchApp(),
    ),
  );
}

class StitchApp extends StatelessWidget {
  const StitchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stitch',
      theme: context.watch<RosePineThemeController>().theme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = 'Stitch';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.color_lens_outlined),
            tooltip: 'Theme settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ThemeSettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: [
          Expanded(child: ImageImportZone()),
        ],
      ),
    );
  }
}
