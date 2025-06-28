import 'package:flutter/material.dart';
import '../models/media_item.dart';
import 'media_container.dart';

class ReviewsBySimilarMothers extends StatelessWidget {
  const ReviewsBySimilarMothers({super.key});

  static final List<MediaItem> _reviewMediaItems = [
    const MediaItem(
      mediaType: "VIDEO",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/Category+Page-20231228T120159Z-001/Category+Page/Methi/Review/2mb/Methi+2.mp4",
      thumbnailUrl: "https://d2aeb2wamokgyu.cloudfront.net/thumbnail-20240105T062519Z-001/thumbnail/1.jpg",
      height: 1920,
      width: 1080,
    ),
    const MediaItem(
      mediaType: "VIDEO",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/Category+Page-20231228T120159Z-001/Category+Page/Methi/Review/2mb/Methi+3.1.mp4",
      thumbnailUrl: "https://d2aeb2wamokgyu.cloudfront.net/thumbnail-20240105T062519Z-001/thumbnail/2.jpg",
      height: 1920,
      width: 1080,
    ),
    const MediaItem(
      mediaType: "VIDEO",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/Category+Page-20231228T120159Z-001/Category+Page/Methi/Review/2mb/Methi+4.mp4",
      thumbnailUrl: "https://d2aeb2wamokgyu.cloudfront.net/thumbnail-20240105T062519Z-001/thumbnail/3.jpg",
      height: 1920,
      width: 1080,
    ),
    const MediaItem(
      mediaType: "VIDEO",
      url: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/Category+Page-20231228T120159Z-001/Category+Page/Methi/Review/2mb/Methi+1.mp4",
      thumbnailUrl: "https://d2aeb2wamokgyu.cloudfront.net/thumbnail-20240105T062519Z-001/thumbnail/4.jpg",
      height: 1920,
      width: 1080,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Reviews By Similar Mothers',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 420,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _reviewMediaItems.length,
            itemBuilder: (context, index) {
              final mediaItem = _reviewMediaItems[index];
              return Container(
                width: 250,
                margin: const EdgeInsets.only(right: 16),
                child: MediaContainer(
                  mediaItem: mediaItem,
                  height: 420,
                  borderRadius: 16,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}