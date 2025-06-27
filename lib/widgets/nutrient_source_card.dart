import 'package:flutter/material.dart';
import '../models/media_item.dart';

class CrucialNutrientsCards extends StatelessWidget {
  const CrucialNutrientsCards({super.key});

  static final List<MediaItem> _nutrientMediaItems = [
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/11.jpg",
      height: 473,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/12.jpg",
      height: 473,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/13.jpg",
      height: 473,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/14.jpg",
      height: 473,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/15.jpg",
      height: 473,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/16.jpg",
      height: 473,
      width: 540,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 233,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _nutrientMediaItems.length,
        itemBuilder: (context, index) {
          final mediaItem = _nutrientMediaItems[index];
          return Container(
            width: 300,
            margin: const EdgeInsets.only(right: 16),
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
        },
      ),
    );
  }
}
