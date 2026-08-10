import 'package:flutter/material.dart';
import 'package:legal_helper/utils/app_colors.dart';

class QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: GestureDetector(
        onTap: () {},

        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 18),

          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xff1E1E1E)
                : Colors.white,

            borderRadius: BorderRadius.circular(18),

            border: Border.all(
              color: AppColors.border,
              width: 1.2,
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  isDark ? 0.18 : 0.06,
                ),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          child: Column(
            children: [
              Container(
                height: 58,
                width: 58,

                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xff2A2A2A)
                      : const Color(0xffEAF4DF),

                  borderRadius: BorderRadius.circular(16),
                ),

                child: Icon(
                  icon,
                  color: AppColors.navigcolor,
                  size: 30,
                ),
              ),

              const SizedBox(height: 14),

              Text(
                title,
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? Colors.white70
                      : const Color(0xff173E2C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}