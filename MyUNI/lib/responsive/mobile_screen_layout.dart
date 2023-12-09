import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MyUni/utils/colors.dart';
import 'package:MyUni/utils/global_variable.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: Container(
    height: 100,
    decoration: BoxDecoration(
    boxShadow: [
    BoxShadow(color: Colors.grey, offset: Offset(0, 2), blurRadius: 30),
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
                _page == 3 ? Icons.favorite : Icons.favorite_outline_outlined,
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
          currentIndex: _page,
        ),
      ),
    ),);
  }
}
