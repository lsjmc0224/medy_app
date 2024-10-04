import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:medy/main/tab_item.dart';
import 'package:medy/main/tab_navigator.dart';
import 'dart:async';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TabItem _currentTab = TabItem.home;
  final tabs = [
    TabItem.home,
    TabItem.map,
    TabItem.mypage,
  ];
  final List<GlobalKey<NavigatorState>> navigatorKeys = [];

  @override
  void initState() {
    super.initState();
    initNavigatorKeys();
  }

  void initNavigatorKeys() {
    for (final _ in tabs) {
      navigatorKeys.add(GlobalKey<NavigatorState>());
    }
  }

  int get _currentIndex => tabs.indexOf(_currentTab);

  GlobalKey<NavigatorState> get _currentTabNavigationKey =>
      navigatorKeys[_currentIndex];

  bool get extendBody => true;

  static double get bottomNavigationBarBorderRadius => 30.0;

  FutureOr<void> afterFirstLayout(BuildContext context) async {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBackPressed,
      child: Scaffold(
        extendBody: extendBody,
        body: Padding(
          padding: EdgeInsets.only(
              bottom: extendBody ? 60 - bottomNavigationBarBorderRadius : 0),
          child: SafeArea(
            bottom: !extendBody,
            child: pages,
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  Future<bool> _handleBackPressed() async {
    final isFirstRouteInCurrentTab =
        (await _currentTabNavigationKey.currentState?.maybePop() == false);
    if (isFirstRouteInCurrentTab) {
      if (_currentTab != TabItem.home) {
        _changeTab(tabs.indexOf(TabItem.home));
        return false;
      }
    }
    // maybePop 가능하면 나가지 않는다.
    return isFirstRouteInCurrentTab;
  }

  IndexedStack get pages => IndexedStack(
      index: _currentIndex,
      children: tabs
          .mapIndexed(
            (index, tab) => Offstage(
              offstage: _currentTab != tab,
              child: TabNavigator(
                navigatorKey: navigatorKeys[index],
                tabItem: tab,
              ),
            ),
          )
          .toList());

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bottomNavigationBarBorderRadius),
          topRight: Radius.circular(bottomNavigationBarBorderRadius),
        ),
        child: BottomNavigationBar(
          items: navigationBarItems(context),
          currentIndex: _currentIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).disabledColor,
          onTap: _handleOnTapNavigationBarItem,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> navigationBarItems(BuildContext context) {
    return tabs
        .mapIndexed(
          (index, tab) => tab.toNavigationBarItem(
        context,
        isActivated: _currentIndex == index,
      ),
    )
        .toList();
  }

  void _handleOnTapNavigationBarItem(int index) {
    final oldTab = _currentTab;
    final targetTab = tabs[index];
    if (oldTab == targetTab) {
      final navigationKey = _currentTabNavigationKey;
      _popAllHistory(navigationKey);
    }
    _changeTab(index);
  }

  void _popAllHistory(GlobalKey<NavigatorState> navigationKey) {
    final bool canPop = navigationKey.currentState?.canPop() == true;
    if (canPop) {
      while (navigationKey.currentState?.canPop() == true) {
        navigationKey.currentState!.pop();
      }
    }
  }

  void _changeTab(int index) {
    setState(() {
      _currentTab = tabs[index];
    });
  }
}

