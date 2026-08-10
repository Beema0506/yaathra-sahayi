import 'package:flutter/material.dart';
import 'package:legal_helper/widgets/custom_appbar.dart';
import 'package:legal_helper/utils/app_colors.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
            ? "ആപ്പിനെക്കുറിച്ച്"
            : "About App",
        actions: [],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // =========================
            // APP ICON
            // =========================

            Container(
              height: 100,
              width: 100,

              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xff2A2A2A)
                    : const Color(0xffe8f3d8),
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.shield_outlined,
                size: 55,
                color: AppColors.navigcolor,
              ),
            ),

            const SizedBox(height: 12),

            // =========================
            // APP NAME
            // =========================

            Text(
              isMalayalam
                  ? "യാത്രാ സഹായി"
                  : "Yaathra Sahayi",

              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? Colors.white70
                    : Colors.black,
              ),
            ),

            const SizedBox(height: 6),

            // =========================
            // SUBTITLE
            // =========================

            Text(
              isMalayalam
                  ? "കേരള ട്രാഫിക് നിയമ സഹായി"
                  : "Kerala Traffic Law Companion",

              textAlign: TextAlign.center,

              style: TextStyle(
                color: isDark
                    ? Colors.grey.shade600
                    : Colors.grey.shade800,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 8),

            // =========================
            // VERSION
            // =========================

            Text(
              isMalayalam
                  ? "പതിപ്പ് 1.0.0"
                  : "Version 1.0.0",

              style: TextStyle(
                color: isDark
                    ? Colors.grey.shade600
                    : Colors.grey.shade800,
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // ABOUT
            // =========================

            _buildCard(
              context: context,

              title: isMalayalam
                  ? "ആപ്പിനെക്കുറിച്ച്"
                  : "About",

              content: isMalayalam
                  ? "കേരളത്തിലെ റോഡ് ഉപയോക്താക്കൾക്ക് ട്രാഫിക് നിയമങ്ങൾ, പിഴകൾ, ആവശ്യമായ രേഖകൾ, അടിയന്തര സേവനങ്ങൾ എന്നിവ ലളിതമായും എളുപ്പത്തിലും മനസ്സിലാക്കാൻ യാത്രാ സഹായി സഹായിക്കുന്നു."
                  : "Yaathra Sahayi helps road users understand Kerala traffic laws, fines, required documents and emergency services in a simple and accessible way.",
            ),

            const SizedBox(height: 16),

            // =========================
            // FEATURES
            // =========================

            _buildCard(
              context: context,

              title: isMalayalam
                  ? "സവിശേഷതകൾ"
                  : "Features",

              content: isMalayalam
                  ? "• ട്രാഫിക് നിയമങ്ങൾ\n"
                  "• അടിയന്തര ബന്ധങ്ങൾ\n"
                  "• സേവ് ചെയ്ത നിയമങ്ങൾ\n"
                  "• മലയാളം പിന്തുണ\n"
                  "• ഓഫ്‌ലൈൻ ആക്‌സസ്"
                  : "• Traffic Laws\n"
                  "• Emergency Contacts\n"
                  "• Saved Laws\n"
                  "• Malayalam Support\n"
                  "• Offline Access",
            ),

            const SizedBox(height: 16),

            // =========================
            // DATA SOURCES
            // =========================

            _buildCard(
              context: context,

              title: isMalayalam
                  ? "വിവര സ്രോതസ്സുകൾ"
                  : "Data Sources",

              content: isMalayalam
                  ? "• കേരള മോട്ടോർ വാഹന വകുപ്പ് (MVD)\n"
                  "• മോട്ടോർ വാഹന നിയമം\n"
                  "• ഔദ്യോഗിക സർക്കാർ വിജ്ഞാപനങ്ങൾ"
                  : "• Kerala Motor Vehicles Department (MVD)\n"
                  "• Motor Vehicles Act\n"
                  "• Official Government Notifications",
            ),

            const SizedBox(height: 30),

            // =========================
            // FOOTER
            // =========================

            Text(
              isMalayalam
                  ? "കേരള റോഡ് ഉപയോക്താക്കൾക്കായി 🇮🇳"
                  : "Made for Kerala Road Users 🇮🇳",

              textAlign: TextAlign.center,

              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isDark
                    ? Colors.white54
                    : Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget _buildCard({
    required String title,
    required String content,
    required BuildContext context,
  }) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xff1E1E1E)
            : AppColors.container,

        borderRadius:
        BorderRadius.circular(16),

        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          Center(
            child: Text(
              title,

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? Colors.white70
                    : Colors.black,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            content,

            style: TextStyle(
              height: 1.5,
              color: isDark
                  ? Colors.grey.shade500
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}