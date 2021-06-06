import 'package:flutter/material.dart';
import 'package:flutter_application_tiktok/pages/others/discover_page.dart';
import 'package:flutter_application_tiktok/pages/home/home_page.dart';
import 'package:flutter_application_tiktok/pages/others/upload_page.dart';
import 'package:flutter_application_tiktok/theme/appTheme.dart';
import 'package:flutter_application_tiktok/utils/tiktok_icons.dart';

class RootApp extends StatefulWidget {
  RootApp({Key key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  List bottomItems = [
    {"icon": TikTokIcons.home, "label": "Home", "isIcon": true},
    {"icon": TikTokIcons.search, "label": "Discover", "isIcon": true},
    {"icon": "", "label": "", "isIcon": false},
    {"icon": TikTokIcons.messages, "label": "Inbox", "isIcon": true},
    {"icon": TikTokIcons.profile, "label": "Me", "isIcon": true}
  ];

  int _pageindex = 0;
  void _tabIndex(int index) => setState(() => _pageindex = index);

  List<Widget> screems = [
    HomePage(),
    DiscoverPage(),
    UploadPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screems[_pageindex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: kappBgColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomItems.length,
            (index) {
              return bottomItems[index]['isIcon']
                  ? InkWell(
                      onTap: () {
                        _tabIndex(index);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            bottomItems[index]['icon'],
                            color: kwhite,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              bottomItems[index]['label'],
                              style: TextStyle(color: kwhite, fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () => _tabIndex(index),
                      child: _uploadCenter(),
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget _uploadCenter() {
    return Container(
      width: 50,
      height: 35,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: ksecondary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: kprimary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            right: 5,
            child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
