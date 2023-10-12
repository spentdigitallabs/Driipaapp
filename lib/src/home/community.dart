import 'package:driipa_reloaded/core/models.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final List<String> stories = [
    "My story",
    "Terry.drp",
    "brain.dp",
    " prince.dp",
    "Berbard.drp",
    "Praise.dp"
  ];

  final List<Chat> chats = [
    Chat(
        image: 'assets/images/chaticon.png',
        message: 'AEPrince: Hey Been a while having ...',
        duration: "10m",
        read: false,
        title: 'Driipa Community Update'),
    Chat(
        image: 'assets/images/chaticon.png',
        message: 'AEPrince: Hey Been a while having ...',
        duration: "10m",
        read: true,
        title: 'Driipa Community Update'),
    Chat(
        image: 'assets/images/chaticon.png',
        message: 'AEPrince: Hey Been a while having ...',
        duration: "10m",
        read: true,
        title: 'Driipa Community Update'),
    Chat(
        image: 'assets/images/chaticon.png',
        message: 'AEPrince: Hey Been a while having ...',
        duration: "10m",
        read: false,
        title: 'Driipa Community Update'),
    Chat(
        image: 'assets/images/chaticon.png',
        message: 'AEPrince: Hey Been a while having ...',
        duration: "10m",
        read: false,
        title: 'Driipa Community Update'),
    Chat(
        image: 'assets/images/chaticon.png',
        message: 'AEPrince: Hey Been a while having ...',
        duration: "10m",
        read: true,
        title: 'Driipa Community Update'),
    Chat(
        image: 'assets/images/chaticon.png',
        message: 'AEPrince: Hey Been a while having ...',
        duration: "10m",
        read: false,
        title: 'Driipa Community Update'),
    Chat(
        image: 'assets/images/chaticon.png',
        message: 'AEPrince: Hey Been a while having ...',
        duration: "10m",
        read: true,
        title: 'Driipa Community Update'),
    Chat(
        image: 'assets/images/chaticon.png',
        message: 'AEPrince: Hey Been a while having ...',
        duration: "10m",
        read: false,
        title: 'Driipa Community Update'),
    Chat(
        image: 'assets/images/chaticon.png',
        message: 'AEPrince: Hey Been a while having ...',
        duration: "10m",
        read: false,
        title: 'Driipa Community Update'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 6, right: 6),
            child: Column(children: [
              Row(
                  children: stories
                      .map((story) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(children: [
                            CircleAvatar(
                              child: Image.asset("assets/images/profile.png"),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(story,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey)))
                          ])))
                      .toList()),
              Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 40,
                  child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_2_outlined,
                              color: Colors.grey),
                          suffixIcon: const Icon(Icons.filter_alt_outlined,
                              color: Colors.blueAccent),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          label: const Text('Search direct messages',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13)),
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 13),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      keyboardType: TextInputType.emailAddress)),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Communities',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    Text('Chats',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    Text('Calls',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12, color: Colors.white))
                  ]),
              Expanded(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                          children: chats
                              .map((chat) => ListTile(
                                  leading: Image.asset(chat.image),
                                  dense: false,
                                  horizontalTitleGap: 0,
                                  title: Text(chat.title,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  trailing: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 9.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: chat.read
                                                        ? Colors.transparent
                                                        : Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50))),
                                            Text(chat.duration,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey))
                                          ])),
                                  subtitle: Text(chat.message,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey))))
                              .toList())))
            ])));
  }
}
