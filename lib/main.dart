import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_with_zub/screens/main_screens/cart_screen.dart';
import 'package:practice_with_zub/screens/main_screens/catalog_screen.dart';
import 'package:practice_with_zub/screens/main_screens/profile_screen.dart';
import 'package:practice_with_zub/src/repository/constants/colors.dart';
import 'package:practice_with_zub/src/repository/local_storage/boxes.dart';
import 'package:practice_with_zub/src/repository/local_storage/cart.dart';

import 'app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CartAdapter());
  cartBox = await Hive.openBox<Cart>('cartBox');
  runApp(const App());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    CatalogScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: BottomNavigationBar(
          backgroundColor: Colors.grey.shade200,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          selectedItemColor: AppColors.raisinBlack,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 28,
                ),
                label: 'Каталог'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 28,
                ),
                label: 'Корзина'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                  size: 28,
                ),
                label: 'Профиль'),
          ],
        ),
      ),
    );
  }
}
