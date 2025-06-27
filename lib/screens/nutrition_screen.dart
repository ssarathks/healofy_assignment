import 'package:flutter/material.dart';
import 'package:healofy_assignment/widgets/certification_badge.dart';
import 'package:healofy_assignment/widgets/custom_app_bar.dart';
import 'package:healofy_assignment/widgets/custom_button.dart';
import 'package:healofy_assignment/widgets/media_container.dart';
import 'package:healofy_assignment/widgets/section_heading.dart';
import 'package:healofy_assignment/widgets/rda_table.dart';
import 'package:healofy_assignment/widgets/nutrition_card.dart';
import 'package:healofy_assignment/widgets/carousel_widget.dart';
import 'package:healofy_assignment/widgets/nutrient_source_card.dart';
import 'package:healofy_assignment/widgets/breastfeeding_info_card.dart';
import 'package:healofy_assignment/widgets/herbs_spices_card.dart';
import 'package:healofy_assignment/widgets/diet_essential_card.dart';
import 'package:healofy_assignment/widgets/product_introduction_card.dart';
import 'package:healofy_assignment/widgets/key_nutrients_carousel.dart';
import 'package:healofy_assignment/widgets/video_player_section.dart';
import 'package:healofy_assignment/widgets/results_section.dart';
import 'package:healofy_assignment/widgets/reviews_section.dart';
import '../models/media_item.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample video data from the provided JSON structure
    final sampleVideoItem = MediaItem(
      mediaType: "VIDEO",
      url:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/21.mp4",
      thumbnailUrl:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/21.jpg",
      height: 424,
      width: 720,
      background: "LIGHT",
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaContainer(mediaItem: sampleVideoItem, height: 250),
            CertificationBadgeRow(
              badges: [
                const CertificationBadgeData(
                  icon: Icons.verified_user,
                  label: 'FDA approved',
                ),
                const CertificationBadgeData(
                  icon: Icons.star,
                  label: 'FSSAI Certified',
                ),
                const CertificationBadgeData(icon: Icons.science, label: 'GMP'),
              ],
            ),
            const SectionHeading(
              title: 'Postpartum Nutrition',
              subtitle:
                  'During the postpartum period, a mother\'s body undergoes significant changes as it recovers from childbirth and adjusts to the demands of breastfeeding. Proper nutrition during this time is crucial to promote recovery, healing, breastfeeding success, reducing risk of postpartum complications & long term health outcomes',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(text: 'Shop Now', onPressed: () {}),
            ),
            const SizedBox(height: 20),
            const SectionHeading(
              title: 'Recommended Dietary Allowance',
              subtitle: 'Daily Requirement Of Nutrients That Your Body Needs',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            const RDATableWidget(),
            const SizedBox(height: 30),
            const SectionHeading(
              title: 'Postpartum Nutrition',
              subtitle: 'Why It\'s So Crucial',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            const PostpartumNutritionCards(),
            const SizedBox(height: 30),
            const SectionHeading(
              title: 'Ignoring Postpartum Nutrition',
              subtitle: 'The Implications',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            const NutritionImplicationsCarousel(),
            const SizedBox(height: 30),
            const SectionHeading(
              title: 'Crucial Nutrients & Their Sources',
              subtitle: 'Supporting Postpartum Recovery',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            const CrucialNutrientsCards(),
            const SizedBox(height: 30),
            const SectionHeading(
              title: 'Postpartum Nutrition & Breastmilk Supply',
              subtitle: 'Know The Interlink',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            const PostpartumBreastfeedingCard(),
            const SizedBox(height: 30),
            const SectionHeading(
              title: 'Proven Herbs & Spices',
              subtitle: 'For Recovery & Lactation',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            const ProvenHerbsSpicesCards(),
            const SizedBox(height: 30),
            const SectionHeading(
              title: 'Postpartum Diet Essential',
              subtitle: 'Take A Look',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            const DietEssentialCard(),
            const SizedBox(height: 30),
            const HealofyProductIntroduction(),
            const SizedBox(height: 30),
            const SectionHeading(
              title: 'Key Nutrients & Benefits',
              subtitle: 'Postpartum Recovery Bites',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            const KeyNutrientsCarousel(),
            const SizedBox(height: 30),
            const ProductVideoSection(),
            const SizedBox(height: 30),
            const AstonishingResultsSection(),
            const SizedBox(height: 30),
            const ReviewsBySimilarMothers(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
