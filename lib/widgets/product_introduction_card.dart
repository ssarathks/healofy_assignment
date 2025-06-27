import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'custom_button.dart';

class ProductIntroductionCard extends StatelessWidget {
  final String title;
  final String description;
  final String? productImageUrl;
  final VoidCallback? onShopNow;
  final VoidCallback? onShare;
  final EdgeInsetsGeometry padding;

  const ProductIntroductionCard({
    super.key,
    required this.title,
    required this.description,
    this.productImageUrl,
    this.onShopNow,
    this.onShare,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const SizedBox(height: 20),
          Stack(
            children: [
              if (productImageUrl != null)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 200,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        productImageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: Icon(Icons.shopping_bag, size: 60, color: Colors.grey),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              Container(
                padding: const EdgeInsets.only(right: 220),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 300),
                    Row(
                      children: [
                        CustomButton(
                          text: 'SHOP NOW',
                          onPressed: onShopNow,
                          backgroundColor: AppColors.primaryGreen,
                          textColor: Colors.white,
                          isOutlined: false,
                          width: 140,
                          height: 45,
                          borderRadius: 22,
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: AppColors.primaryGreen,
                              size: 20,
                            ),
                            onPressed: onShare,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class HealofyProductIntroduction extends StatelessWidget {
  const HealofyProductIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductIntroductionCard(
      title: 'Introducing Healofy Postpartum Recovery Bites',
      description: 'Healofy Postpartum Recovery Bites, an innovative nutrition solution is designed exclusively for moms! Packed with essential nutrients such as Protein, Iron, Calcium & DHA, these bites speed up your recovery post-childbirth. The proven herbs in it boost your milk supply while DHA enhances baby\'s brain & vision development.',
    );
  }
}