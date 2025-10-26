import 'package:flutter/material.dart';

@immutable
class RosePineColors extends ThemeExtension<RosePineColors> {
  final Color base;
  final Color surface;
  final Color overlay;
  final Color muted;
  final Color subtle;
  final Color text;
  final Color love;
  final Color gold;
  final Color rose;
  final Color pine;
  final Color foam;
  final Color iris;
  final Color highlightLow;
  final Color highlightMed;
  final Color highlightHigh;

  const RosePineColors({
    required this.base,
    required this.surface,
    required this.overlay,
    required this.muted,
    required this.subtle,
    required this.text,
    required this.love,
    required this.gold,
    required this.rose,
    required this.pine,
    required this.foam,
    required this.iris,
    required this.highlightLow,
    required this.highlightMed,
    required this.highlightHigh,
  });

  @override
  RosePineColors copyWith({
    Color? base,
    Color? surface,
    Color? overlay,
    Color? muted,
    Color? subtle,
    Color? text,
    Color? love,
    Color? gold,
    Color? rose,
    Color? pine,
    Color? foam,
    Color? iris,
    Color? highlightLow,
    Color? highlightMed,
    Color? highlightHigh,
  }) {
    return RosePineColors(
      base: base ?? this.base,
      surface: surface ?? this.surface,
      overlay: overlay ?? this.overlay,
      muted: muted ?? this.muted,
      subtle: subtle ?? this.subtle,
      text: text ?? this.text,
      love: love ?? this.love,
      gold: gold ?? this.gold,
      rose: rose ?? this.rose,
      pine: pine ?? this.pine,
      foam: foam ?? this.foam,
      iris: iris ?? this.iris,
      highlightLow: highlightLow ?? this.highlightLow,
      highlightMed: highlightMed ?? this.highlightMed,
      highlightHigh: highlightHigh ?? this.highlightHigh,
    );
  }

  @override
  RosePineColors lerp(ThemeExtension<RosePineColors>? other, double t) {
    if (other is! RosePineColors) return this;
    return RosePineColors(
      base: Color.lerp(base, other.base, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      overlay: Color.lerp(overlay, other.overlay, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      subtle: Color.lerp(subtle, other.subtle, t)!,
      text: Color.lerp(text, other.text, t)!,
      love: Color.lerp(love, other.love, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      rose: Color.lerp(rose, other.rose, t)!,
      pine: Color.lerp(pine, other.pine, t)!,
      foam: Color.lerp(foam, other.foam, t)!,
      iris: Color.lerp(iris, other.iris, t)!,
      highlightLow: Color.lerp(highlightLow, other.highlightLow, t)!,
      highlightMed: Color.lerp(highlightMed, other.highlightMed, t)!,
      highlightHigh: Color.lerp(highlightHigh, other.highlightHigh, t)!,
    );
  }
}

const rosePine = RosePineColors(
  base: Color(0xFF191724),
  surface: Color(0xFF1f1d2e),
  overlay: Color(0xFF26233a),
  muted: Color(0xFF6e6a86),
  subtle: Color(0xFF908caa),
  text: Color(0xFFe0def4),
  love: Color(0xFFeb6f92),
  gold: Color(0xFFf6c177),
  rose: Color(0xFFebbcba),
  pine: Color(0xFF31748f),
  foam: Color(0xFF9ccfd8),
  iris: Color(0xFFc4a7e7),
  highlightLow: Color(0xFF21202e),
  highlightMed: Color(0xFF403d52),
  highlightHigh: Color(0xFF524f67),
);

const rosePineMoon = RosePineColors(
  base: Color(0xFF232136),
  surface: Color(0xFF2a273f),
  overlay: Color(0xFF393552),
  muted: Color(0xFF6e6a86),
  subtle: Color(0xFF908caa),
  text: Color(0xFFe0def4),
  love: Color(0xFFeb6f92),
  gold: Color(0xFFf6c177),
  rose: Color(0xFFea9a97),
  pine: Color(0xFF3e8fb0),
  foam: Color(0xFF9ccfd8),
  iris: Color(0xFFc4a7e7),
  highlightLow: Color(0xFF2a283e),
  highlightMed: Color(0xFF44415a),
  highlightHigh: Color(0xFF56526e),
);

const rosePineDawn = RosePineColors(
  base: Color(0xFFfaf4ed),
  surface: Color(0xFFfffaf3),
  overlay: Color(0xFFf2e9e1),
  muted: Color(0xFF9893a5),
  subtle: Color(0xFF797593),
  text: Color(0xFF575279),
  love: Color(0xFFb4637a),
  gold: Color(0xFFea9d34),
  rose: Color(0xFFd7827e),
  pine: Color(0xFF286983),
  foam: Color(0xFF56949f),
  iris: Color(0xFF907aa9),
  highlightLow: Color(0xFFf4ede8),
  highlightMed: Color(0xFFdfdad9),
  highlightHigh: Color(0xFFcecacd),
);
