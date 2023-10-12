import 'package:flutter/material.dart';

class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData(
      {required this.image, required this.title, required this.description});
}

class NavItems {
  final IconData icon;
  final String title;

  NavItems({required this.icon, required this.title});
}

class Chat {
  final String image;
  final String title;
  final String message;
  final String duration;
  final bool read;

  Chat(
      {required this.image,
      required this.message,
      required this.duration,
      required this.read,
      required this.title});
}
