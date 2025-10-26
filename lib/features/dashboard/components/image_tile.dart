import 'dart:io';

import 'package:flutter/material.dart';

class ImageTile extends StatefulWidget {
  final File file;
  final VoidCallback onRemove;
  final VoidCallback onPreview;
  final VoidCallback onDuplicate;

  const ImageTile({
    super.key,
    required this.file,
    required this.onRemove,
    required this.onPreview,
    required this.onDuplicate,
  });

  @override
  State<ImageTile> createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const iconSize = 23.0;
    final iconColor = theme.colorScheme.primary;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.hardEdge,
          children: [
            // Image
            Image.file(
              widget.file,
              width: 1000,
              height: 1000,
              fit: BoxFit.cover,
            ),
            // Hover banner
            AnimatedOpacity(
              opacity: _hovering ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface.withAlpha(220),
                  ),

                  // Fixes a rendering issue where the container is 1 px too high
                  transform: Matrix4.translationValues(0, 1, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: iconColor,
                          size: iconSize,
                        ),
                        tooltip: 'Remove',
                        onPressed: widget.onRemove,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.picture_as_pdf,
                          color: iconColor,
                          size: iconSize,
                        ),
                        tooltip: 'Preview PDF page',
                        onPressed: widget.onPreview,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.copy,
                          color: iconColor,
                          size: iconSize,
                        ),
                        tooltip: 'Duplicate',
                        onPressed: widget.onDuplicate,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
