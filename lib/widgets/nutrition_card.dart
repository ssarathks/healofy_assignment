import 'package:flutter/material.dart';
import '../models/media_item.dart';
import 'media_container.dart';

class MediaCarousel extends StatelessWidget {
  final List<MediaItem> mediaItems;
  final double height;
  final double itemWidth;
  final EdgeInsetsGeometry padding;

  const MediaCarousel({
    super.key,
    required this.mediaItems,
    this.height = 320,
    this.itemWidth = 280,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: mediaItems.length,
        itemBuilder: (context, index) {
          final mediaItem = mediaItems[index];
          return Container(
            width: itemWidth,
            margin: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: mediaItem.isVideo
                  ? MediaContainer(
                      mediaItem: mediaItem,
                      height: height,
                      borderRadius: 16,
                    )
                  : Image.network(
                      mediaItem.url,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade300,
                          child: const Center(
                            child: Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.white54,
                            ),
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

class PostpartumNutritionMediaCards extends StatelessWidget {
  const PostpartumNutritionMediaCards({super.key});

  static final List<MediaItem> _defaultMediaItems = [
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/3.jpg",
      height: 649,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/4.jpg",
      height: 649,
      width: 540,
    ),
    const MediaItem(
      mediaType: "VIDEO",
      url:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/82.mp4",
      thumbnailUrl:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/82.jpg",
      height: 649,
      width: 540,
    ),
    const MediaItem(
      mediaType: "VIDEO",
      url:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/83.mp4",
      thumbnailUrl:
          "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/83.jpg",
      height: 649,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/5.jpg",
      height: 649,
      width: 540,
    ),
    const MediaItem(
      mediaType: "IMAGE",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PRB-CP-12-June/6.jpg",
      height: 649,
      width: 540,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MediaCarousel(mediaItems: _defaultMediaItems);
  }
}
