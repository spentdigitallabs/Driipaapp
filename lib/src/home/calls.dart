import 'package:driipa_reloaded/core/models.dart';
import 'package:flutter/material.dart';

class Calls extends StatelessWidget {
  Calls({super.key});

  final List<CallModel> calls = [
    CallModel(
        image: "assets/images/profile2.png",
        title: "Robert Fox",
        icon: Icons.arrow_outward_outlined,
        duration: DateTime.now()),
    CallModel(
        image: "assets/images/profile2.png",
        title: "Robert Fox",
        icon: Icons.arrow_outward_outlined,
        duration: DateTime.now()),
    CallModel(
        image: "assets/images/profile2.png",
        title: "Robert Fox",
        icon: Icons.arrow_outward_outlined,
        duration: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: calls
            .map((chat) => ListTile(
                leading: Image.asset(chat.image),
                dense: false,
                horizontalTitleGap: 20,
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
                          Icon(chat.icon)
                        ])),
                subtitle: Text("${chat.duration}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 12, color: Colors.grey))))
            .toList());
  }
}
