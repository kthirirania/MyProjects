import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  int currentIndex = 2;
  String title = "Settings";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.title),
    );
  }
}
