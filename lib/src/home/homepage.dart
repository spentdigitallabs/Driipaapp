import 'package:flutter/material.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

import '../../core/components/bg_gradient.dart';
import '../../core/models.dart';
import '../../src/home/community.dart';
import '../../src/home/dropz.dart';
import '../../src/home/feed.dart';
import '../../src/home/live.dart';
import '../../src/profile/profile_page.dart';
import '../../src/wallet/wallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<NavItems> navItems = [
    NavItems(icon: Icons.home_filled, title: "Feed"),
    NavItems(icon: Icons.local_movies_outlined, title: "Dropz"),
    NavItems(icon: Icons.live_tv_outlined, title: "Live"),
    NavItems(icon: Icons.chat, title: "Community"),
    NavItems(icon: Icons.wallet, title: "Wallet"),
  ];

  final List<Widget> pages = [
    const FeedPage(),
    const DropzPage(),
    const LivePage(),
    const CommunityPage(),
    const WalletPage(),
  ];

  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    print(index);
    if (index < 3) {
      setState(() {
        _selectedIndex = 3;
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            elevation: 10,
            backgroundColor: const Color.fromARGB(255, 22, 2, 55),
            leading: InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ProfilePage())),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset("assets/images/avatar.png"))),
            ),
            actions: [
              IconButton(
                  onPressed: () => setState(() {
                        visible = !visible;
                      }),
                  icon: Icon(visible ? Icons.visibility_off : Icons.visibility))
            ],
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('HN7cABqLq46Es1jh92dQQisAq662SmxELLLsHHe4YWrH',
                  textAlign: TextAlign.start, style: TextStyle(fontSize: 10)),
              const Text('@spentdigitallabs.dp',
                  textAlign: TextAlign.start, style: TextStyle(fontSize: 11)),
              Row(children: [
                Text(visible ? '12342 SOL' : '*****  SOL',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700)),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(visible ? '\$23' : '\$****',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700)))
              ])
            ])),
        body: BackgroundGradient(child: pages.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            fixedColor: Colors.grey,
            currentIndex: _selectedIndex, //New
            onTap: _onItemTapped,
            items: navItems
                .map((item) => BottomNavigationBarItem(
                      icon: Icon(item.icon, color: Colors.grey),
                      label: item.title,
                    ))
                .toList()));
  }

  Future<TorusUserInfo?> _userInfo(
      Future<TorusUserInfo> Function() method) async {
    try {
      final TorusUserInfo response = await Web3AuthFlutter.getUserInfo();
      return response;
    } on UserCancelledException {
      print("User cancelled.");
    } on UnKnownException {
      print("Unknown exception occurred");
    }
    return null;
  }
}
