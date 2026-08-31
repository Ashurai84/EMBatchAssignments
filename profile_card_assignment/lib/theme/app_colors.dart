import 'package:flutter/material.dart';

/// Light Blue & Soft Clean Light Theme Colors for the Profile Card assignment.
class AppColors {
  // Primary Light Blue & Ocean Accents
  static const Color primary = Color(0xFF0284C7); // Sky Blue 600
  static const Color primaryDark = Color(0xFF0369A1); // Sky Blue 700
  static const Color primaryLight = Color(0xFF38BDF8); // Sky Blue 400
  static const Color primaryUltraLight = Color(0xFFE0F2FE); // Sky Blue 100
  static const Color primaryGradientStart = Color(0xFF38BDF8); // Soft Sky
  static const Color primaryGradientEnd = Color(0xFF0284C7); // Deep Sky

  // Secondary Accents
  static const Color secondary = Color(0xFF0EA5E9); // Vivid Sky
  static const Color accentIndigo = Color(0xFF6366F1); // Indigo
  static const Color accentRose = Color(0xFFF43F5E); // Soft Rose
  static const Color accentEmerald = Color(0xFF10B981); // Mint Emerald
  static const Color accentAmber = Color(0xFFF59E0B); // Amber / Star

  // Light Backgrounds & Surfaces
  static const Color background = Color(0xFFF0F7FF); // Crisp Soft Sky Tint
  static const Color surface = Color(0xFFFFFFFF); // Clean Pure White
  static const Color surfaceSubtle = Color(0xFFF8FAFC); // Subtle Off-White
  static const Color cardBorder = Color(0xFFBAE6FD); // Sky 200 border
  static const Color dividerColor = Color(0xFFE2E8F0); // Slate 200

  // Text Colors (High Contrast on Light Surfaces)
  static const Color textPrimary = Color(0xFF0F172A); // Slate 900
  static const Color textSecondary = Color(0xFF475569); // Slate 600
  static const Color textMuted = Color(0xFF94A3B8); // Slate 400

  // Gradients
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE0F2FE), // Light sky
      Color(0xFFF0F9FF), // Ice blue
      Color(0xFFEBF4FF), // Soft lavender blue
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFF8FAFC),
    ],
  );

  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF38BDF8),
      Color(0xFF0284C7),
    ],
  );

  static const LinearGradient avatarBorderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF38BDF8),
      Color(0xFF60A5FA),
      Color(0xFF818CF8),
    ],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF0284C7),
      Color(0xFF0EA5E9),
    ],
  );
}
