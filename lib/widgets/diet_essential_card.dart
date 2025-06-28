import 'package:flutter/material.dart';
import '../models/media_item.dart';

class DietEssentialCard extends StatelessWidget {
  const DietEssentialCard({super.key});

  static const MediaItem _dietMediaItem = MediaItem(
    mediaType: "IMAGE",
    url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/22.jpg",
    height: 600,
    width: 540,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          _dietMediaItem.url,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain,
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
  }
}
