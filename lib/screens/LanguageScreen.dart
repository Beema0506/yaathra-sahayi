import 'package:flutter/material.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:legal_helper/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    return Scaffold(
      appBar: CustomAppBar(title: 'Language', actions: []),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose your preferred language',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Text(
                  'English',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                trailing: !languageProvider.isMalayalam
                    ? Icon(Icons.check)
                    : null,
                onTap: () => languageProvider.setLanguage(false),
              ),
            ),
            SizedBox(height: 10),

            Card(
              elevation: 1,
              child: ListTile(
                leading: Text(
                  'Malayalam',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                trailing: languageProvider.isMalayalam
                    ? Icon(Icons.check)
                    : null,
                onTap: () {
                  languageProvider.setLanguage(true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
