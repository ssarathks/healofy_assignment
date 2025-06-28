import 'package:flutter/material.dart';
import 'package:healofy_assignment/constants/app_colors.dart';

class DietEssentialCard extends StatelessWidget {
  const DietEssentialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
            _buildMainContent(),
            _buildDescriptionText(),
            _buildFoodCategoryIcons(),
            _buildBottomSections(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(color: AppColors.lightGreen),
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

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipOval(
              child: Image.network(
                "https://www.shutterstock.com/image-photo/healthy-salad-plate-tomatoes-chickpeas-600nw-2427459441.jpg",
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
                  'Make 1/2 Of Your Plate\nFruits And Vegetables',
                  const Color(0xFF6B9080),
                ),
                const SizedBox(height: 16),
                _buildNutritionItem(
                  'Grains/Starches',
                  'Make A Little More Than\n1/4 Of Your Plate Whole\nGrains/Starches',
                  const Color(0xFF6B9080),
                ),
                const SizedBox(height: 16),
                _buildNutritionItem(
                  'Protein',
                  'Make A Little Less Than 1/4 Of\nYour Plate Lean Meat Or Other\nProtein Foods',
                  const Color(0xFF6B9080),
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

  Widget _buildFoodCategoryIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFoodIcon('Whole Grains', Icons.grain, const Color(0xFFE6B800)),
          _buildFoodIcon('Dairy', Icons.local_drink, const Color(0xFF87CEEB)),
          _buildFoodIcon(
            'Fruits &\nVegetables',
            Icons.apple,
            const Color(0xFFFF6347),
          ),
          _buildFoodIcon(
            'Protein',
            Icons.restaurant_menu,
            const Color(0xFFDEB887),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodIcon(String label, IconData icon, Color bgColor) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSections() {
    // return Text("asdf");
    return Table(
      border: TableBorder.all(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.lightGreen,
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 101, 142, 143),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          children: [
            _buildTableHeaderCell('Herbs & Spices'),
            _buildTableHeaderCell('Dietary Supplements'),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          children: [
            _buildTableContentCell(
              'Herbs & Spices Like Garlic, Ginger, Methi Should Be Added In Moderation',
            ),
            _buildTableContentCell(
              'You Might Need Supplements Based On Your Individual Health. Your Doctor Is The Best Person To Guide',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTableHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTableContentCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.black87),
      ),
    );
  }
}
