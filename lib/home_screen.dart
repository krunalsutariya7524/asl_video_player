import 'package:flutter/material.dart';

import './video_players/video_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(
      videoUrl:
          "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4",
      videoPlayType: VideoPlayType.NetWork,
    );
  }
}
