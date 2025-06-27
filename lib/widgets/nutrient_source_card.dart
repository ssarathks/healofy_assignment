import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NutrientSourceCard extends StatelessWidget {
  final String nutrientName;
  final String description;
  final String foodSources;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const NutrientSourceCard({
    super.key,
    required this.nutrientName,
    required this.description,
    required this.foodSources,
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
                    color: backgroundColor ?? AppColors.lightGreen,
                    child: const Center(
                      child: Icon(Icons.local_dining, size: 50, color: Colors.white54),
                    ),
                  );
                },
              )
            else
              Container(
                color: backgroundColor ?? AppColors.lightGreen,
                child: const Center(
                  child: Icon(Icons.local_dining, size: 50, color: Colors.white54),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.8),
                  ],
                  stops: const [0.0, 0.4, 0.7, 1.0],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nutrientName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Food Sources: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: foodSources,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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

class NutrientSourceCardList extends StatelessWidget {
  final List<NutrientSourceCardData> cards;
  final double height;
  final EdgeInsetsGeometry padding;

  const NutrientSourceCardList({
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
          return NutrientSourceCard(
            nutrientName: card.nutrientName,
            description: card.description,
            foodSources: card.foodSources,
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

class NutrientSourceCardData {
  final String nutrientName;
  final String description;
  final String foodSources;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double width;

  const NutrientSourceCardData({
    required this.nutrientName,
    required this.description,
    required this.foodSources,
    this.backgroundImageUrl,
    this.backgroundColor,
    this.onTap,
    this.width = 280,
  });
}

class CrucialNutrientsCards extends StatelessWidget {
  const CrucialNutrientsCards({super.key});

  static const List<NutrientSourceCardData> _nutrientCards = [
    NutrientSourceCardData(
      nutrientName: 'Iodine',
      description: 'Critical For Thyroid Function & Baby Brain Development',
      foodSources: 'Iodized Salt, Dairy Products, Seafood & Fortified Foods',
      backgroundColor: Color(0xFF7BA098),
    ),
    NutrientSourceCardData(
      nutrientName: 'Choline',
      description: 'Essential For Baby\'s Brain Development',
      foodSources: 'Dairy, Nuts, Cruciferous Vegetables Like Broccoli',
      backgroundColor: Color(0xFFB8A898),
    ),
    NutrientSourceCardData(
      nutrientName: 'Iron',
      description: 'Prevents Anemia & Supports Energy Levels',
      foodSources: 'Red Meat, Spinach, Lentils & Fortified Cereals',
      backgroundColor: Color(0xFFE8A598),
    ),
    NutrientSourceCardData(
      nutrientName: 'Calcium',
      description: 'Essential For Bone Health & Muscle Function',
      foodSources: 'Dairy Products, Leafy Greens & Fortified Foods',
      backgroundColor: Color(0xFF9BB8A0),
    ),
    NutrientSourceCardData(
      nutrientName: 'Vitamin D',
      description: 'Supports Bone Health & Immune Function',
      foodSources: 'Sunlight, Fatty Fish, Fortified Milk & Supplements',
      backgroundColor: Color(0xFFC4B5A0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NutrientSourceCardList(
      cards: _nutrientCards,
      height: 350,
    );
  }
}