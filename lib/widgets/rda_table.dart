import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class RDATable extends StatelessWidget {
  final List<RDAData> rdaData;
  final EdgeInsetsGeometry padding;

  const RDATable({
    super.key,
    required this.rdaData,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
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
          child: Table(
            children: [
              _buildHeaderRow(),
              ...rdaData.map((data) => _buildDataRow(data)),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: [
        _buildHeaderCell(
          'Nutrients',
          gradient: const LinearGradient(
            colors: [AppColors.lightGreen, AppColors.primaryGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        _buildHeaderCell(
          'RDA\nNon-Pregnant',
          backgroundColor: Colors.grey.shade100,
          textColor: Colors.black87,
        ),
        _buildHeaderCell(
          'RDA\nLactation',
          backgroundColor: Colors.grey.shade100,
          textColor: Colors.black87,
        ),
      ],
    );
  }

  TableRow _buildDataRow(RDAData data) {
    return TableRow(
      children: [
        _buildNutrientCell(data.nutrient, data.unit),
        _buildDataCell(data.nonPregnant.toString()),
        _buildDataCell(data.lactation.toString()),
      ],
    );
  }

  Widget _buildHeaderCell(
    String text, {
    LinearGradient? gradient,
    Color? backgroundColor,
    Color textColor = Colors.white,
  }) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: gradient,
        color: backgroundColor,
        border: Border.all(color: Colors.grey.shade200, width: 0.5),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildNutrientCell(String nutrient, String unit) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.lightGreen, AppColors.primaryGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.grey.shade200, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nutrient,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            if (unit.isNotEmpty)
              Text(
                unit,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white70,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCell(String value) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200, width: 0.5),
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class RDAData {
  final String nutrient;
  final String unit;
  final dynamic nonPregnant;
  final dynamic lactation;

  const RDAData({
    required this.nutrient,
    required this.unit,
    required this.nonPregnant,
    required this.lactation,
  });
}

class RDATableWidget extends StatelessWidget {
  const RDATableWidget({super.key});

  static const List<RDAData> _defaultRDAData = [
    RDAData(
      nutrient: 'Energy',
      unit: '(Kcal/D)',
      nonPregnant: 2850,
      lactation: 3450,
    ),
    RDAData(
      nutrient: 'Protein',
      unit: '(G/D)',
      nonPregnant: 55,
      lactation: 74,
    ),
    RDAData(
      nutrient: 'Vitamin A',
      unit: '(Mg/D)',
      nonPregnant: 840,
      lactation: 900,
    ),
    RDAData(
      nutrient: 'Iron',
      unit: '(Mg/D)',
      nonPregnant: 29,
      lactation: 23,
    ),
    RDAData(
      nutrient: 'Folate',
      unit: '(Mg/D)',
      nonPregnant: 220,
      lactation: 330,
    ),
    RDAData(
      nutrient: 'Iodine',
      unit: '(Mg/Day)',
      nonPregnant: 140,
      lactation: 280,
    ),
    RDAData(
      nutrient: 'Calcium',
      unit: '(Mg/D)',
      nonPregnant: 1000,
      lactation: 1200,
    ),
    RDAData(
      nutrient: 'Zinc',
      unit: '(14.1)',
      nonPregnant: 13.2,
      lactation: 14.1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return RDATable(rdaData: _defaultRDAData);
  }
}