import 'package:flutter/material.dart';
import 'package:medy/data/user_dummy.dart';
import 'package:medy/screen/f_hospital_list.dart';
import '../screen/f_home.dart';
import '../screen/f_map.dart';
import '../screen/f_my_page.dart';

enum TabItem {
  home(Icons.home, 'Home', HomeFragment()),
  map(Icons.map, 'Map', HospitalListFragment()),
  mypage(Icons.person, 'My Page', MyPageFragment());

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage, {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context, {required bool isActivated}) {
    return BottomNavigationBarItem(
      icon: Icon(
        key: ValueKey(tabName),
        isActivated ? activeIcon : inActiveIcon,
        color: isActivated
            ? Theme.of(context).iconTheme.color
            : Theme.of(context).disabledColor,
      ),
      label: tabName,
    );
  }
}
