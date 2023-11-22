
import 'package:e_commerce/common/constant/colors.dart';
import 'package:e_commerce/common/constant/images.dart';
import 'package:e_commerce/presentation/account/account_page.dart';
import 'package:e_commerce/presentation/cart/cart_page.dart';
import 'package:e_commerce/presentation/home/home_page.dart';

import 'package:flutter/material.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
   
   const CartPage(),
   const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      
      body: _pages[_selectedIndex],
      
      
     
      bottomNavigationBar: BottomNavigationBar(
        
        
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: ColorName.primary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconHome)),
            label: 'Home',
          ),
         
        
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconCart)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconUser)),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
