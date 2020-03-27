import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_firebase/models/user_data.dart';
import 'package:flutter_instagram_firebase/screens/activity_screen.dart';
import 'package:flutter_instagram_firebase/screens/create_post.dart';
import 'package:flutter_instagram_firebase/screens/feed_screen.dart';
import 'package:flutter_instagram_firebase/screens/profile_screen.dart';
import 'package:flutter_instagram_firebase/screens/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final String currentUserId =Provider.of<UserData>(context,listen: false).currentUserId;
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        title: Text(
//          'Instagram',
//          style: TextStyle(
//            color: Colors.black,
//            fontFamily: 'Billabong',
//            fontSize: 35.0,
//          ),
//        ),
//      ),
      body: PageView(
        children: <Widget>[
          FeedScreen(currentUserId: currentUserId),
          SearchScreen(),
          CreatePostScreen(),
          ActivityScreen(currentUserId: currentUserId),
          ProfileScreen(currentUserId: currentUserId,
            userId :currentUserId),
        ],
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
          activeColor: Colors.black,
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          },
          currentIndex: _currentTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 32,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_camera,
                size: 32,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 32,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 32,
              ),
            ),
          ]),
    );
  }
}
