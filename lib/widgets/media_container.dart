import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/media_item.dart';

class MediaContainer extends StatefulWidget {
  final MediaItem mediaItem;
  final double height;
  final double borderRadius;

  const MediaContainer({
    super.key,
    required this.mediaItem,
    this.height = 300,
    this.borderRadius = 12,
  });

  @override
  State<MediaContainer> createState() => _MediaContainerState();
}

class _MediaContainerState extends State<MediaContainer> {
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.mediaItem.url))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _isVideoInitialized = true;
          });
          _videoController?.play();
        }
      });
  }

  @override
  void didUpdateWidget(MediaContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (oldWidget.mediaItem.url != widget.mediaItem.url) {
      _disposeVideoController();
      _initializeVideo();
    }
  }

  void _disposeVideoController() {
    _videoController?.dispose();
    _videoController = null;
    _isVideoInitialized = false;
  }

  @override
  void dispose() {
    _disposeVideoController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: _videoController != null && _isVideoInitialized
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _videoController!.value.size.width,
                    height: _videoController!.value.size.height,
                    child: VideoPlayer(_videoController!),
                  ),
                ),
              )
            : Container(
                color: Colors.black,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}