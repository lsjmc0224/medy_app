import 'package:flutter/material.dart';
import '../navigation/bottom_navigation.dart';
import '../screen/s_home_page.dart';
import '../screen/s_map_page.dart';
import '../screen/s_my_page.dart';

// Enum to represent different tabs
enum TabItem { home, map, mypage }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TabItem _currentTab = TabItem.home; // 현재 활성화된 탭을 저장하는 변수
  final tabs = [TabItem.home, TabItem.map, TabItem.mypage]; // 모든 탭 리스트
  final List<GlobalKey<NavigatorState>> navigatorKeys = []; // 각 탭마다 NavigatorState 키를 저장할 리스트

  @override
  void initState() {
    super.initState();
    initNavigatorKeys(); // Navigator 키 초기화
  }

  // 각 탭마다 Navigator 키를 초기화하는 메서드
  void initNavigatorKeys() {
    for (final _ in tabs) {
      navigatorKeys.add(GlobalKey<NavigatorState>());
    }
  }

  // 현재 활성화된 탭의 인덱스를 반환하는 getter
  int get _currentIndex => tabs.indexOf(_currentTab);

  // 현재 탭의 NavigatorState 키를 반환하는 getter
  GlobalKey<NavigatorState> get _currentTabNavigationKey => navigatorKeys[_currentIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentTabContent(), // 현재 활성화된 탭의 콘텐츠를 표시
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: _handleOnTapNavigationBarItem,
      ),
    );
  }

  Widget _buildCurrentTabContent() {
    return IndexedStack(
      index: _currentIndex, // 현재 활성화된 인덱스
      children: tabs.asMap().entries.map((entry) {
        int index = entry.key;
        TabItem tab = entry.value;
        return Offstage(
          offstage: _currentTab != tab, // 현재 탭이 아니면 숨김 처리
          child: Navigator(
            key: navigatorKeys[index], // 각 탭의 Navigator 키 사용
            onGenerateRoute: (routeSettings) {
              return MaterialPageRoute(
                builder: (context) => _buildPageForTab(tab), // 각 탭에 맞는 페이지 생성
              );
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPageForTab(TabItem tab) {
    switch (tab) {
      case TabItem.home:
        return const HomePage(); // 홈 페이지 위젯 사용
      case TabItem.map:
        return const MapPage(); // 지도 페이지 위젯 사용
      case TabItem.mypage:
        return const MyPage(); // 마이 페이지 위젯 사용
    }
  }

  void _handleOnTapNavigationBarItem(int index) {
    final oldTab = _currentTab;
    final targetTab = tabs[index];
    if (oldTab == targetTab) {
      final navigationKey = _currentTabNavigationKey;
      _popAllHistory(navigationKey); // 동일한 탭을 다시 클릭했을 때 스택을 모두 제거
    }
    setState(() {
      _currentTab = tabs[index]; // 활성화된 탭 변경
    });
  }

  void _popAllHistory(GlobalKey<NavigatorState> navigationKey) {
    final bool canPop = navigationKey.currentState?.canPop() == true;
    if (canPop) {
      while (navigationKey.currentState?.canPop() == true) {
        navigationKey.currentState!.pop(); // 가능한 모든 네비게이션 pop
      }
    }
  }
}
