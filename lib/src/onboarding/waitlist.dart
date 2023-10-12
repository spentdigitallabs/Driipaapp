import 'package:driipa_reloaded/core/components/bg_gradient.dart';
import 'package:driipa_reloaded/src/home/homepage.dart';
import 'package:flutter/material.dart';

class WaitListPage extends StatelessWidget {
  const WaitListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("You have join the Waitlist",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.none)),
              Container(
                  width: double.infinity,
                  height: 80,
                  margin: const EdgeInsets.only(top: 20, bottom: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Color(0xFF320A67)])),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: const Center(
                      child: Text(
                          "You can have fun and earn continuously by Daily Login, Task and referrals.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none)))),
              const Text("99996 Currents users",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.none)),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset("assets/images/waitlist.png")),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => const HomePage()),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                  color: Color(0xFF2F1EA9), // Border color
                                  width: 1.0))),
                      child: const Text("Continue")))
            ])));
  }
}
