import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  int currentIndex = 3;
  String title = "Fovorites";

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.title),
    );
  }
}
