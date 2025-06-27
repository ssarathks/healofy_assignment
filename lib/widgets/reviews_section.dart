import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ReviewVideoCard extends StatelessWidget {
  final String? thumbnailUrl;
  final String? videoUrl;
  final String reviewLabel;
  final VoidCallback? onPlayPressed;
  final double width;
  final double height;
  final Color? backgroundColor;

  const ReviewVideoCard({
    super.key,
    this.thumbnailUrl,
    this.videoUrl,
    this.reviewLabel = '',
    this.onPlayPressed,
    this.width = 250,
    this.height = 400,
    this.backgroundColor,
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
            if (thumbnailUrl != null)
              Image.network(
                thumbnailUrl!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholderContent();
                },
              )
            else
              _buildPlaceholderContent(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.6),
                  ],
                  stops: const [0.6, 1.0],
                ),
              ),
            ),
            _buildPlayButton(),
            if (reviewLabel.isNotEmpty)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    reviewLabel,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            if (onPlayPressed != null)
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onPlayPressed,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderContent() {
    return Container(
      color: backgroundColor ?? Colors.grey.shade300,
      child: const Center(
        child: Icon(
          Icons.video_library,
          size: 60,
          color: Colors.white54,
        ),
      ),
    );
  }

  Widget _buildPlayButton() {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(
          Icons.play_arrow,
          size: 35,
          color: AppColors.primaryGreen,
        ),
      ),
    );
  }
}

class ReviewsCardList extends StatelessWidget {
  final List<ReviewVideoCardData> cards;
  final double height;
  final EdgeInsetsGeometry padding;

  const ReviewsCardList({
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
          return ReviewVideoCard(
            thumbnailUrl: card.thumbnailUrl,
            videoUrl: card.videoUrl,
            reviewLabel: card.reviewLabel,
            onPlayPressed: card.onPlayPressed,
            width: card.width,
            height: height,
            backgroundColor: card.backgroundColor,
          );
        },
      ),
    );
  }
}

class ReviewVideoCardData {
  final String? thumbnailUrl;
  final String? videoUrl;
  final String reviewLabel;
  final VoidCallback? onPlayPressed;
  final double width;
  final Color? backgroundColor;

  const ReviewVideoCardData({
    this.thumbnailUrl,
    this.videoUrl,
    this.reviewLabel = '',
    this.onPlayPressed,
    this.width = 250,
    this.backgroundColor,
  });
}

class ReviewsBySimilarMothers extends StatelessWidget {
  const ReviewsBySimilarMothers({super.key});

  static List<ReviewVideoCardData> _generateReviewCards(BuildContext context) {
    return [
      ReviewVideoCardData(
        reviewLabel: 'Healofy\'s Specialised Solution',
        backgroundColor: const Color(0xFFE8D5C0),
        onPlayPressed: () => _showVideoMessage(context, 'Specialised Solution Review'),
      ),
      ReviewVideoCardData(
        reviewLabel: 'Methi Seed Hair Oil Review',
        backgroundColor: const Color(0xFFD4E8D5),
        onPlayPressed: () => _showVideoMessage(context, 'Hair Oil Review'),
      ),
      ReviewVideoCardData(
        reviewLabel: 'Postpartum Recovery Experience',
        backgroundColor: const Color(0xFFE8D5E8),
        onPlayPressed: () => _showVideoMessage(context, 'Recovery Experience'),
      ),
      ReviewVideoCardData(
        reviewLabel: 'Nutrition Benefits Review',
        backgroundColor: const Color(0xFFD5E8E8),
        onPlayPressed: () => _showVideoMessage(context, 'Nutrition Review'),
      ),
    ];
  }

  static void _showVideoMessage(BuildContext context, String videoTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Playing: $videoTitle'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Reviews By Similar Mothers',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ReviewsCardList(
          cards: _generateReviewCards(context),
          height: 420,
        ),
      ],
    );
  }
}