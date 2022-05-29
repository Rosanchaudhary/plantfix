import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Plantfix/modals/navbar_items.dart';
import 'package:Plantfix/screens/community.dart';
import 'package:Plantfix/screens/profile.dart';
import 'package:Plantfix/widgets/home_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreenBody(),
    CommunityScreen(),
    ProfileScreen()
  ];
  bool showAppBar = true;
  int _currentIndex = 0;
  List _pageStack = [];

  void _pushPage(index) {
    if (_pageStack.isEmpty) {
      _pageStack.add(_currentIndex);
    }

    if (index == _currentIndex) {
      return;
    }

    if (_pageStack.contains(index) && _pageStack.length != 1) {
      _pageStack.remove(index);
    }

    if (!_pageStack.contains(_currentIndex)) {
      _pageStack.add(_currentIndex);
    }

    setState(() {
      _currentIndex = index;
    });
  }

  _popPage(BuildContext context) {
    if (_pageStack.isEmpty) {
      return Future<bool>.value(true);
    } else {
      int t = _pageStack.removeLast();
      setState(() {
        _currentIndex = (_currentIndex != t) ? t : _pageStack.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _popPage(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: showAppBar
            ? AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "PLANTFIX",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                actions: <Widget>[
                  DropdownButton<String>(
                    icon: Icon(FontAwesomeIcons.ellipsisV),
                    elevation: 0,
                    items: <String>['Pukar', 'Baral', 'Is', 'Bored']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (_) {},
                  )
                ],
              )
            : null,
        body: _widgetOptions[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (i) {
              _pushPage(i);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: allScreens.map((Screens screen) {
              return BottomNavigationBarItem(
                  icon: Icon(screen.icon),
                  backgroundColor: screen.color,
                  label: screen.label);
            }).toList()),
      ),
    );
  }
}
