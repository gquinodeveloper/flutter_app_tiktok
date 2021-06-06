import 'package:flutter/material.dart';
import 'package:flutter_application_tiktok/data/models/video_player_model.dart';
import 'package:flutter_application_tiktok/data/providers/video_player_provider.dart';

import 'widgets/video_player_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final videoPlayerProvider = VideoPlayerProvider();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: videoPlayerProvider.getVideos().length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<VideoPlayerModel> _videoPlayers = videoPlayerProvider.getVideos();
    final _size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(_videoPlayers.length, (index) {
          return VideoPlayerItem(
            videoPlayerModel: _videoPlayers[index],
            size: _size,
          );
        }),
      ),
    );
  }
}
