import 'package:badges/badges.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:monibie/enums/const.dart';
import 'package:monibie/screens/dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum _SelectedTab { home, feeds, chat, account }

class _HomeScreenState extends State<HomeScreen> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(cgreyLight),
      extendBody: false,
      body: Padding(
        padding: const EdgeInsets.only(top:20.0),
        child: Dashboard(),
      ),
      bottomNavigationBar: DotNavigationBar(
        enableFloatingNavBar: true,
        paddingR: EdgeInsets.all(10),backgroundColor: Colors.blueGrey.shade100.withOpacity(0.2),
        marginR: EdgeInsets.all(0),
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        dotIndicatorColor: Colors.transparent,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/icons/home.svg',
                  width: 20,
                  color: _selectedTab == _SelectedTab.home
                      ? HexColor(cPurpleDeep)
                      : Colors.black,
                ),
                SizedBox(height: 5),
                Text(
                  "Home",
                  style: TextStyle(
                    fontFamily: 'Nunito-Medium',
                    fontSize: 11.0,
                    color: _selectedTab == _SelectedTab.home
                        ? HexColor(cPurpleDeep)
                        : Colors.black,
                  ),
                )
              ],
            ),
            selectedColor: Colors.purple,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/icons/feeds.svg',
                  width: 20,
                  color: _selectedTab == _SelectedTab.feeds
                      ? HexColor(cPurpleDeep)
                      : Colors.black,
                ),
                SizedBox(height: 5),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontFamily: 'Nunito-Medium',
                    fontSize: 11.0,
                    color: _selectedTab == _SelectedTab.feeds
                        ? HexColor(cPurpleDeep)
                        : Colors.black,
                  ),
                )
              ],
            ),
            selectedColor: Colors.purple,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/icons/chat-filled.svg',
                  width: 20,
                  color: _selectedTab == _SelectedTab.chat
                      ? HexColor(cPurpleDeep)
                      : Colors.black,
                ),
                SizedBox(height: 5),
                Text(
                  "Chat",
                  style: TextStyle(
                    fontFamily: 'Nunito-Medium',
                    fontSize: 11.0,
                    color: _selectedTab == _SelectedTab.chat
                        ? HexColor(cPurpleDeep)
                        : Colors.black,
                  ),
                )
              ],
            ),
            selectedColor: Colors.purple,
          ),

          /// Profile
           DotNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                'assets/images/icons/account-filled.svg',
                  width: 20,
                  color: _selectedTab == _SelectedTab.account
                      ? HexColor(cPurpleDeep)
                      : Colors.black,
                ),
                SizedBox(height: 5),
                Text(
                  "Account",
                  style: TextStyle(
                    fontFamily: 'Nunito-Medium',
                    fontSize: 11.0,
                    color: _selectedTab == _SelectedTab.account
                        ? HexColor(cPurpleDeep)
                        : Colors.black,
                  ),
                )
              ],
            ),
            selectedColor: Colors.purple,
          ), 
        
         
        ],
      ),
    );
  }
}

