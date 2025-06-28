import 'package:flutter/material.dart';
import '../models/media_item.dart';
import 'media_container.dart';

class ProductVideoSection extends StatelessWidget {
  const ProductVideoSection({super.key});

  static const MediaItem _videoMediaItem = MediaItem(
    mediaType: "VIDEO",
    url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/71.mp4",
    thumbnailUrl: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/71.jpg",
    height: 424,
    width: 720,
    background: "LIGHT",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Postpartum Recovery Bites',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Works To Boost Recovery Immunity & Baby\'s Brain',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          MediaContainer(
            mediaItem: _videoMediaItem,
            height: 250,
            borderRadius: 16,
          ),
        ],
      ),
    );
  }
}