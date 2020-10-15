import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  final VideoPlayType videoPlayType;
  VideoPlayer({@required this.videoUrl, @required this.videoPlayType});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  FlickManager _flickManager;
  @override
  void initState() {
    super.initState();
    _flickManager = FlickManager(
      videoPlayerController: widget.videoPlayType == VideoPlayType.NetWork
          ? VideoPlayerController.network(widget.videoUrl)
          : VideoPlayerController.asset(widget.videoUrl),
    );
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: FlickVideoPlayer(flickManager: _flickManager));
  }
}

enum VideoPlayType { Local, NetWork }
