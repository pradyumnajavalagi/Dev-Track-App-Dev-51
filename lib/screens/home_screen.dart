// Add this import for ClipRRect
import 'package:appdev51/screens/add_post_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appdev51/utils/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:appdev51/custom_app_bar.dart';

class HomeScreenLayout extends StatefulWidget {
  const HomeScreenLayout({super.key});

  @override
  State<HomeScreenLayout> createState() => _HomeScreenLayoutState();
}

class _HomeScreenLayoutState extends State<HomeScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: navBar(),
      body: PageView(
        children: [
          Text('feed'),
          Text('search'),
          AddPostScreen(),
          Text('notifications'),
          Text('profile'),
        ],
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey,offset: Offset(0, 2),blurRadius: 30),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          child: CupertinoTabBar(
            backgroundColor: secondaryColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 0 ? Icons.home : Icons.home_outlined,
                  color: primaryColor,
                ),
                label: '',
                backgroundColor: primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 1 ? Icons.search : Icons.search_outlined,
                  color: primaryColor,
                ),
                label: '',
                backgroundColor: primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 2 ? Icons.add_box_rounded : Icons.add,
                  color: primaryColor,
                ),
                label: '',
                backgroundColor: primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 3
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  color: primaryColor,
                ),
                label: '',
                backgroundColor: primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 4 ? Icons.person : Icons.person_outlined,
                  color: primaryColor,
                ),
                label: '',
                backgroundColor: primaryColor,
              ),
            ],
            onTap: navigationTapped,
          ),
        ),
      ),
    );
  }
}
