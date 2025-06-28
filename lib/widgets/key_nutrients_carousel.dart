import 'package:flutter/material.dart';
import '../models/media_item.dart';
import 'media_container.dart';
import 'carousel_widget.dart';

class KeyNutrientsCarousel extends StatelessWidget {
  const KeyNutrientsCarousel({super.key});

  static final List<MediaItem> _nutrientMediaItems = [
    const MediaItem(
      mediaType: "VIDEO",
      url:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/81.mp4",
      thumbnailUrl:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/81.jpg",
      height: 694,
      width: 540,
    ),
    const MediaItem(
      mediaType: "VIDEO",
      url:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/82.mp4",
      thumbnailUrl:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/82.jpg",
      height: 694,
      width: 540,
    ),
    const MediaItem(
      mediaType: "VIDEO",
      url:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/83.mp4",
      thumbnailUrl:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/83.jpg",
      height: 694,
      width: 540,
    ),
    const MediaItem(
      mediaType: "VIDEO",
      url:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/84.mp4",
      thumbnailUrl:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/84.jpg",
      height: 694,
      width: 540,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselWidget(
      height: 400,
      children: _nutrientMediaItems.map((mediaItem) {
        return SizedBox(
          width: 350,
          child: MediaContainer(
            mediaItem: mediaItem,
            height: 400,
            borderRadius: 16,
          ),
        );
      }).toList(),
    );
  }
}
