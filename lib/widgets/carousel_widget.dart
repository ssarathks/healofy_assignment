import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CarouselWidget extends StatefulWidget {
  final List<Widget> children;
  final double height;
  final EdgeInsetsGeometry padding;
  final bool showArrows;
  final Color arrowBackgroundColor;
  final Color arrowIconColor;

  const CarouselWidget({
    super.key,
    required this.children,
    this.height = 320,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.showArrows = true,
    this.arrowBackgroundColor = Colors.black54,
    this.arrowIconColor = Colors.white,
  });

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextPage() {
    if (_currentIndex < widget.children.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          Padding(
            padding: widget.padding,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: widget.children.length,
              itemBuilder: (context, index) {
                return widget.children[index];
              },
            ),
          ),
          if (widget.showArrows) ...[
            if (_currentIndex > 0)
              Positioned(
                left: 24,
                top: widget.height / 2 - 20,
                child: _buildArrowButton(
                  icon: Icons.arrow_back_ios,
                  onPressed: _previousPage,
                ),
              ),
            if (_currentIndex < widget.children.length - 1)
              Positioned(
                right: 24,
                top: widget.height / 2 - 20,
                child: _buildArrowButton(
                  icon: Icons.arrow_forward_ios,
                  onPressed: _nextPage,
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildArrowButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: widget.arrowBackgroundColor.withValues(alpha: 0.7),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: widget.arrowIconColor,
          size: 18,
        ),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class DetailedNutritionCard extends StatelessWidget {
  final String title;
  final List<String> bulletPoints;
  final String footerText;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double width;

  const DetailedNutritionCard({
    super.key,
    required this.title,
    required this.bulletPoints,
    required this.footerText,
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
                    Colors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ...bulletPoints.map((point) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.only(top: 6, right: 12),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    footerText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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

class DetailedNutritionCardData {
  final String title;
  final List<String> bulletPoints;
  final String footerText;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const DetailedNutritionCardData({
    required this.title,
    required this.bulletPoints,
    required this.footerText,
    this.backgroundImageUrl,
    this.backgroundColor,
    this.onTap,
  });
}

class NutritionImplicationsCarousel extends StatelessWidget {
  const NutritionImplicationsCarousel({super.key});

  static const List<DetailedNutritionCardData> _implicationCards = [
    DetailedNutritionCardData(
      title: 'Risk Of Iron Deficiency Anemia',
      bulletPoints: [
        'Due To Blood Loss During Childbirth & Increased Iron Demands During Breastfeeding',
        'Can Lead To Fatigue, Weakness, And Difficulty Concentrating',
      ],
      footerText: '50% Indian Moms Are Anemic',
      backgroundColor: Color(0xFFE8A598),
    ),
    DetailedNutritionCardData(
      title: 'Calcium And Vitamin D Deficiency',
      bulletPoints: [
        'Can Lead To Decreased Bone Density',
        'Increased Risk Of Osteoporosis Later In Life',
      ],
      footerText: '80% Indian Moms Are Calcium & Vitamin D Deficient',
      backgroundColor: Color(0xFF7BA098),
    ),
    DetailedNutritionCardData(
      title: 'Low Energy Levels',
      bulletPoints: [
        'Inadequate Nutrition Can Lead To Chronic Fatigue',
        'Impacts Daily Activities And Baby Care',
      ],
      footerText: '60% Moms Experience Low Energy Post-delivery',
      backgroundColor: Color(0xFFB8A898),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselWidget(
      height: 400,
      children: _implicationCards.map((cardData) {
        return DetailedNutritionCard(
          title: cardData.title,
          bulletPoints: cardData.bulletPoints,
          footerText: cardData.footerText,
          backgroundImageUrl: cardData.backgroundImageUrl,
          backgroundColor: cardData.backgroundColor,
          onTap: cardData.onTap,
        );
      }).toList(),
    );
  }
}