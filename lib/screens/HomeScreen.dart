import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_projects/Widgets/HomeScreenTabsBody.dart';
import 'package:my_projects/Widgets/TabsWidget.dart';

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
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: new AssetImage(
                                      'assets/avatars/054-woman-13.png'),
                                  fit: BoxFit.contain,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
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
/*
    else return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/menu.svg',
                    color: Colors.black87,
                    width: 24,
                    height: 24,
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            new AssetImage('assets/avatars/054-woman-13.png'),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
   */
  }
}
