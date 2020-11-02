part of asl_video_player;

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  final VideoPlayType videoPlayType;
  final Function onVideoEnd;
  final bool autoPlay;
  VideoPlayer(
      {@required this.videoUrl,
      @required this.videoPlayType,
      this.onVideoEnd,
      this.autoPlay = true});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  FlickManager _flickManager;

  @override
  void initState() {
    super.initState();
    VideoPlayerController _videoPlayerController;
    // Video player type...
    switch (widget.videoPlayType) {
      case VideoPlayType.Local:
        _videoPlayerController =
            VideoPlayerController.file(File(widget.videoUrl));
        break;
      case VideoPlayType.NetWork:
        _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
        break;
      case VideoPlayType.Asset:
        _videoPlayerController = VideoPlayerController.asset(widget.videoUrl);
        break;
    }
    _flickManager = FlickManager(
        videoPlayerController: _videoPlayerController,
        onVideoEnd: widget.onVideoEnd,
        autoPlay: widget.autoPlay);
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Flick video player...
    return FlickVideoPlayer(flickManager: _flickManager);
  }
}

// Video player type...
enum VideoPlayType { Local, NetWork, Asset }
