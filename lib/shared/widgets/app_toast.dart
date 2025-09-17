import 'package:flutter/material.dart';

class AppToast {
  static void show(
    BuildContext context,
    String message, {
    Color backgroundColor = const Color(0xFF222222),
    Color textColor = Colors.white,
    double fontSize = 16,
    double borderRadius = 8,
    Duration duration = const Duration(seconds: 2),
    double maxWidthRatio = 0.8, // 最大宽度为屏幕的80%
    TextAlign textAlign = TextAlign.center,
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (_) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * maxWidthRatio,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: backgroundColor.withAlpha((0.85 * 255).toInt()),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
              textAlign: textAlign,
            ),
          ),
        ),
      ),
    );
    overlay.insert(overlayEntry);
    Future.delayed(duration, () => overlayEntry.remove());
  }
}
