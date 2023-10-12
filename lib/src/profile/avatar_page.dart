import 'package:flutter/material.dart';

import '../../core/components/bg_gradient.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: BackgroundGradient(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  Container(
                      width: double.infinity,
                      height: 230,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF320A67)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                                leading: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_back,
                                        color: Colors.white)),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                dense: true,
                                visualDensity: VisualDensity.compact,
                                title: const Text("Change Avatar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600))),
                            const Text(
                                "Select an avatar for your profile. You can redeem more avatars from the ......",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey)),
                            ListTile(
                                title: const Text("Custom Avatar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                                isThreeLine: true,
                                subtitle: Align(
                                    alignment: Alignment.centerLeft,
                                    child: CircleAvatar(
                                        child: Image.asset(
                                            "assets/images/profile.png"))),
                                horizontalTitleGap: 80,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade800,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 33, 8, 146),
                                                width: 1))),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const AvatarPage()));
                                    },
                                    child: const Text('Upload'))),
                            TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.keyboard_arrow_down),
                                label: const Text("NFTs & Gallery"))
                          ])),
                  SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.42,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 16.0,
                                      mainAxisSpacing: 10.0),
                              itemCount: 16,
                              itemBuilder: (context, index) {
                                return Center(
                                    child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.transparent,
                                        child: Image.asset(
                                            'assets/images/profile.png')));
                              }))),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: const BorderSide(
                                      color: Color(0xFF2F1EA9), // Border color
                                      width: 1.0))),
                          child: const Text("Save")))
                ]))));
  }
}
