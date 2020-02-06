import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_projects/Widgets/ProjectsTab.dart';

import 'TabsWidget.dart';

class HomeScreensTabsBody extends StatefulWidget {

  @override
  _HomeScreensTabsBodyState createState() => _HomeScreensTabsBodyState();
}

class _HomeScreensTabsBodyState extends State<HomeScreensTabsBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xffe6eef7),
        child: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 1, right: 16, left: 16),
              child: ProjectsTab(),
            ),
            new Container(
              height: 10,
              //color: Colors.white,
              child: Center(
                child: Text(
                  'Clients',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            new Container(
              height: 10,
              //color: Colors.white,
              child: Center(
                child: Text(
                  'Completed',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
