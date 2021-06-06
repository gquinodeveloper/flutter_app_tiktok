import 'package:flutter/material.dart';
import 'package:flutter_application_tiktok/data/models/video_player_model.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({
    Key key,
    @required this.size,
    this.videoPlayerModel,
  }) : super(key: key);

  final VideoPlayerModel videoPlayerModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            videoPlayerModel.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            videoPlayerModel.caption,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              Icon(
                Icons.music_note,
                color: Colors.white,
                size: 15,
              ),
              Text(
                videoPlayerModel.songName,
                style: TextStyle(
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
