import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './video_players/video_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                centerTitle: true,
                title: Text("Video player demo"),
                // Tab bar...
                bottom: TabBar(
                  tabs: [
                    Tab(text: "Local video player"),
                    Tab(text: "Netwrok video player"),
                  ],
                ),
              ),
            ];
          },
          // Tab bar view...
          body: TabBarView(
            children: [
              // Local video player
              Center(
                child: FlatButton.icon(
                  icon: Icon(Icons.video_collection),
                  label: Text("Pick Videos"),
                  onPressed: () async {
                    PickedFile pickedFile = await ImagePicker()
                        .getVideo(source: ImageSource.gallery);
                    // Push to video player
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => VideoPlayer(
                          videoUrl: pickedFile.path,
                          videoPlayType: VideoPlayType.Local,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Network video player
              FlatButton.icon(
                icon: Icon(Icons.video_collection),
                label: Text("Play network video"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => VideoPlayer(
                        videoUrl:
                            "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4",
                        videoPlayType: VideoPlayType.NetWork,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
