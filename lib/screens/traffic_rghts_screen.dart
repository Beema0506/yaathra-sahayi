import 'package:flutter/material.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:legal_helper/widgets/custom_appbar.dart';
import 'package:legal_helper/utils/app_colors.dart';
import 'package:provider/provider.dart';

class TrafficRightsScreen extends StatefulWidget {
  const TrafficRightsScreen({super.key});

  @override
  State<TrafficRightsScreen> createState() => _TrafficRightsScreenState();
}

class _TrafficRightsScreenState extends State<TrafficRightsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isMalayalam = context.watch<LanguageProvider>().isMalayalam;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(title: isMalayalam ? 'ട്രാഫിക് അവകാശങ്ങൾ' : 'Traffic Rights', actions: []),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xff1E1E1E) : AppColors.navigcolor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xff2A2A2A)
                          : const Color(0xffe8f3d8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.gavel_rounded,
                      color:AppColors.navigcolor,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isMalayalam ? 'നിങ്ങളുടെ അവകാശങ്ങൾ അറിയുക' : 'Know Your Rights',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color:  isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          isMalayalam ? "കേരളത്തിലെ ഒരു റോഡ് ഉപയോക്താവെന്ന നിലയിൽ നിങ്ങളുടെ നിയമപരമായ അവകാശങ്ങളും ഉത്തരവാദിത്തങ്ങളും മനസ്സിലാക്കുക.":"Understand your legal rights and responsibilities as a road user in Kerala.",

                          style: TextStyle(
                            height: 1.5,
                            color:  isDark ? Colors.white70 : Colors.black,                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            rightsTile(
              isDark: isDark,
              icon: Icons.local_police_outlined,
              title: isMalayalam ?' വാഹന പരിശോധന' : "Vehicle Checking",
              rights: [
                isMalayalam ? 'സാധുവായ ഡ്രൈവിംഗ് ലൈസൻസ് കൈവശം വയ്ക്കുക' : "Carry a valid driving licence",
                isMalayalam ? "ആവശ്യപ്പെടുമ്പോൾ രേഖകൾ കാണിക്കുക" : "Show documents when requested",
                isMalayalam ? "ഉദ്യോഗസ്ഥന്റെ തിരിച്ചറിയൽ വിവരങ്ങൾ ആവശ്യപ്പെടാം" : "You may ask for officer identification",
                isMalayalam ? "നിയമലംഘനങ്ങളെക്കുറിച്ച് വ്യക്തത ആവശ്യപ്പെടാം": "Request clarification regarding violations",
                isMalayalam ? "പിഴ ചുമത്തിയാൽ ഔദ്യോഗിക രസീത് ആവശ്യപ്പെടുക" : "Ask for official receipt if fined",
              ],
            ),
            rightsTile(
              isDark: isDark,
              icon: Icons.payments_outlined,
              title: isMalayalam ? "പിഴ ഈടാക്കൽ" : "Fine Collection",
              rights: [
                isMalayalam ? "ഔദ്യോഗിക രസീത് ആവശ്യപ്പെടാം" : "You may request an official receipt",
                isMalayalam ?"പണമടയ്ക്കുന്നതിന് മുമ്പ് നിയമലംഘനം പരിശോധിക്കുക" : "Verify the violation before payment",
                isMalayalam ? "പിഴ തുക ശ്രദ്ധാപൂർവ്വം പരിശോധിക്കുക" : "Check the fine amount carefully",
                isMalayalam ? "ഭാവിയിലെ ആവശ്യങ്ങൾക്കായി രസീത് സൂക്ഷിക്കുക" : "Keep the receipt for future reference",
              ],
            ),
            rightsTile(
              isDark: isDark,
              icon: Icons.car_crash_outlined,
              title: isMalayalam ? "അപകട സാഹചര്യങ്ങൾ" : "Accident Situations",
             rights:  isMalayalam ?[
              "സാധിക്കുന്നിടത്ത് പരിക്കേറ്റവർക്ക് സഹായം നൽകുക",
              "ഉടൻ തന്നെ പോലീസിനെയോ അടിയന്തര സേവനങ്ങളെയോ അറിയിക്കുക",
              "ബന്ധപ്പെട്ട വ്യക്തികളുമായി ആവശ്യമായ വിവരങ്ങൾ കൈമാറുക",
              "ഫോട്ടോകളും സാക്ഷികളുടെ വിവരങ്ങളും ഉൾപ്പെടെയുള്ള തെളിവുകൾ ശേഖരിക്കുക",
              "അപകട വിവരം നിങ്ങളുടെ ഇൻഷുറൻസ് ദാതാവിനെ അറിയിക്കുക",]
              :
                ["Provide assistance to injured persons when possible",
                "Inform Police or emergency services immediately",
                "Exchange necessary details with involved parties",
                "Collect evidence such as photos and witness details",
                "Report the accident to your insurance provider",
              ],
            ),
            rightsTile(
              isDark: isDark,
              icon: Icons.description_outlined,
              title: isMalayalam ?"ആവശ്യമായ രേഖകൾ": "Required Documents",
              rights: isMalayalam
                  ? [
                "സാധുവായ ഡ്രൈവിംഗ് ലൈസൻസ് കൈവശം വയ്ക്കുക",
                "വാഹനത്തിന്റെ രജിസ്ട്രേഷൻ സർട്ടിഫിക്കറ്റ് (RC) കൈവശം വയ്ക്കുക",
                "സാധുവായ ഇൻഷുറൻസ് രേഖകൾ കൈവശം വയ്ക്കുക",
                "ആവശ്യമായെങ്കിൽ മലിനീകരണ നിയന്ത്രണ സർട്ടിഫിക്കറ്റ് (PUC) കൈവശം വയ്ക്കുക",
                "DigiLocker അല്ലെങ്കിൽ mParivahan വഴിയുള്ള ഡിജിറ്റൽ രേഖകൾ സ്വീകരിച്ചേക്കാം",
              ]
                  : [
                "Carry a valid Driving Licence",
                "Carry Vehicle Registration Certificate (RC)",
                "Carry valid Insurance documents",
                "Carry Pollution Under Control (PUC) certificate if required",
                "Digital documents through DigiLocker or mParivahan may be accepted",
              ],
            ),
            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: isDark
                  ? const Color(0xff1E1E1E)
                  : AppColors.container,

                borderRadius: BorderRadius.circular(18),

                border: Border.all(color: AppColors.border),
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
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                         isMalayalam ? "നിർദ്ദേശം" : "Tip",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          isMalayalam ? "നിങ്ങളുടെ അവകാശങ്ങളെക്കുറിച്ച് അറിഞ്ഞിരിക്കുന്നത് റോഡിൽ സുരക്ഷിതവും നീതിപൂർവവുമായ അനുഭവം ഉറപ്പാക്കാൻ സഹായിക്കുന്നു" :"Being aware of your rights helps ensure a safe and fair experience on the road",
                          style: TextStyle(
                            height: 1.4,
                            color: isDark
                                ? Colors.white60
                                : Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),

                  const Icon(
                    Icons.verified_user_rounded,
                    color: AppColors.border,
                    size: 40,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  Widget rightsTile({
    required bool isDark,
    required IconData icon,
    required String title,
    required List<String> rights,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff1E1E1E) : AppColors.navigcolor,
        borderRadius: BorderRadius.circular(20),
        border: Border.symmetric(vertical : BorderSide(color: AppColors.navigcolor))
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          collapsedIconColor:
          isDark ? Colors.white70 : Colors.black,
          iconColor:
          isDark ? Colors.white70 : Colors.black,
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xff2A2A2A)
                : const Color(0xffdcefd1),
            child: Icon(icon, color: AppColors.navigcolor),
          ),
          title: Text(
            title,
            style:  TextStyle(
              color:  isDark ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          children: [
            Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: isDark ? const Color(0xff1E1E1E) : Colors.white,

                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),

                border: Border(
                  top: BorderSide(color: Colors.green.shade100, width: 1),
                ),
              ),
              child: Column(
                children: rights.map((item) {
                  return Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.check_circle,
                          color: AppColors.navigcolor,
                          size: 22,
                        ),

                        title: Text(
                          item,
                          style: TextStyle(
                            color: isDark ?  Colors.white70 : Color(0xff1E1E1E),
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      if (item != rights.last)
                        Divider(
                          height: 1,
                          color: Colors.green.shade100,
                          indent: 16,
                          endIndent: 16,
                        ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
