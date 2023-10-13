import 'package:driipa_reloaded/core/models.dart';
import 'package:flutter/material.dart';

class Communities extends StatelessWidget {
  Communities({super.key});

  final List<CommunityModel> communities = [
    CommunityModel(
        image: "assets/images/tesla.png",
        title: "Tesla Official",
        bio: 'haha oh man',
        duration: "12m"),
    CommunityModel(
        image: "assets/images/tesla.png",
        title: "Tesla Official",
        bio: 'haha oh man',
        duration: "12m"),
    CommunityModel(
        image: "assets/images/tesla.png",
        title: "Tesla Official",
        bio: 'haha oh man',
        duration: "12m")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: communities
            .map((chat) => ListTile(
                leading: Image.asset(chat.image, width: 40, height: 40),
                dense: false,
                horizontalTitleGap: 10,
                isThreeLine: true,
                title: Text(chat.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
                trailing: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(chat.duration,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey))
                        ])),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(chat.bio,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                      SizedBox(
                          width: double.infinity,
                          child: Row(children: [
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFEEBC8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.brown,
                                        fontWeight: FontWeight.w500),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: const BorderSide(
                                            color: Color(
                                                0xFF2F1EA9), // Border color
                                            width: 1.0))),
                                child: const Text("Question",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.brown,
                                        fontWeight: FontWeight.w500))),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFC6F6D5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: const BorderSide(
                                                color: Color(
                                                    0xFF2F1EA9), // Border color
                                                width: 1.0))),
                                    child: const Text("Question",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.lightGreen,
                                            fontWeight: FontWeight.w500))))
                          ]))
                    ])))
            .toList());
  }
}
