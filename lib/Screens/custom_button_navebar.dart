import 'package:flutter/material.dart';
import 'package:food_delivery/Screens/favorites_page.dart';
import 'package:food_delivery/Screens/home_page.dart';
import 'package:food_delivery/Screens/profie_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedindex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  List<Widget> widgetBuilder = const[
    HomePage(),
    FavoritesPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: widgetBuilder[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: onItemTapped,
      ),
    );
  }
}
