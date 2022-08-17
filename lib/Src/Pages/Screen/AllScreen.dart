// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sale_app/Src/Pages/Screen/HomeScreen.dart';
import 'package:sale_app/Src/Pages/Screen/CartScreen.dart';
import 'package:sale_app/Src/Pages/Values/custom_color.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  var _currentindex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomeScreen(),
          CartScreen(),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.grey,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentindex = index;
            _pageController.jumpToPage(index);
          });
        },
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Appcolor.backgroundColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(140),
        iconSize: 23,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'Shoping'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
