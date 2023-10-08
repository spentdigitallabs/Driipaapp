import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../src/onboarding/onboarding_widget.dart';
import '../../src/sigin/sign_in.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<OnboardingData> onboardingList = [
    OnboardingData(
        image: "assets/images/user_with_phone.png",
        title: "Chat & Post",
        description:
            "Hey {Name}, Welcome to Driipa, the ultimate everything app! Engage, collaborate, and get rewarded with Driipcoin by sharing ideas, jokes, pictures, news, and more with fellow creators in real-time."),
    OnboardingData(
        image: "assets/images/wallet.png",
        title: "Wallet",
        description:
            "Congratulations! You own 4,088.74 Driipcoin. Manage your crypto easily - buy, sell, send, receive, track spending history, and stay updated with altcoin prices, all within your Driipa wallet."),
    OnboardingData(
        image: "assets/images/shield.png",
        title: "Blockchain & Security",
        description:
            'Driipchain - a decentralized blockchain with smart contracts functionalities. Driipcoin,  native cryptocurrency, is earned through interactions: chatting, calling, driiping, and referring users on-chain. It can be used in many new ways.!" your data and privacy are completely owned and managed by you, not a third party.')
  ];

  final slideIndex = ValueNotifier<int>(0);
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const SignIn())),
              child: const Text('Skip',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600))),
        ),
        body: PageView.builder(
            itemCount: onboardingList.length,
            controller: controller,
            onPageChanged: (index) => slideIndex.value = index,
            itemBuilder: (context, index) {
              return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Color(0xFF320A67)])),
                  child:
                      OnboardingWidget(onboardingData: onboardingList[index]));
            }),
        bottomSheet: ValueListenableBuilder<int>(
            valueListenable: slideIndex,
            builder: (context, value, child) {
              return Container(
                  color: const Color(0xFF320A67),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                            children: List.generate(
                                3,
                                (index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    height: index == value ? 10.0 : 8.0,
                                    width: index == value ? 30.0 : 8.0,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(20))))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 22, horizontal: 20)),
                            onPressed: () {
                              if (value == 2) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => const SignIn()));
                              } else {
                                controller.animateToPage(value + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.linear);
                              }
                            },
                            child: const Icon(Icons.arrow_forward_ios,
                                size: 16, color: Color(0xFF320A67)))
                      ]));
            }));
  }
}
