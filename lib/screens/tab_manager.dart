import 'package:flutter/material.dart';
import 'package:just_app/screens/profile.dart';
import 'feed.dart';
import 'home.dart';

class TabsManager extends StatefulWidget {
  const TabsManager({Key? key}) : super(key: key);

  @override
  _TabsManagerState createState() => _TabsManagerState();
}

class _TabsManagerState extends State<TabsManager> {
  int _selectedIndex = 1;

  static final List<Widget> _widgetsOp = [
    const Feed(),
    const Home(
      cart: [],
    ),
    const Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.feed,
                color: Colors.amber,
                size: 20,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Feed',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lobster'),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.amber,
                size: 40,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Home',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lobster'),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.amber,
                  size: 20,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster'),
                )),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        body: SafeArea(
          child: _widgetsOp.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
