import 'package:driipa_reloaded/core/components/bg_gradient.dart';
import 'package:driipa_reloaded/src/profile/avatar_page.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent, title: const Text("Profile")),
        body: BackgroundGradient(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("About me",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600)),
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.7,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFF320A67)),
                          child: Column(children: [
                            ListTile(
                                leading: const Text("Avatar",
                                    style: TextStyle(color: Colors.blue)),
                                isThreeLine: true,
                                title: CircleAvatar(
                                    child: Image.asset(
                                        "assets/images/profile.png")),
                                horizontalTitleGap: 180,
                                subtitle: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
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
                                    child: const Text('Change'))),
                            const ListTile(
                                contentPadding: EdgeInsets.only(
                                    left: 30, right: 30, top: 20),
                                leading: Padding(
                                    padding: EdgeInsets.only(right: 80.0),
                                    child: Text("Public display name",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))),
                                visualDensity: VisualDensity.compact,
                                title: Text("Spirit",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Colors.blue, size: 18)),
                            const ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                leading: Padding(
                                    padding: EdgeInsets.only(right: 130.0),
                                    child: Text("Username",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))),
                                visualDensity: VisualDensity.compact,
                                title: Text("@daniseeth",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Colors.blue, size: 18)),
                            const ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                leading: Padding(
                                  padding: EdgeInsets.only(right: 150.0),
                                  child: Text("Birthday",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ),
                                visualDensity: VisualDensity.compact,
                                title: Text("Oct 2 97",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Colors.blue, size: 18)),
                            Padding(
                                padding: const EdgeInsets.only(top: 60),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Change Account security settings.",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text("Here",
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.indigoAccent)))
                                    ]))
                          ]))
                    ]))));
  }
}
