import 'package:flutter/material.dart';
import 'package:legal_helper/screens/categories.dart';
import 'package:legal_helper/utils/app_colors.dart';

class CardsCategory extends StatelessWidget {
  final String title;
  final String img;
  final String category;

  const CardsCategory({super.key, required this.title, required this.img, required this.category});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      borderRadius: BorderRadius.circular(22),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Categories(title: title,category:category ,)),
        );
      },

      child: Container(height: 200, width: 100,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xff1E1E1E) : Colors.white70,

          borderRadius: BorderRadius.circular(22),

          border: Border.all(color: AppColors.border, width: 1.2),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.18 : 0.06),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Green Circle
              Container(
                height: 80,
                width: 80,

                decoration: const BoxDecoration(
                  color: AppColors.navigcolor,
                  shape: BoxShape.circle,
                ),

                child: Padding(
                  padding: const EdgeInsets.all(18),

                  child: Image.asset(
                    img,
                    height: 25,
                    width: 25,
                    fit: BoxFit.contain,
                    color: const Color(0xffC3EDB7),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? Colors.white70
                            : const Color(0xff173E2C),
                      ),
                    ),
                  ),

                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: isDark ? Colors.white54 : const Color(0xff2D5B46),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
