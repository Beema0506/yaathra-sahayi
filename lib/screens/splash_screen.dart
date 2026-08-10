import 'package:flutter/material.dart';
import 'package:legal_helper/screens/mainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  late AnimationController _controller;

  late Animation<double> _logoFade;
  late Animation<double> _titleFade;
  late Animation<double> _taglineFade;
  late Animation<double> _loadingFade;
  late Animation<double> _scaleAnimation;

  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _logoFade = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.00, 0.30),
    );
    _titleFade = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.45, 0.60),
    );
    _taglineFade = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.65, 0.85),
    );
    _loadingFade = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.75, 1.0),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    });

    _controller.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff0F4D38), Color(0xff1F6B4F), Color(0xff2F7D5D)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),

              FadeTransition(
                opacity: _logoFade,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(
                    "assets/images/splash_logo.png",
                    height: 150,
                    width: 150,
                  ),
                ),
              ),

              // const SizedBox(height: 12),
              FadeTransition(
                opacity: _titleFade,
                child: const Text(
                  "Yaathra Sahayi",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              FadeTransition(
                opacity: _taglineFade,
                child: Text(
                  "Know the Law.\nDrive with Confidence.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ),

              const Spacer(),

              FadeTransition(
                opacity: _loadingFade,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Color(0xffCDE8B7),
                        strokeWidth: 2.2,
                      ),
                    ),
                    SizedBox(width: 14),
                    Text(
                      'Loading ... ',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
