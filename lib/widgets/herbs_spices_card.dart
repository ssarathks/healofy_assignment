import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class HerbsSpicesCard extends StatelessWidget {
  final String herbName;
  final String scientificName;
  final List<String> benefits;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const HerbsSpicesCard({
    super.key,
    required this.herbName,
    required this.scientificName,
    required this.benefits,
    this.backgroundImageUrl,
    this.backgroundColor,
    this.onTap,
    this.width = 280,
    this.height = 400,
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
                      child: Icon(Icons.eco, size: 50, color: Colors.white54),
                    ),
                  );
                },
              )
            else
              Container(
                color: backgroundColor ?? AppColors.lightGreen,
                child: const Center(
                  child: Icon(Icons.eco, size: 50, color: Colors.white54),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.8),
                  ],
                  stops: const [0.0, 0.3, 0.6, 1.0],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  herbName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
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
                  if (scientificName.isNotEmpty)
                    Text(
                      scientificName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  if (scientificName.isNotEmpty) const SizedBox(height: 12),
                  ...benefits.map((benefit) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      benefit,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.3,
                      ),
                    ),
                  )),
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

class HerbsSpicesCardList extends StatelessWidget {
  final List<HerbsSpicesCardData> cards;
  final double height;
  final EdgeInsetsGeometry padding;

  const HerbsSpicesCardList({
    super.key,
    required this.cards,
    this.height = 400,
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
          return HerbsSpicesCard(
            herbName: card.herbName,
            scientificName: card.scientificName,
            benefits: card.benefits,
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

class HerbsSpicesCardData {
  final String herbName;
  final String scientificName;
  final List<String> benefits;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double width;

  const HerbsSpicesCardData({
    required this.herbName,
    required this.scientificName,
    required this.benefits,
    this.backgroundImageUrl,
    this.backgroundColor,
    this.onTap,
    this.width = 280,
  });
}

class ProvenHerbsSpicesCards extends StatelessWidget {
  const ProvenHerbsSpicesCards({super.key});

  static const List<HerbsSpicesCardData> _herbsCards = [
    HerbsSpicesCardData(
      herbName: 'Fenugreek',
      scientificName: 'Trigonella Foenum-Graecum',
      benefits: [
        'Well-Known Galactagogue, Containing Compounds Like Diosgenin',
        'Stimulates Milk Production And Increase Milk Volume',
        'Alleviates Common Breastfeeding Issues Like Engorgement',
      ],
      backgroundColor: Color(0xFF8FBC8F),
    ),
    HerbsSpicesCardData(
      herbName: 'Vidari',
      scientificName: 'Pueraria Tuberosa',
      benefits: [
        'Vidarikand Is Known For Its Galactagogue Properties',
        'Kudzu, Helps In Increasing Milk Production',
        'Its Proanocyanidin Content Enhances Prolactin Levels',
      ],
      backgroundColor: Color(0xFFB0C4DE),
    ),
    HerbsSpicesCardData(
      herbName: 'Shatavari',
      scientificName: 'Asparagus Racemosus',
      benefits: [
        'Queen Of Herbs For Women\'s Health',
        'Rich In Saponins That Support Lactation',
        'Helps Balance Hormones And Boost Immunity',
      ],
      backgroundColor: Color(0xFF98D8C8),
    ),
    HerbsSpicesCardData(
      herbName: 'Moringa',
      scientificName: 'Moringa Oleifera',
      benefits: [
        'Nutrient-Dense Superfood Rich In Vitamins',
        'Natural Galactagogue Properties',
        'Supports Overall Maternal Health',
      ],
      backgroundColor: Color(0xFF90EE90),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return HerbsSpicesCardList(
      cards: _herbsCards,
      height: 420,
    );
  }
}