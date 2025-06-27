import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'carousel_widget.dart';

class KeyNutrientCard extends StatelessWidget {
  final String nutrientSymbol;
  final String nutrientName;
  final String benefits;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double width;

  const KeyNutrientCard({
    super.key,
    required this.nutrientSymbol,
    required this.nutrientName,
    required this.benefits,
    this.backgroundImageUrl,
    this.backgroundColor,
    this.onTap,
    this.width = 350,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 8),
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
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          backgroundColor ?? const Color(0xFF2E5266),
                          (backgroundColor ?? const Color(0xFF2E5266)).withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                    child: _buildNutrientVisualization(),
                  );
                },
              )
            else
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      backgroundColor ?? const Color(0xFF2E5266),
                      (backgroundColor ?? const Color(0xFF2E5266)).withValues(alpha: 0.8),
                    ],
                  ),
                ),
                child: _buildNutrientVisualization(),
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
                  stops: const [0.6, 1.0],
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 30,
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        nutrientSymbol,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    nutrientName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: Text(
                benefits,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
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

  Widget _buildNutrientVisualization() {
    return Stack(
      children: [
        // Background elements to simulate blood cells/nutrients
        ...List.generate(15, (index) {
          return Positioned(
            left: (index * 47.0) % 300,
            top: (index * 31.0) % 350,
            child: Container(
              width: index % 3 == 0 ? 40 : (index % 2 == 0 ? 25 : 35),
              height: index % 3 == 0 ? 15 : (index % 2 == 0 ? 25 : 15),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(
                  index % 3 == 0 ? 20 : (index % 2 == 0 ? 12.5 : 17.5),
                ),
              ),
            ),
          );
        }),
        ...List.generate(10, (index) {
          return Positioned(
            left: (index * 73.0) % 320,
            top: (index * 53.0) % 380,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.4),
                shape: BoxShape.circle,
              ),
            ),
          );
        }),
      ],
    );
  }
}

class KeyNutrientCardData {
  final String nutrientSymbol;
  final String nutrientName;
  final String benefits;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const KeyNutrientCardData({
    required this.nutrientSymbol,
    required this.nutrientName,
    required this.benefits,
    this.backgroundImageUrl,
    this.backgroundColor,
    this.onTap,
  });
}

class KeyNutrientsCarousel extends StatelessWidget {
  const KeyNutrientsCarousel({super.key});

  static const List<KeyNutrientCardData> _nutrientCards = [
    KeyNutrientCardData(
      nutrientSymbol: 'Fe',
      nutrientName: 'Iron',
      benefits: 'Vital To Restore Depleted Iron Stores, Prevent Anemia, & Support Energy Levels',
      backgroundColor: Color(0xFF2E5266),
    ),
    KeyNutrientCardData(
      nutrientSymbol: 'Ca',
      nutrientName: 'Calcium',
      benefits: 'Essential For Bone Health, Muscle Function & Maintaining Strong Teeth During Recovery',
      backgroundColor: Color(0xFF4A6741),
    ),
    KeyNutrientCardData(
      nutrientSymbol: 'DHA',
      nutrientName: 'DHA',
      benefits: 'Critical For Baby\'s Brain Development & Supporting Cognitive Function Through Breast Milk',
      backgroundColor: Color(0xFF6B4E71),
    ),
    KeyNutrientCardData(
      nutrientSymbol: 'Pr',
      nutrientName: 'Protein',
      benefits: 'Supports Tissue Repair, Wound Healing & Helps Rebuild Strength After Childbirth',
      backgroundColor: Color(0xFF8B4513),
    ),
    KeyNutrientCardData(
      nutrientSymbol: 'Vit D',
      nutrientName: 'Vitamin D',
      benefits: 'Enhances Calcium Absorption, Supports Immune Function & Bone Health',
      backgroundColor: Color(0xFF2F4F4F),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselWidget(
      height: 420,
      children: _nutrientCards.map((cardData) {
        return KeyNutrientCard(
          nutrientSymbol: cardData.nutrientSymbol,
          nutrientName: cardData.nutrientName,
          benefits: cardData.benefits,
          backgroundImageUrl: cardData.backgroundImageUrl,
          backgroundColor: cardData.backgroundColor,
          onTap: cardData.onTap,
        );
      }).toList(),
    );
  }
}