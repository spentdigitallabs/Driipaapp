import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'package:web3dart/web3dart.dart';

import '../../core/components/bg_gradient.dart';
import '../../core/models.dart';
import 'chats.dart';
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
    const ChatsPage(),
    const WalletPage(),
  ];
  TorusUserInfo? user;
  String rpcUrl = 'https://rpc.ankr.com/eth_goerli';
  String _walletAddress = '';
  String _walletBalance = '';

  int _selectedIndex = 3;

  void _onItemTapped(int index) {
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
  void initState() {
    _getAddress();
    _getBalance();
    super.initState();
    _userInfo().then((data) {
      setState(() {
        user = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            elevation: 10,
            backgroundColor: const Color.fromARGB(255, 22, 2, 55),
            leading: InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ProfilePage(user: user))),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: FadeInImage(
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                            imageErrorBuilder: (context, error, stackTrace) =>
                                Container(
                                    height: 80,
                                    width: 80,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle),
                                    child: const Icon(Icons.perm_identity,
                                        color: Colors.white, size: 40)),
                            placeholder:
                                const AssetImage("assets/images/profile.png"),
                            image: NetworkImage(user?.profileImage ??
                                'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp'))))),
            actions: [
              IconButton(
                  onPressed: () => setState(() {
                        visible = !visible;
                      }),
                  icon: Icon(visible ? Icons.visibility_off : Icons.visibility))
            ],
            title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(_walletAddress,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 10)),
              Text(user?.email ?? '',
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 11)),
              Row(children: [
                Text(visible ? _walletBalance : '*****  SOL',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700)),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(visible ? '\$0' : '\$****',
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

  Future<String> _getAddress() async {
    final prefs = await SharedPreferences.getInstance();
    final privateKey = prefs.getString('privateKey') ?? '0';
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    debugPrint("Account, ${address.hexEip55}");
    setState(() {
      _walletAddress = address.hexEip55.toString();
    });
    return address.hexEip55;
  }

  Future<EtherAmount> _getBalance() async {
    final prefs = await SharedPreferences.getInstance();
    final privateKey = prefs.getString('privateKey') ?? '0';

    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    final balance = await client.getBalance(address);
    debugPrint(balance.toString());
    setState(() {
      _walletBalance = balance.toString();
    });
    return balance;
  }

  Future<TorusUserInfo?> _userInfo() async {
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
