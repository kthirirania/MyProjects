import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_projects/Widgets/HomeScreenTabsBody.dart';
import 'package:my_projects/Widgets/LoadImage.dart';
import 'package:my_projects/Widgets/TabsWidget.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  int currentIndex = 0;
  String title = "Home";
  bool showFullAppBar = true;

  HomeScreen({this.showFullAppBar});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
    ));
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                bottomLeft: new Radius.circular(20),
                bottomRight: new Radius.circular(20),
                topRight: new Radius.circular(0),
                topLeft: new Radius.circular(0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/icons/menu.svg',
                        color: Colors.black87,
                        width: 24,
                        height: 24,
                      ),
                      LoadImage("https://drive.google.com/uc?export=view&id=1bcQaCdWNUsXF2he704ZfUrofxw6KV9KH", 52, 52, 0, 12, 12, false),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Hi Rania',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black38,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Good afternoon',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          '28 December 2020',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black38,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: TabsWidget(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          HomeScreensTabsBody(),
        ],
      ),
    );
  }
}
