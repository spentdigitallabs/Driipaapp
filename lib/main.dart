import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  final String authKey = await getKey();
  runApp(MyApp(settingsController: settingsController, authKey: authKey));
}

Future<String> getKey() async {
  final prefs = await SharedPreferences.getInstance();
  final privateKey = prefs.getString('privateKey') ?? '';
  return privateKey;
}
  