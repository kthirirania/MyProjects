import 'package:flutter/material.dart';

class TabsWidget extends StatefulWidget {
  @override
  _TabsWidgetState createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  @override
  Widget build(BuildContext context) {
    return TabBar(tabs: [
      Tab(
        child: Text(
          "Projects",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Tab(
        child: Text(
          "Clients",
          style: TextStyle(color: Colors.black),
        ),
      ),
      Tab(
        child: Text(
          "Completed",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ]);
  }
}
