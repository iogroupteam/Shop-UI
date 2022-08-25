import 'package:flutter/material.dart';
import 'package:shoes_store/View/Home/homePage.dart';
import 'package:shoes_store/View/Pages/myBasket.dart';
import 'package:shoes_store/View/Pages/profile.dart';
import 'package:shoes_store/View/Pages/savePage.dart';

class NavBar extends StatefulWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _currentIndex = 0;

  static List<Widget> pages = [
    HomePage(),
    SavePage(),
    MyBasket(),
    Profile()

  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(color:  Colors.grey.withOpacity(0.5),spreadRadius: 0,blurRadius: 10)
            ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,

              type: BottomNavigationBarType.fixed,

              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              
              items: [
                BottomNavigationBarItem(icon: Image.asset('assets/icons/1.1.png',height: 20,),label: '',
                activeIcon: Image.asset('assets/icons/1.png',height: 20,)),
                BottomNavigationBarItem(icon: Image.asset('assets/icons/2.1.png',height: 20,),label: '',
                activeIcon: Image.asset('assets/icons/2.png',height: 20,)),
                BottomNavigationBarItem(icon: Image.asset('assets/icons/3.1.png',height: 20,),label: '',
                activeIcon: Image.asset('assets/icons/3.png',height: 20,)),
                BottomNavigationBarItem(icon: Image.asset('assets/icons/4.1.png',height: 20,),label: '',
                activeIcon: Image.asset('assets/icons/4.png',height: 20,)),
              ]
              
              ),
          ),
        ),
      ),

      
    );
  }
}