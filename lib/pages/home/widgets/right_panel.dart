import 'package:flutter/material.dart';
import 'package:flutter_application_tiktok/data/models/video_player_model.dart';
import 'package:flutter_application_tiktok/theme/appTheme.dart';
import 'package:flutter_application_tiktok/utils/tiktok_icons.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({
    Key key,
    @required this.size,
    this.videoPlayerModel,
  }) : super(key: key);

  final VideoPlayerModel videoPlayerModel;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: size.height * 0.42,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            getProfile(videoPlayerModel.profileImg),
            getIcons(TikTokIcons.heart, videoPlayerModel.likes, 35.0),
            getIcons(TikTokIcons.chat_bubble, videoPlayerModel.comments, 35.0),
            getIcons(TikTokIcons.reply, videoPlayerModel.shares, 20.0),
            getAlbum(videoPlayerModel.albumImg),
          ],
        ),
      ),
    );
  }

  Widget getProfile(String path) {
    return Container(
      width: 50,
      height: 60,
      child: Stack(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(path),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 3,
            left: 18,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kprimary,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getIcons(IconData icon, String count, double size) {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(icon, color: Colors.white, size: size),
          SizedBox(
            height: 5,
          ),
          Text(
            count,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }

  Widget getAlbum(String path) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(shape: BoxShape.circle, color: kblack),
      child: CircleAvatar(
        radius: 15.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(path),
      ),
    );
  }
}
