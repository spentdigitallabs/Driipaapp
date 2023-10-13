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

class ChatModel {
  final String image;
  final String title;
  final String message;
  final String duration;
  final bool read;

  ChatModel(
      {required this.image,
      required this.message,
      required this.duration,
      required this.read,
      required this.title});
}

class CommunityModel {
  final String image;
  final String title;
  final String bio;
  final String duration;

  CommunityModel(
      {required this.image,
      required this.title,
      required this.bio,
      required this.duration});
}

class CallModel {
  final String image;
  final String title;
  final IconData icon;
  final DateTime duration;

  CallModel(
      {required this.image,
      required this.title,
      required this.icon,
      required this.duration});
}
