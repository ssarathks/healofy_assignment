import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NutritionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const NutritionCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.backgroundImageUrl,
    this.backgroundColor,
    this.onTap,
    this.width = 280,
    this.height = 320,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 16),
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
                    color: backgroundColor ?? Colors.grey.shade300,
                    child: const Center(
                      child: Icon(Icons.image, size: 50, color: Colors.white54),
                    ),
                  );
                },
              )
            else
              Container(
                color: backgroundColor ?? Colors.grey.shade300,
                child: const Center(
                  child: Icon(Icons.image, size: 50, color: Colors.white54),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
                textAlign: TextAlign.left,
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

class NutritionCardList extends StatelessWidget {
  final List<NutritionCardData> cards;
  final double height;
  final EdgeInsetsGeometry padding;

  const NutritionCardList({
    super.key,
    required this.cards,
    this.height = 320,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return NutritionCard(
            title: card.title,
            subtitle: card.subtitle,
            backgroundImageUrl: card.backgroundImageUrl,
            backgroundColor: card.backgroundColor,
            onTap: card.onTap,
            width: card.width,
            height: height,
          );
        },
      ),
    );
  }
}

class NutritionCardData {
  final String title;
  final String subtitle;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double width;

  const NutritionCardData({
    required this.title,
    required this.subtitle,
    this.backgroundImageUrl,
    this.backgroundColor,
    this.onTap,
    this.width = 280,
  });
}

class PostpartumNutritionCards extends StatelessWidget {
  const PostpartumNutritionCards({super.key});

  static const List<NutritionCardData> _defaultCards = [
    NutritionCardData(
      title: 'Supporting Recovery',
      subtitle: 'Nutrients Are Needed For Tissue Repair And Wound Healing',
      backgroundColor: Color(0xFFE8D5C0),
    ),
    NutritionCardData(
      title: 'Optimizing Breastfeeding',
      subtitle: 'Breastfeeding Requires Additional Calories And Nutrients',
      backgroundColor: Color(0xFFD4C4A8),
    ),
    NutritionCardData(
      title: 'Energy Support',
      subtitle: 'Proper Nutrition Helps Maintain Energy Levels During Recovery',
      backgroundColor: Color(0xFFC4B5A0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NutritionCardList(cards: _defaultCards);
  }
}