import 'package:flutter/material.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:legal_helper/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isMalayalam = context.watch<LanguageProvider>().isMalayalam;

    final emergencyServices = [
      {
        'title': isMalayalam ? 'പോലീസ്' : 'Police',
        'number': '100',
        'icon': Icons.local_police,
      },
      {
        'title': isMalayalam ? 'ഫയർഫോഴ്സ്' : 'Fire',
        'number': '101',
        'icon': Icons.local_fire_department,
      },
      {
        'title': isMalayalam ? 'ആംബുലൻസ്' : 'Ambulance',
        'number': '102',
        'icon': 'assets/images/ambulance.png',
      },
      {
        'title': isMalayalam ? 'വനിതാ ഹെൽപ്‌ലൈൻ' : 'Women',
        'number': '1091',
        'icon': 'assets/images/women.png',
      },
      {
        'title': isMalayalam ? 'ചൈൽഡ് ഹെൽപ്‌ലൈൻ' : 'Child',
        'number': '1098',
        'icon': 'assets/images/child.png',
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 1,

        centerTitle: true,

        iconTheme: const IconThemeData(color: Colors.white),

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0f4d38), Color(0xff1f6b4f), Color(0xff2f7d5d)],
            ),
          ),
        ),

        title:  Text(
          isMalayalam ? "എമർജൻസി ഹബ്" : 'Emergency Hub',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              isMalayalam ?" എമർജൻസി സർവീസസ്" : "Emergency Services",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white70 : Colors.black,
              ),
            ),

            const SizedBox(height: 20),

            /// HORIZONTAL CARDS
            SizedBox(
              height: 235,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: emergencyServices.length,

                itemBuilder: (context, index) {
                  final service = emergencyServices[index];

                  return Container(
                    width: 145,

                    margin: const EdgeInsets.only(right: 16),

                    padding: const EdgeInsets.all(14),

                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xff1E1E1E)
                          : AppColors.navigcolor,

                      borderRadius: BorderRadius.circular(26),

                      border: Border.all(
                        color: AppColors.navigcolor,
                        width: 2,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [

                        // ─────────────────────────
                        // ICON
                        // ─────────────────────────

                        service['icon'] is IconData
                            ? Icon(
                          service['icon'] as IconData,
                          size: 42,
                          color: AppColors.navigicon,
                        )
                            : Image.asset(
                          service['icon'].toString(),
                          height: 42,
                          width: 42,
                          color: AppColors.navigicon,
                        ),

                        const SizedBox(height: 10),

                        // ─────────────────────────
                        // SERVICE NAME
                        // ─────────────────────────

                        SizedBox(
                          height: 58,

                          child: Center(
                            child: Text(
                              service['title'].toString(),

                              textAlign: TextAlign.center,

                              maxLines: 2,

                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.25,
                                color: isDark
                                    ? Colors.white70
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 4),

                        // ─────────────────────────
                        // NUMBER
                        // ─────────────────────────

                        SizedBox(
                          height: 32,

                          child: Text(
                            service['number'].toString(),

                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? Colors.white70
                                  : Colors.black,
                            ),
                          ),
                        ),

                        const Spacer(),

                        // ─────────────────────────
                        // CALL BUTTON
                        // ─────────────────────────

                        Container(
                          height: 50,
                          width: 50,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff2f6e53),
                                Color(0xff4d8b6f),
                              ],
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 8,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),

                          child: const Icon(
                            Icons.call,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 35),

            /// TRUSTED CONTACTS TITLE
            Text(
              isMalayalam ? "വിശ്വസനീയ കോൺടാക്റ്റുകൾ" : "Trusted Contacts",

              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white70 : Colors.black,
              ),
            ),

            const SizedBox(height: 18),

            buildContactTile(
              context: context,
              name: "Mom",
              subtitle: "Emergency Contact",
              icon: Icons.person,
            ),

            buildContactTile(
              context: context,
              name: "Dad",
              subtitle: "Emergency Contact",
              icon: Icons.person,
            ),

            buildContactTile(
              context: context,
              name: "Doctor",
              subtitle: "Family Doctor",
              icon: Icons.local_hospital,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContactTile({
    required BuildContext context,
    required String name,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xff1E1E1E)
            : AppColors.navigcolor,

        borderRadius: BorderRadius.circular(22),

        border: Border.all(color: AppColors.navigcolor, width: 1.5),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xff2A2A2A)
                : const Color(0xffdcefd1),

            child: Icon(icon, color: AppColors.navigcolor, size: 28),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  name,

                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white70
                        : Colors.black,
                  ),
                ),

                const SizedBox(height: 4),

                Text(subtitle, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),

          Container(
            height: 50,
            width: 50,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 8,
                  offset: const Offset(0, 5),
                ),
              ],
              gradient: LinearGradient(
                colors: [Color(0xff2f6e53), Color(0xff4d8b6f)],
              ),
            ),

            child: const Icon(Icons.call, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
