import 'package:flutter/material.dart';
import 'package:stitch/core/theme/rose_pine.dart';

class ZoomControl extends StatelessWidget {
  final int zoom;
  final int minZoom;
  final int maxZoom;
  final int zoomStep;
  final ValueChanged<int> onZoomChanged;

  const ZoomControl({
    super.key,
    required this.zoom,
    required this.onZoomChanged,
    this.minZoom = 1,
    this.maxZoom = 5,
    this.zoomStep = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: theme.colorScheme.primaryContainer,
                    foregroundColor: theme.colorScheme.primary,
                    ),
          icon: const Icon(Icons.search),
          tooltip: 'Reset zoom',
          onPressed: () {
            onZoomChanged(2);
          },
        ),
        Slider(
          activeColor: theme.colorScheme.primary,
          inactiveColor: theme.extension<RosePineColors>()!.highlightHigh,
          value: zoom.clamp(minZoom, maxZoom).toDouble(),
          min: minZoom.toDouble(),
          max: maxZoom.toDouble(),
          divisions: maxZoom > minZoom ? (maxZoom - minZoom) : null,
          label: '$zoom',
          onChanged: (value) => onZoomChanged(value.round()),
        ),
      ],
    );
  }
}
