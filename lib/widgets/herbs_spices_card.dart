import 'package:flutter/material.dart';
import '../models/media_item.dart';

class ProvenHerbsSpicesCards extends StatelessWidget {
  const ProvenHerbsSpicesCards({super.key});

  static final List<MediaItem> _herbsMediaItems = [
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/18.jpg",
      height: 744,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/19.jpg",
      height: 744,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/20.jpg",
      height: 744,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/21.jpg",
      height: 744,
      width: 540,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 372,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _herbsMediaItems.length,
        itemBuilder: (context, index) {
          final mediaItem = _herbsMediaItems[index];
          return Container(
            width: 270,
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