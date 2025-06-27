import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CertificationBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final double size;

  const CertificationBadge({
    super.key,
    required this.icon,
    required this.label,
    this.backgroundColor = AppColors.badgeBackground,
    this.iconColor = AppColors.badgeIcon,
    this.textColor = AppColors.textSecondary,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: size * 0.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class CertificationBadgeRow extends StatelessWidget {
  final List<CertificationBadgeData> badges;
  final MainAxisAlignment alignment;

  const CertificationBadgeRow({
    super.key,
    required this.badges,
    this.alignment = MainAxisAlignment.spaceEvenly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: alignment,
        children: badges.map((badge) => CertificationBadge(
          icon: badge.icon,
          label: badge.label,
          backgroundColor: badge.backgroundColor,
          iconColor: badge.iconColor,
          textColor: badge.textColor,
          size: badge.size,
        )).toList(),
      ),
    );
  }
}

class CertificationBadgeData {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final double size;

  const CertificationBadgeData({
    required this.icon,
    required this.label,
    this.backgroundColor = AppColors.badgeBackground,
    this.iconColor = AppColors.badgeIcon,
    this.textColor = AppColors.textSecondary,
    this.size = 80,
  });
}