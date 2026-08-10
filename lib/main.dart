import 'package:flutter/material.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:legal_helper/screens/homescreen.dart';
import 'package:legal_helper/screens/mainScreen.dart';
import 'package:legal_helper/screens/splash_screen.dart';
import 'package:legal_helper/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'provider/bookmark_provider.dart';
import 'provider/theme_provider.dart';

void main() {
  print("app started");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookmarkProvider()..loadBookmarks(),
        ),

        ChangeNotifierProvider(create: (_) => ThemeProvider()..loadTheme()),
        
        ChangeNotifierProvider(create: (_) => LanguageProvider(),)
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          title: 'Yaathra Sahayi',

          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,

            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.background,
              foregroundColor: Colors.white,
              elevation: 0,
            ),

            cardColor: AppColors.card,
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,

            scaffoldBackgroundColor: const Color(0xff121212),

            cardColor: const Color(0xff1E1E1E),

            appBarTheme: const AppBarTheme(backgroundColor: Color(0xff121212)),
          ),

          themeMode: themeProvider.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,

          home: const SplashScreen(),
        );
      },
    );
  }
}
