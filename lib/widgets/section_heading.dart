import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final EdgeInsetsGeometry padding;
  final TextAlign textAlign;

  const SectionHeading({
    super.key,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: textAlign == TextAlign.center
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle ?? 
                Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.textPrimary,
                ) ?? const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
            textAlign: textAlign,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 12),
            Text(
              subtitle!,
              style: subtitleStyle ?? 
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ) ?? const TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
              textAlign: textAlign,
            ),
          ],
        ],
      ),
    );
  }
}
