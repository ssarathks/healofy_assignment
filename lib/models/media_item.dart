class MediaItem {
  final String mediaType;
  final String url;
  final String? thumbnailUrl;
  final int height;
  final int width;
  final String? background;

  const MediaItem({
    required this.mediaType,
    required this.url,
    this.thumbnailUrl,
    required this.height,
    required this.width,
    this.background,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      mediaType: json['mediaType'] ?? '',
      url: json['url'] ?? '',
      thumbnailUrl: json['thumbnailUrl'],
      height: json['height'] ?? 0,
      width: json['width'] ?? 0,
      background: json['background'],
    );
  }

  bool get isVideo => mediaType == 'VIDEO';
  bool get isImage => mediaType == 'IMAGE';
  bool get isLightBackground => background == 'LIGHT';
  bool get isDarkBackground => background == 'DARK';
}