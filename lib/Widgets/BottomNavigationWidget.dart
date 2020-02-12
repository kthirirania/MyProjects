import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_projects/screens/FavoritesScreen.dart';
import 'package:my_projects/screens/HomeScreen.dart';
import 'package:my_projects/screens/ProfileScreen.dart';
import 'package:my_projects/screens/SettingsScreen.dart';
import 'package:my_projects/screens/TestScreen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  int currentIndex = 0;
  String title = HomeScreen().title;
  Widget containerToSow = HomeScreen();

  @override
  void initState() {

    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Color(0xffe6eef7),
              brightness: Brightness.dark,
            )
        ),*/
      backgroundColor: Color(0xffe6eef7),
      body: Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Container(
            child: containerToSow,
          ),
        ),
      ),
      bottomNavigationBar: showBottomNavigation(currentIndex),
    );
  }

  getContainer(int index) {
    setState(() {
      currentIndex = index;
      //_pageController.animateToPage(index,
      //duration: Duration(milliseconds: 300), curve: Curves.ease);
    });

    switch (index) {
      case 0:
        setState(() {
          this.containerToSow = HomeScreen();
        });
        break;
      case 1:
        setState(() {
          this.containerToSow = SettingsScreen();
        });
        break;
      case 2:
        setState(() {
          this.containerToSow = FavoritesScreen();
        });
        break;
      case 3:
        setState(() {
          this.containerToSow = ProfileScreen();
        });
        break;
    }
  }

  BottomNavyBar showBottomNavigation(int currentIndex) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      showElevation: true,
      itemCornerRadius: 25,
      curve: Curves.easeInBack,
      items: getItems(),
      onItemSelected: (index) => getContainer(index),
    );
  }

  List<BottomNavyBarItem> getItems() {
    return [
      BottomNavyBarItem(
        icon: Icon(Icons.apps),
        title: Text('Home', style: TextStyle(color: Color(0xff8799ad))),
        activeColor: Color(0xff8799ad),
        textAlign: TextAlign.center,
        inactiveColor: Color(0xffd5dde6),
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.settings),
        title: Text('Settings', style: TextStyle(color: Color(0xff8799ad))),
        activeColor: Color(0xff8799ad),
        textAlign: TextAlign.center,
        inactiveColor: Color(0xffd5dde6),
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.favorite),
        title: Text('Favorites', style: TextStyle(color: Color(0xff8799ad))),
        activeColor: Color(0xff8799ad),
        textAlign: TextAlign.center,
        inactiveColor: Color(0xffd5dde6),
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile', style: TextStyle(color: Color(0xff8799ad))),
        activeColor: Color(0xff8799ad),
        textAlign: TextAlign.center,
        inactiveColor: Color(0xffd5dde6),
      ),
    ];
  }
}
