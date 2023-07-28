

import 'package:flutter/material.dart';
import 'package:untitled/ui/main/control/control_page.dart';
import 'package:untitled/ui/main/home/new_home_page.dart';
import 'package:untitled/ui/main/profile/profile_page.dart';

import '../constant/colors.dart';
import 'home_page.dart';
import 'inbox/inbox_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final _pageController = PageController();
  int _tabIndex = 0;
  final _homeNew = HomeNewPage();
  final _controlPage = ControlPanelPage();
  final _inboxPage = InboxPage();
  final _profilePage = ProfilePage();

  final List<_Item> itemNames = [];
  var _cartNum = '0';
  final _activeColor = const Color(0xFF1B252C);
  final _normalColor = const Color(0xFF44525C);

  void _initData() {
    if (itemNames.isEmpty) {
      itemNames.add(_Item('Home', 'assets/main/ic_tab_home_active.png',
          'assets/main/ic_tab_home_active.png',_activeColor,_normalColor));
      itemNames.add(_Item('Control panel', 'assets/main/ic_tab_discover_active.png',
          'assets/main/ic_tab_discover_active.png',_activeColor,_normalColor));
      // itemNames.add(_Item('Sell', 'assets/main/ic_tab_sell_active.png',
      //     'assets/main/ic_tab_sell_active.png',_activeColor,_normalColor));
      itemNames.add(_Item('In box', 'assets/main/ic_tab_inbox_active.png',
          'assets/main/ic_tab_inbox_active.png',_activeColor,_normalColor,
          cartNum: _cartNum));
      itemNames.add(_Item('Profile', 'assets/main/ic_tab_profile_active.png',
          'assets/main/ic_tab_profile_active.png',_activeColor,_normalColor));
    } else {
      itemNames[3] = _Item('In box', 'assets/main/ic_tab_inbox_active.png',
          'assets/main/ic_tab_inbox_active.png',_activeColor,_normalColor,
          cartNum: _cartNum);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    var bottomNaviBar = _bottomNaviBar();
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        physics:const NeverScrollableScrollPhysics(),
        children: [
          _homeNew,
          _controlPage,
          _inboxPage,
          _profilePage,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: bottomNaviBar,
        onTap: (int index) {
          setState(() {
            _tabIndex = index;
            _pageController.jumpToPage(index);
          });
          if (_tabIndex == 3) {

          }
        },
        unselectedItemColor: textGrey,
        selectedItemColor: textBlack,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
  _bottomNaviBar() {
    return itemNames.map<BottomNavigationBarItem>((item) {
      if (item.name == 'In box') {
        return _cartBarItem(item);
      } else {
        return _normalItem(item);
      }
    }).toList();
  }

  _normalItem(_Item item) {
    return BottomNavigationBarItem(
        label: item.name,
        icon: _icon(item.normalIcon,_normalColor),
        activeIcon: _icon(item.activeIcon,_activeColor));
  }
  _cartBarItem(_Item item) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding:const EdgeInsets.symmetric(horizontal: 11),
            child: _icon(item.normalIcon,_normalColor),
          ),
          if (_cartNum != '0') _cartNumWidget()
        ],
      ),
      label: item.name,
      activeIcon: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: _icon(item.activeIcon,_activeColor),
          ),
          if (_cartNum != '0') _cartNumWidget()
        ],
      ),
    );
  }

  _icon(String? icon,Color? color) {
    return Image.asset(
      icon!,
      width: 22.0,
      height: 22.0,
      color: color,
    );
  }

  _cartNumWidget() {
    return Positioned(
      right: 18,
      top: 0,
      child: Container(
        constraints:const BoxConstraints(minHeight: 15, minWidth: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: appRed,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: textWhite, width: 1)),
        child: Text(
          '$_cartNum',
          style:const TextStyle(fontSize: 9, color: textWhite, height: 1.1),
        ),
      ),
    );
  }

}

class _Item {
  String name, activeIcon, normalIcon;
  String? cartNum;
  Color activeColor,normalColor;

  _Item(this.name, this.activeIcon, this.normalIcon, this.activeColor,this.normalColor,{this.cartNum});
}

