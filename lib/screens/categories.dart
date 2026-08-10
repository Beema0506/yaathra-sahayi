import 'package:flutter/material.dart';
import 'package:legal_helper/models/law_models.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:legal_helper/screens/law_detail.dart';
import 'package:legal_helper/services/law_service.dart';
import 'package:legal_helper/utils/app_colors.dart';
import 'package:legal_helper/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  final String title;
  final String category;

  const Categories({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Laws>> law;

  @override
  void initState() {
    super.initState();
    law = LawService().loadLaws();
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final isMalayalam =
        context.watch<LanguageProvider>().isMalayalam;

    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

      appBar: CustomAppBar(
        title: widget.title,
        actions: [],
      ),

      body: FutureBuilder<List<Laws>>(
        future: law,

        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                isMalayalam
                    ? "പിശക്: ${snapshot.error}"
                    : "Error: ${snapshot.error}",
              ),
            );
          }

          final filtered = snapshot.data!
              .where(
                (item) => item.category == widget.category,
          )
              .toList();

          if (filtered.isEmpty) {
            return Center(
              child: Text(
                isMalayalam
                    ? "നിയമങ്ങളൊന്നും കണ്ടെത്തിയില്ല!"
                    : "No laws found!",
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),

            itemCount: filtered.length,

            itemBuilder: (context, index) {
              final laws = filtered[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LawDetailScreen(
                        law: laws,
                      ),
                    ),
                  );
                },

                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xff1E1E1E)
                        : Colors.white,

                    borderRadius:
                    BorderRadius.circular(18),

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

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Row(
                      children: [
                        /// ICON
                        Container(
                          height: 58,
                          width: 58,

                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xff2A2A2A)
                                : const Color(0xffEAF4DF),

                            borderRadius:
                            BorderRadius.circular(16),
                          ),

                          child: const Icon(
                            Icons.gavel_rounded,
                            color: AppColors.navigcolor,
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 16),

                        /// TITLE & REFERENCE
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [
                              Text(
                                isMalayalam
                                    ? laws.titleMl
                                    : laws.titleEn,

                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w400,

                                  color: isDark
                                      ? Colors.white70
                                      : const Color(
                                    0xff173E2C,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                laws.lawReference,

                                style: TextStyle(
                                  fontSize: 13,

                                  color: isDark
                                      ? Colors.white54
                                      : Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// ARROW
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,

                          color: isDark
                              ? Colors.white38
                              : Colors.grey.shade500,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}