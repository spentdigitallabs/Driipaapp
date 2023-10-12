import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/components/bg_gradient.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnBoarding()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: [
      BackgroundGradient(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/images/driipalogo.png'),
        const Text("it pays to interact",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700))
      ])),
      Image.asset('assets/images/splash_hidden.png',
          opacity: const AlwaysStoppedAnimation(.4))
    ]));
  }
}
