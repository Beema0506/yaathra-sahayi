import 'package:flutter/material.dart';
import 'package:legal_helper/widgets/custom_appbar.dart';
import 'package:legal_helper/utils/app_colors.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:provider/provider.dart';

class AppGuideScreen extends StatelessWidget {
  const AppGuideScreen({super.key});

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
        title: isMalayalam
            ? "ആപ്പ് ഗൈഡ്"
            : "App Guide",
        actions: [],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // =========================
            // WELCOME CARD
            // =========================

            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xff1E1E1E)
                    : Colors.white,

                border: Border.all(
                  color: AppColors.border,
                ),

                borderRadius:
                BorderRadius.circular(15),
              ),

              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Container(
                    height: 60,
                    width: 60,

                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(30),

                      color: isDark
                          ? const Color(0xff2A2A2A)
                          : const Color(0xffe8f3d8),
                    ),

                    child: const Icon(
                      Icons.menu_book_rounded,
                      size: 35,
                      color: AppColors.navigcolor,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [
                        Text(
                          isMalayalam
                              ? "യാത്രാ സഹായിയിലേക്ക് സ്വാഗതം"
                              : "Welcome to Yaathra Sahayi",

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.bold,
                            color: isDark
                                ? Colors.white
                                : AppColors.navigcolor,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          isMalayalam
                              ? "ആപ്പ് എങ്ങനെ ഉപയോഗിക്കാമെന്നും പ്രധാനപ്പെട്ട സവിശേഷതകൾ എളുപ്പത്തിൽ എങ്ങനെ ഉപയോഗിക്കാമെന്നും മനസ്സിലാക്കാൻ ഈ ഗൈഡ് നിങ്ങളെ സഹായിക്കും."
                              : "This guide will help you understand how to use the app and access important features easily.",

                          style: TextStyle(
                            height: 1.5,
                            color: isDark
                                ? Colors.white60
                                : Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // HOME SCREEN
            // =========================

            guideCard(
              isDark: isDark,

              title: isMalayalam
                  ? '🏠  ഹോം സ്ക്രീൻ'
                  : '🏠  Home Screen',

              content: isMalayalam
                  ? 'നിയമ വിഭാഗങ്ങൾ ബ്രൗസ് ചെയ്യാനും ട്രാഫിക് നിയമങ്ങൾ തിരയാനും പ്രധാനപ്പെട്ട സവിശേഷതകൾ ആക്‌സസ് ചെയ്യാനും ഉപയോഗിക്കുക.'
                  : 'Browse law categories, search traffic laws and access important features.',
            ),

            // =========================
            // LAWS
            // =========================

            guideCard(
              isDark: isDark,

              title: isMalayalam
                  ? '⚖️  നിയമ വിഭാഗം'
                  : '⚖️  Laws Section',

              content: isMalayalam
                  ? 'ഏതെങ്കിലും വിഭാഗം തുറന്ന് വിശദമായ ട്രാഫിക് നിയമങ്ങളും പിഴകളും മറ്റ് വിവരങ്ങളും വായിക്കുക.'
                  : 'Open any category to read detailed traffic laws, penalties and information.',
            ),

            // =========================
            // BOOKMARKS
            // =========================

            guideCard(
              isDark: isDark,

              title: isMalayalam
                  ? '🔖  ബുക്ക്മാർക്കുകൾ'
                  : '🔖  Bookmarks',

              content: isMalayalam
                  ? 'ബുക്ക്മാർക്ക് ഐക്കണിൽ ടാപ്പ് ചെയ്ത് പ്രധാനപ്പെട്ട നിയമങ്ങൾ സേവ് ചെയ്യുകയും അവ എപ്പോൾ വേണമെങ്കിലും ആക്‌സസ് ചെയ്യുകയും ചെയ്യാം.'
                  : 'Save important laws by tapping the bookmark icon and access them anytime.',
            ),

            // =========================
            // EMERGENCY
            // =========================

            guideCard(
              isDark: isDark,

              title: isMalayalam
                  ? '🚨  അടിയന്തര സഹായം'
                  : '🚨  Emergency Hub',

              content: isMalayalam
                  ? 'പോലീസ്, ആംബുലൻസ്, ഫയർ ഫോഴ്സ് തുടങ്ങിയ അടിയന്തര സേവനങ്ങളിലേക്ക് വേഗത്തിൽ വിളിക്കുക.'
                  : 'Quickly call Police, Ambulance, Fire Force and other emergency services.',
            ),

            // =========================
            // TRAFFIC RIGHTS
            // =========================

            guideCard(
              isDark: isDark,

              title: isMalayalam
                  ? '🛡️  ട്രാഫിക് അവകാശങ്ങൾ'
                  : '🛡️  Traffic Rights',

              content: isMalayalam
                  ? 'വാഹന പരിശോധന, പിഴ ഈടാക്കൽ, റോഡ് അപകടങ്ങൾ തുടങ്ങിയ സാഹചര്യങ്ങളിൽ നിങ്ങളുടെ അവകാശങ്ങളെക്കുറിച്ച് മനസ്സിലാക്കുക.'
                  : 'Learn about your rights during vehicle checks, fine collection and road accidents.',
            ),

            // =========================
            // SETTINGS
            // =========================

            guideCard(
              isDark: isDark,

              title: isMalayalam
                  ? '⚙️  ക്രമീകരണങ്ങൾ'
                  : '⚙️  Settings',

              content: isMalayalam
                  ? 'ഭാഷ ക്രമീകരിക്കുക, ഡാർക്ക് മോഡ് പ്രവർത്തനക്ഷമമാക്കുക, ആപ്പിനെക്കുറിച്ചുള്ള വിവരങ്ങൾ പരിശോധിക്കുക.'
                  : 'Customize language, enable dark mode and explore app information.',
            ),

            const SizedBox(height: 10),

            // =========================
            // TIP
            // =========================

            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xff1E1E1E)
                    : AppColors.container,

                borderRadius:
                BorderRadius.circular(18),

                border: Border.all(
                  color: AppColors.border,
                ),
              ),

              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 40,
                    color: AppColors.border,
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [
                        Text(
                          isMalayalam
                              ? "നിർദ്ദേശം"
                              : "Tip",

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.bold,
                            color: isDark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          isMalayalam
                              ? "നിങ്ങളുടെ യാത്ര കൂടുതൽ സുരക്ഷിതവും എളുപ്പവും സമ്മർദ്ദരഹിതവുമാക്കുന്നതിനാണ് എല്ലാ സവിശേഷതകളും രൂപകൽപ്പന ചെയ്തിരിക്കുന്നത്."
                              : "All features are designed to make your journey safer, smarter and stress-free.",

                          style: TextStyle(
                            height: 1.4,
                            color: isDark
                                ? Colors.white60
                                : Colors.grey.shade900,
                            fontWeight:
                            FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 4),

                  const Icon(
                    Icons.verified_user_outlined,
                    color: AppColors.border,
                    size: 40,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget guideCard({
    required bool isDark,
    required String title,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xff1E1E1E)
            : AppColors.container,

        borderRadius:
        BorderRadius.circular(20),

        border: Border.all(
          width: 0.6,
          color: AppColors.border,
        ),
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize:
                  MainAxisSize.min,

                  children: [

                    Expanded(
                      child: Text(
                        title,

                        style: TextStyle(
                          color: isDark
                              ? Colors.white
                              : Colors.black87,

                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  content,

                  style: TextStyle(
                    color: isDark
                        ? Colors.white70
                        : Colors.black87,

                    height: 1.5,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}