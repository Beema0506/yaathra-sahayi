import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class BookmarkProvider extends ChangeNotifier{
  List <String> bookmarkedLaws = [];

  Future<void> loadBookmarks() async{
    final prefs = await SharedPreferences.getInstance();
    
    bookmarkedLaws = prefs.getStringList('bookmarks') ?? [];


    print(
      "Loaded Bookmarks: $bookmarkedLaws",
    );
    
    notifyListeners();
    
  }

  Future<void> addBookmarks(String lawId) async {

    print("Adding bookmark: $lawId");

    if (!bookmarkedLaws.contains(lawId)) {
      bookmarkedLaws.add(lawId);
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'bookmarks',
      bookmarkedLaws,
    );

    print("After Save: ${prefs.getStringList('bookmarks')}");

    notifyListeners();
  }

  Future<void> removeBookmark(String lawId) async{

    bookmarkedLaws.remove(lawId);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bookmarks', bookmarkedLaws);
    notifyListeners();

  }

  bool isBookmarked (String lawId){
    return bookmarkedLaws.contains(lawId);
  }


}