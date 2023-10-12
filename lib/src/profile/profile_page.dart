import 'package:driipa_reloaded/src/profile/about_page.dart';
import 'package:driipa_reloaded/src/signin/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

import '../../core/components/bg_gradient.dart';
import 'profile_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

    void toggleSwitch(bool value) {
      if (isSwitched == false) {
        setState(() {
          isSwitched = true;
        });
      } else {
        setState(() {
          isSwitched = false;
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: BackgroundGradient(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(children: [
                  SizedBox(
                      height: 180,
                      child: Stack(children: [
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            height: 100,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                                color: Color(0xFF150F3F))),
                        Positioned(
                            top: 20,
                            right: 20,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add_circle_outlined,
                                    color: Colors.white))),
                        Positioned(
                            top: 80,
                            left: MediaQuery.of(context).size.width * 0.35,
                            child: SettingsProfileImage(
                                avatarUrl:
                                    'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp',
                                onChange: () {})),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color:
                                                Color.fromARGB(255, 33, 8, 146),
                                            width: 1))),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const AboutPage()));
                                },
                                icon: const Icon(Icons.edit, size: 18),
                                label: const Text('Edit')))
                      ])),
                  Container(
                      width: double.infinity,
                      height: 100,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFF320A67)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                                child: Center(
                                    child: Text('No new notification',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                119, 158, 158, 158))))),
                            const Divider(
                                thickness: 1,
                                height: 1,
                                color: Color.fromARGB(33, 158, 158, 158)),
                            TextButton(
                                onPressed: () {},
                                child: const Text('See All',
                                    style: TextStyle(color: Colors.blue)))
                          ])),
                  Container(
                      width: double.infinity,
                      height: 150,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFF320A67)),
                      child: Column(children: [
                        ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 30),
                            title: const Text("Dark Mode",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                            visualDensity: VisualDensity.compact,
                            trailing: Switch(
                                value: isSwitched,
                                onChanged: toggleSwitch,
                                activeColor: Colors.white,
                                activeTrackColor: Colors.blue,
                                inactiveThumbColor: Colors.black54)),
                        const Divider(
                            thickness: 1,
                            height: 1,
                            color: Color.fromARGB(33, 158, 158, 158)),
                        const ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            leading: Padding(
                              padding: EdgeInsets.only(right: 130.0),
                              child: Text("Language",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                            visualDensity: VisualDensity.compact,
                            title: Text("English",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                            trailing: Icon(Icons.arrow_forward_ios,
                                color: Colors.blue, size: 18)),
                        const Divider(
                            thickness: 1,
                            height: 1,
                            color: Color.fromARGB(33, 158, 158, 158)),
                        const ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            visualDensity: VisualDensity.compact,
                            leading: Padding(
                              padding: EdgeInsets.only(right: 60.0),
                              child: Text("Default Currencies",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                            title: Text("USD & BTC",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                            trailing: Icon(Icons.arrow_forward_ios,
                                color: Colors.blue, size: 18))
                      ])),
                  Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFF320A67)),
                      child: ListTile(
                          onTap: () => handleLogout(context),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          title: const Text("Log Out",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          trailing:
                              const Icon(Icons.logout, color: Colors.blue)))
                ]))));
  }

  void handleLogout(BuildContext context) async {
    // Log out the user (assuming Web3AuthFlutter.logout() is asynchronous)
    Web3AuthFlutter.logout();

    // Clear preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate to the Sign In screen and remove all previous routes
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const SignIn(),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
