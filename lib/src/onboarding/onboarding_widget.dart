import 'package:flutter/material.dart';
import '../../core/models.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onboardingData,
  });

  final OnboardingData onboardingData;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(alignment: Alignment.bottomCenter, children: [
        Image.asset(onboardingData.image,
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity),
        Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                  0.0,
                  0.7708
                ],
                    colors: [
                  Colors.transparent,
                  Color.fromARGB(255, 27, 1, 61)
                ])))
      ]),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(onboardingData.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(onboardingData.description,
                    style: const TextStyle(
                        color: Colors.white, height: 1.2, fontSize: 15)))
          ]))
    ]);
  }
}
