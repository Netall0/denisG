import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profff/splash/widget/onboarding_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: use_build_context_synchronously
    Future.delayed(Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder:(context) =>   OnboardingScreens())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
