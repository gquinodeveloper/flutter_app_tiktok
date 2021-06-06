import 'package:flutter/material.dart';
import 'package:flutter_application_tiktok/data/models/video_player_model.dart';
import 'package:flutter_application_tiktok/pages/home/widgets/header.dart';
import 'package:flutter_application_tiktok/pages/home/widgets/left_panel.dart';
import 'package:flutter_application_tiktok/pages/home/widgets/right_panel.dart';
import 'package:flutter_application_tiktok/theme/appTheme.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  VideoPlayerItem({Key key, this.videoPlayerModel, this.size})
      : super(key: key);
  final VideoPlayerModel videoPlayerModel;
  final Size size;
  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  VideoPlayerController _videoController;
  bool isShowPlaying = false;
  @override
  void initState() {
    super.initState();

    _videoController =
        VideoPlayerController.asset(widget.videoPlayerModel.videoUrl)
          ..initialize().then((value) {
            _videoController.play();
            setState(() => isShowPlaying = false);
          });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _videoController.value.isPlaying
              ? _videoController.pause()
              : _videoController.play();
        });
      },
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
          height: widget.size.height,
          width: widget.size.width,
          child: Stack(
            children: <Widget>[
              Container(
                height: widget.size.height,
                width: widget.size.width,
                decoration: BoxDecoration(color: kblack),
                child: Stack(
                  children: <Widget>[
                    VideoPlayer(_videoController),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: _isPlaying(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: widget.size.height,
                width: widget.size.width,
                padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Header(),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            LeftPanel(
                              size: widget.size,
                              videoPlayerModel: widget.videoPlayerModel,
                            ),
                            RightPanel(
                              size: widget.size,
                              videoPlayerModel: widget.videoPlayerModel,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _isPlaying() {
    return _videoController.value.isPlaying && !isShowPlaying
        ? Container()
        : Icon(
            Icons.play_arrow,
            size: 80,
            color: Colors.white60,
          );
  }
}
