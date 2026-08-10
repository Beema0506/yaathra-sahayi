import 'package:flutter/material.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:legal_helper/screens/LanguageScreen.dart';
import 'package:legal_helper/screens/app_guideScreen.dart';
import 'package:legal_helper/screens/sos_screen.dart';
import 'package:legal_helper/screens/traffic_rghts_screen.dart';
import 'package:legal_helper/widgets/custom_appbar.dart';
import 'package:legal_helper/utils/app_colors.dart';
import 'package:legal_helper/screens/aboutscreen.dart';
import 'package:legal_helper/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {

    final isMalayalam = context.watch<LanguageProvider>().isMalayalam;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppBar(title: 'Settings', actions: []),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSection(
              title: isMalayalam ? "മുൻഗണനകൾ" : 'Preference',
              children: [
                _buildTile(
                  icon: Icons.language,
                  title:isMalayalam ? "ഭാഷ" : 'Language',
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "EN",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.navigicon,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.chevron_right, color: AppColors.icon),
                    ],
                  ),
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>LanguageScreen()));
                  }
                ),
                const Divider(height: 1),

                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return _buildTile(
                      icon: Icons.dark_mode_outlined,
                      title:isMalayalam ? "ഡാർക്ക് മോഡ്" : "Dark Mode",

                      trailing: Switch(
                        value: themeProvider.isDarkMode,

                        onChanged: (value) {
                          themeProvider.toggleTheme(value);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// SAFETY & SUPPORT
            _buildSection(
              title:isMalayalam ? "സുരക്ഷയും സഹായവും" : "Safety & Support",
              children: [
                _buildTile(
                  icon: Icons.emergency,
                  title:isMalayalam ? "അടിയന്തര ബന്ധങ്ങൾ" : "Emergency Contacts",
                  onTap: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) => const SosScreen(),
                      ),
                    );
                  },
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.icon,
                  ),
                ),

                const Divider(height: 1),

                _buildTile(
                  icon: Icons.gavel,
                  title:isMalayalam ?  "ട്രാഫിക് അവകാശങ്ങൾ" : "Traffic Rights",
                  onTap: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) => const TrafficRightsScreen(),
                      ),
                    );
                  },

                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.icon,
                  ),
                ),

                const Divider(height: 1),

                _buildTile(
                  icon: Icons.menu_book_outlined,
                  title: isMalayalam ? "ആപ്പ് ഗൈഡ്" : "App Guide",
                  onTap: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) => const AppGuideScreen(),
                      ),
                    );
                  },
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.icon,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// ABOUT
            _buildSection(
              title:isMalayalam ?  "ആപ്പിനെക്കുറിച്ച്" :  "About",
              children: [
                _buildTile(
                  icon: Icons.info_outline,
                  title:isMalayalam ?  "ആപ്പിനെക്കുറിച്ച്" : "About App",

                  onTap: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) => const AboutScreen(),
                      ),
                    );
                  },

                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.icon,
                  ),
                ),

                const Divider(height: 1),

                _buildTile(
                  icon: Icons.star_outline,
                  title:isMalayalam ?  "പതിപ്പ് 1.0.0" : "Rate App",
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.icon,
                  ),
                ),

                const Divider(height: 1),

                _buildTile(
                  icon: Icons.refresh,
                  title:isMalayalam ?  "അപ്‌ഡേറ്റുകൾ പരിശോധിക്കുക" : "Check Updates",
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.icon,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
                isMalayalam ? ' യാത്രാ സഹായി' : "Yaathra Sahayi",
              style: TextStyle(
                color: AppColors.icon,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.grey.shade600),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: const Color(0xfff8fbf2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),

              child: Column(
                children: [
                   Row(
                    children: [
                      Icon(Icons.info_outline, size: 18, color: Colors.red),

                      SizedBox(width: 6),

                      Text(
                          isMalayalam ? "നിരാകരണം" : "Disclaimer",
                          style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.icon,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  Text(
                    isMalayalam ? "ഈ ആപ്പിൽ നൽകിയിരിക്കുന്ന വിവരങ്ങൾ പൊതുവായ മാർഗ്ഗനിർദ്ദേശത്തിനായി മാത്രമാണ്. നിയമപരമായ ആവശ്യകതകളും ട്രാഫിക് നിയമങ്ങളും ഔദ്യോഗിക കേരള MVD, സർക്കാർ സ്രോതസ്സുകളിൽ നിന്ന് എപ്പോഴും പരിശോധിക്കുക." : "Information provided in this app is for general guidance only. Always verify legal requirements and traffic regulations through official Kerala MVD and Government sources.",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Text(
              isMalayalam ? "കേരള റോഡ് ഉപയോക്താക്കൾക്കായി 🇮🇳" : "Made for Kerala Road Users 🇮🇳",
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xff1E1E1E)
            : AppColors.navigcolor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.container, width: 1.3),
      ),

      child: Column(
        children: [
          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(14),

            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          ...children,
        ],
      ),
    );
  }

  static Widget _buildTile({
    required IconData icon,
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColors.navigicon),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),

      trailing: trailing,
    );
  }
}
