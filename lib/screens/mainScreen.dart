import 'package:flutter/material.dart';
import 'package:legal_helper/provider/bookmark_provider.dart';
import 'package:legal_helper/screens/bookmark_screen.dart';
import 'package:legal_helper/screens/homescreen.dart';
import 'package:legal_helper/screens/settings_screen.dart';
import 'package:legal_helper/screens/sos_screen.dart';
import 'package:legal_helper/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    Homescreen(),
    BookmarkScreen(),
    SosScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: pages[selectedIndex],

      bottomNavigationBar: Container(height: 60,
        margin: const EdgeInsets.all(12),

        padding: const EdgeInsets.symmetric(horizontal: 8, ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),

          gradient: const LinearGradient(
            colors: [Color(0xff0f4d38), Color(0xff1f6b4f), Color(0xff2f7d5d)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            navItem(icon: Icons.home_outlined, index: 0),

            navItem(icon: Icons.menu_book_outlined, index: 1),

            navItem(icon: Icons.shield_outlined, index: 2),

            navItem(icon: Icons.settings_outlined, index: 3),
          ],
        ),
      ),
    );
  }

  Widget navItem({required IconData icon, required int index}) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),

        child: Icon(
          icon,
          size: 30,

          color: isSelected ? AppColors.navigicon : Color(0xff759c68),
        ),
      ),
    );
  }
}
