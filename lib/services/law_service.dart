import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:legal_helper/models/law_models.dart';

class LawService {
  Future<List<Laws>> loadLaws() async {
    // List of all JSON files
    final List<String> jsonFiles = [
      'assets/data/violations.json',
      'assets/data/drivingrules.json',
      'assets/data/documents.json',
      'assets/data/safety.json',
    ];

    List<Laws> allLaws = [];

    for (String file in jsonFiles) {
      final String jsonString = await rootBundle.loadString(file);

      final List<dynamic> jsonData = jsonDecode(jsonString);

      allLaws.addAll(
        jsonData.map((e) => Laws.fromJson(e)).toList(),
      );
    }

    // Sort by ID
    allLaws.sort((a, b) => a.id.compareTo(b.id));

    return allLaws;
  }
}