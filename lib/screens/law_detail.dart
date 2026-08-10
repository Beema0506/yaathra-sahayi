import 'package:flutter/material.dart';
import 'package:legal_helper/models/law_models.dart';
import 'package:legal_helper/provider/bookmark_provider.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:legal_helper/utils/app_colors.dart';
import 'package:legal_helper/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class LawDetailScreen extends StatelessWidget {
  final Laws law;

  const LawDetailScreen({super.key, required this.law});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isMalayalam = context.watch<LanguageProvider>().isMalayalam;
    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF121212)
          : const Color(0xFFF5F8F2),
      appBar: CustomAppBar(
        title: (isMalayalam ? law.titleMl : law.titleEn),
        actions: [
          Consumer<BookmarkProvider>(
            builder: (context, provider, child) {
              final isSaved = provider.isBookmarked(law.id.toString());

              return IconButton(
                onPressed: () {
                  if (isSaved) {
                    provider.removeBookmark(law.id.toString());
                  } else {
                    provider.addBookmarks(law.id.toString());
                  }
                },
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border_outlined,
                  color: AppColors.title,
                ),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF24342A)
                    : const Color(0xFFEAF5E5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark ? Colors.green.shade700 : Colors.green.shade200,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black54 : Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    isMalayalam ? 'ലംഘനം' : "Violation",
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    isMalayalam ? law.titleMl : law.titleEn,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    law.lawReference,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black12)],
                border: Border.all(
                  color: isDark ? Colors.green.shade700 : Colors.green.shade200,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.description_outlined,
                        color: Colors.green,
                        size: 30,
                      ),

                      SizedBox(width: 10),

                      Text(
                        isMalayalam ? 'വിവരണം' : "Description",
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Text(
                    isMalayalam ? law.descriptionMl : law.descriptionEn,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 20),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF8B0000) : Colors.red.shade800,

                borderRadius: BorderRadius.circular(18),
              ),

              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.white,
                    size: 40,
                  ),

                  SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      isMalayalam ? law.penaltyMl : law.penaltyEn,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
