import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class DietEssentialCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  const DietEssentialCard({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
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
        child: Column(
          children: [
            _buildHeader(),
            _buildPlateSection(),
            _buildDescriptionText(),
            _buildFoodCategoryBadges(),
            _buildHerbsSupplementsTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: AppColors.lightGreen,
      ),
      child: const Text(
        'Healthy Postpartum Plate',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildPlateSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.lightGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.lightGreen, width: 2),
              ),
              child: const Center(
                child: Icon(
                  Icons.restaurant,
                  size: 60,
                  color: AppColors.lightGreen,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNutritionItem(
                  'Fruits & Vegetables',
                  'Make 1/2 Of Your Plate Fruits And Vegetables',
                  AppColors.primaryGreen,
                ),
                const SizedBox(height: 16),
                _buildNutritionItem(
                  'Grains/Starches',
                  'Make A Little More Than 1/4 Of Your Plate Whole Grains/Starches',
                  AppColors.lightGreen,
                ),
                const SizedBox(height: 16),
                _buildNutritionItem(
                  'Protein',
                  'Make A Little Less Than 1/4 Of Your Plate Lean Meat Or Other Protein Foods',
                  Colors.teal.shade600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionItem(String title, String description, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            height: 1.3,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        'A Health Postpartum Meal Plate Should Consist Of Balanced Diet Including The Following Each Day',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildFoodCategoryBadges() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFoodBadge('Whole Grains', Icons.grain),
          _buildFoodBadge('Dairy', Icons.local_drink),
          _buildFoodBadge('Fruits &\nVegetables', Icons.apple),
          _buildFoodBadge('Protein', Icons.restaurant_menu),
        ],
      ),
    );
  }

  Widget _buildFoodBadge(String label, IconData icon) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.lightGreen.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.primaryGreen,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildHerbsSupplementsTable() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Table(
        children: [
          TableRow(
            children: [
              _buildTableCell(
                'Herbs & Spices',
                'Herbs & Spices Like Garlic, Ginger, Methi Should Be Added In Moderation',
                true,
              ),
              _buildTableCell(
                'Dietary Supplements',
                'You Might Need Supplements Based On Your Individual Health. Your Doctor Is The Best Person To Guide',
                false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(String title, String description, bool isLeft) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.only(
          topLeft: isLeft ? const Radius.circular(12) : Radius.zero,
          bottomLeft: isLeft ? const Radius.circular(12) : Radius.zero,
          topRight: !isLeft ? const Radius.circular(12) : Radius.zero,
          bottomRight: !isLeft ? const Radius.circular(12) : Radius.zero,
        ),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}