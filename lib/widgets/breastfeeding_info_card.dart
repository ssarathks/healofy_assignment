import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BreastfeedingInfoCard extends StatelessWidget {
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final List<String> bulletPoints;
  final double height;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;

  const BreastfeedingInfoCard({
    super.key,
    this.backgroundImageUrl,
    this.backgroundColor,
    required this.bulletPoints,
    this.height = 400,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            if (backgroundImageUrl != null)
              Image.network(
                backgroundImageUrl!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: backgroundColor ?? Colors.pink.shade100,
                    child: const Center(
                      child: Icon(
                        Icons.child_care,
                        size: 80,
                        color: Colors.white54,
                      ),
                    ),
                  );
                },
              )
            else
              Container(
                color: backgroundColor ?? Colors.pink.shade100,
                child: const Center(
                  child: Icon(
                    Icons.child_care,
                    size: 80,
                    color: Colors.white54,
                  ),
                ),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bulletPoints
                      .map(
                        (point) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                margin: const EdgeInsets.only(
                                  top: 6,
                                  right: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGreen,
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  point,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    height: 1.4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            if (onTap != null)
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class PostpartumBreastfeedingCard extends StatelessWidget {
  const PostpartumBreastfeedingCard({super.key});

  static const List<String> _breastfeedingPoints = [
    'Adequate Nutrition Is Essential For Maintaining A Healthy Milk Supply',
    'Nutrient-Rich Foods Support The Mother\'s Energy Levels, Crucial For Successful Breastfeeding',
    'Hydration Is Also Key, Drink Approx 3 Litres Of Water Daily To Support Milk Production',
  ];

  @override
  Widget build(BuildContext context) {
    return const BreastfeedingInfoCard(
      bulletPoints: _breastfeedingPoints,
      backgroundColor: Color(0xFFE8D5E8),
      height: 450,
    );
  }
}
