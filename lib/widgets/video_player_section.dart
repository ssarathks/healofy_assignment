import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class VideoPlayerSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? videoThumbnailUrl;
  final String? videoUrl;
  final VoidCallback? onPlayPressed;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;

  const VideoPlayerSection({
    super.key,
    required this.title,
    required this.subtitle,
    this.videoThumbnailUrl,
    this.videoUrl,
    this.onPlayPressed,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          _buildVideoContainer(context),
        ],
      ),
    );
  }

  Widget _buildVideoContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFE8D5C0),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            if (videoThumbnailUrl != null)
              Image.network(
                videoThumbnailUrl!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholderContent();
                },
              )
            else
              _buildPlaceholderContent(),
            _buildPlayButton(),
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
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor ?? const Color(0xFFE8D5C0),
      child: const Center(
        child: Icon(
          Icons.shopping_bag_outlined,
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPlayButton() {
    return Center(
      child: Container(
        width: 70,
        height: 70,
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
          size: 40,
          color: AppColors.primaryGreen,
        ),
      ),
    );
  }
}

class ProductVideoSection extends StatelessWidget {
  const ProductVideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return VideoPlayerSection(
      title: 'Postpartum Recovery Bites',
      subtitle: 'Works To Boost Recovery Immunity & Baby\'s Brain',
      backgroundColor: const Color(0xFFE8D5C0),
      onPlayPressed: () {
        // Handle video play action
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Video player would open here'),
            duration: Duration(seconds: 2),
          ),
        );
      },
    );
  }
}