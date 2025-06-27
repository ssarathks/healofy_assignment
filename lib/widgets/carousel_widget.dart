import 'package:flutter/material.dart';
import '../models/media_item.dart';

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
        color: widget.arrowBackgroundColor.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          icon: Icon(icon, color: widget.arrowIconColor, size: 18),
          onPressed: onPressed,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

class NutritionImplicationsMediaCarousel extends StatelessWidget {
  const NutritionImplicationsMediaCarousel({super.key});

  static final List<MediaItem> _implicationMediaItems = [
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/7.jpg",
      height: 649,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/8.jpg",
      height: 649,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/9.jpg",
      height: 649,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/10.jpg",
      height: 649,
      width: 540,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: CarouselWidget(
        height: 400,
        showArrows: true,
        children: _implicationMediaItems.map((mediaItem) {
          return Container(
            width: 350,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                mediaItem.url,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: Icon(Icons.image, size: 50, color: Colors.white54),
                    ),
                  );
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
