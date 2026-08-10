import 'package:flutter/material.dart';
import 'package:legal_helper/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {

  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,

      centerTitle: true,

      iconTheme: const IconThemeData(color: Colors.white),

      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0f4d38), Color(0xff1f6b4f), Color(0xff2f7d5d)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),

      title: Text(
        title,

        style: const TextStyle(
          color: AppColors.title,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}