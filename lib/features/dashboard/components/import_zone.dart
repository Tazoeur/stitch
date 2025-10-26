import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:stitch/features/dashboard/components/image_tile.dart';
import 'package:stitch/features/dashboard/models/image_item.dart';
import 'package:stitch/widgets/zoom_control.dart';
import 'package:reorderable_grid/reorderable_grid.dart';
import 'package:file_saver/file_saver.dart';
import 'dart:typed_data'; // for Uint8List

class ImageImportZone extends StatefulWidget {
  const ImageImportZone({super.key});

  @override
  State<ImageImportZone> createState() => _ImageImportZoneState();
}

class _ImageImportZoneState extends State<ImageImportZone> {
  final List<ImageItem> _images = [];
  int columns = 2;

  void updateColumns(int newCount) {
    setState(() {
      columns = newCount.clamp(1, 5);
    });
  }

  Future<void> _addImage() async {
    const typeGroup = XTypeGroup(
      label: 'images',
      extensions: ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'],
    );

    final files = await openFiles(
      acceptedTypeGroups: [typeGroup],
      confirmButtonText: 'Import',
    );

    if (files.isNotEmpty) {
      setState(() => _images.addAll(files.map((f) => ImageItem(f))));
    }
  }

  Future<void> _createPdf() async {
    if (_images.isEmpty) return;

    final pdf = pw.Document();

    for (final img in _images) {
      final bytes = await File(img.file.path).readAsBytes();
      final image = pw.MemoryImage(bytes);
      pdf.addPage(
        pw.Page(
          build: (context) =>
              pw.Center(child: pw.Image(image, fit: pw.BoxFit.contain)),
        ),
      );
    }

    // Ask user where to save the PDF
    final savePath = await getSaveLocation(
      suggestedName: 'output.pdf',
      acceptedTypeGroups: [
        const XTypeGroup(label: 'PDF', extensions: ['pdf']),
      ],
    );

    if (savePath == null) return; // user cancelled

    final file = File(savePath.path);
    await file.writeAsBytes(await pdf.save());

    // Android version
    // final Uint8List pdfBytes = await pdf.save();
    // final MimeType mimeType = MimeType.pdf;
    // final savePath = await FileSaver.instance.saveFile(
    //   name: 'output',
    //   bytes: pdfBytes,
    //   fileExtension: 'pdf',
    //   mimeType: mimeType,
    // );

    if (!mounted) return; // guard before context use

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('PDF saved to $savePath')));
  }

  @override
  Widget build(BuildContext context) {
    const double buttonRowHeight = 50.0;
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableHeight = constraints.maxHeight - buttonRowHeight;
        return Column(
          children: [
            SizedBox(
              height: availableHeight,
              child: ReorderableGridView.count(
                onReorder: (oldIndex, newIndex) => setState(() {
                  final item = _images.removeAt(oldIndex);
                  _images.insert(newIndex, item);
                }),
                crossAxisCount: columns,
                primary: true,
                // padding: const EdgeInsets.all(20),
                children: _images.asMap().entries.map((entry) {
                  final index = entry.key;

                  final file = File(entry.value.file.path);

                  void onRemove() {
                    setState(() {
                      _images.removeAt(index);
                    });
                  }

                  void onPreview() {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(child: Image.file(file)),
                    );
                    // Implement preview functionality if needed
                  }

                  void onDuplicate() {
                    setState(() {
                      _images.insert(index + 1, ImageItem(entry.value.file));
                    });
                  }

                  return ImageTile(
                    key: ValueKey(entry.value.id),
                    file: file,
                    onRemove: onRemove,
                    onPreview: onPreview,
                    onDuplicate: onDuplicate,
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: buttonRowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ZoomControl(zoom: columns, onZoomChanged: updateColumns),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      foregroundColor: theme.colorScheme.onPrimaryContainer,
                    ),
                    onPressed: _addImage,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Image'),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      foregroundColor: theme.colorScheme.onPrimaryContainer,
                    ),
                    onPressed: _createPdf,
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text('Create PDF'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
