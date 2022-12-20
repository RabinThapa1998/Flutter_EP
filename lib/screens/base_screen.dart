import 'package:entrance_prep/constants/color.dart';
import 'package:entrance_prep/screens/featured_screen.dart';
import 'package:entrance_prep/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:entrance_prep/constants/icons.dart';
import 'package:entrance_prep/constants/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    ProfileScreen(),
    FeaturedScreen(),
    FeaturedScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              icFeatured,
              height: 24.h,
            ),
            icon: Image.asset(
              icFeaturedOutlined,
              height: 24.h,
            ),
            label: "Featured",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              icLearning,
              height: 24.h,
            ),
            icon: Image.asset(
              icLearningOutlined,
              height: 24.h,
            ),
            label: "My Learning",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              icWishlist,
              height: 24.h,
            ),
            icon: Image.asset(
              icWishlistOutlined,
              height: 24.h,
            ),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              icSetting,
              height: 24.h,
            ),
            icon: Image.asset(
              icSettingOutlined,
              height: 24.h,
            ),
            label: "Settings",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
