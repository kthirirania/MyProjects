import 'package:flutter/material.dart';
import 'package:my_projects/Widgets/BottomNavigationWidget.dart';
import 'package:my_projects/Widgets/HomeScreenTabsBody.dart';
import 'package:my_projects/Widgets/TabsWidget.dart';
import 'package:my_projects/screens/FavoritesScreen.dart';
import 'package:my_projects/screens/HomeScreen.dart';
import 'package:my_projects/screens/ProfileScreen.dart';
import 'package:my_projects/screens/SettingsScreen.dart';
import 'package:my_projects/screens/TestScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Raleway'),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => BottomNavigationWidget(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/TabsWidget': (context) => TabsWidget(),
        '/HomeScreensTabsBody': (context) => HomeScreensTabsBody(),
        '/TestScreen': (context) => TestScreen(),
      },
    );
  }
}