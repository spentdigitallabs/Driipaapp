import 'package:flutter/material.dart';

import 'dart:collection';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'dart:async';

import 'package:web3auth_flutter/web3auth_flutter.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../../core/components/bg_gradient.dart';
import '../wallet/wallet_confirm.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static const routeName = '/signin';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _result = '';
  bool logoutVisible = false;
  String rpcUrl = 'https://rpc.ankr.com/eth_goerli';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final themeMap = HashMap<String, String>();
    themeMap['primary'] = "#229954";

    Uri redirectUrl;
    if (Platform.isAndroid) {
      redirectUrl = Uri.parse(
          'torusapp://org.torusresearch.flutter.web3authexample/auth');
    } else if (Platform.isIOS) {
      redirectUrl = Uri.parse('com.web3auth.flutter.driipa://openlogin');
    } else {
      throw UnKnownException('Unknown platform');
    }

    await Web3AuthFlutter.init(Web3AuthOptions(
        clientId:
            'BHZPoRIHdrfrdXj5E8G5Y72LGnh7L8UFuM8O0KrZSOs4T8lgiZnebB5Oc6cbgYSo3qSz7WBZXIs8fs6jgZqFFgw',
        network: Network.testnet,
        redirectUrl: redirectUrl,
        whiteLabel:
            WhiteLabelData(dark: true, name: "Driipa", theme: themeMap)));

    await Web3AuthFlutter.initialize();

    final String res = await Web3AuthFlutter.getPrivKey();
    print(res);
    if (res.isNotEmpty) {
      setState(() {
        logoutVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundGradient(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white)),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Image.asset('assets/images/driipalogo.png'))
                      ])),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              margin: const EdgeInsets.only(top: 80),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF1B1548),
                                        Color.fromRGBO(39, 11, 249, 0.0)
                                      ]),
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 0.20),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 25.0),
                                  child: Column(children: [
                                    const Text("Welcome Back!",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500)),
                                    const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                            "Please sign in your Drippa account",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.20),
                                                fontSize: 16))),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                            height: 2,
                                            thickness: 1,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.20))),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 4.0),
                                        child: Text(
                                            "We do not store any data related to your social logins.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.20),
                                                fontSize: 14))),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Text("Continue with",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.20),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500))),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                  onTap: _login(
                                                      _withFacebook, context),
                                                  child: Image.asset(
                                                      'assets/images/facebook.png')),
                                              InkWell(
                                                  onTap: _login(
                                                      _withTwitter, context),
                                                  child: Image.asset(
                                                      'assets/images/twitter.png')),
                                              InkWell(
                                                  onTap: _login(
                                                      _withDiscord, context),
                                                  child: Image.asset(
                                                      'assets/images/discord.png')),
                                              Image.asset(
                                                  'assets/images/more.png')
                                            ])),
                                    const Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 25),
                                            child: Text("View more options",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Color(0xFF00418E),
                                                    fontSize: 14)))),
                                    Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: ElevatedButton(
                                            onPressed: _login(
                                                () => _withGoogle(), context),
                                            style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                textStyle: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                backgroundColor:
                                                    const Color(0xFF2F1EA9)),
                                            child: const Text(
                                                "Connect with Gmail"))),
                                    const Text("Continue with",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                textStyle: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    side: const BorderSide(
                                                        color: Colors
                                                            .white, // Border color
                                                        width: 1.0))),
                                            child: const Text(
                                                "Connect with wallet")))
                                  ])))))
                ]))));
  }

  VoidCallback _privKey(Future<String?> Function() method) {
    return () async {
      try {
        final String response = await Web3AuthFlutter.getPrivKey();
        setState(() {
          _result = response;
          logoutVisible = true;
        });
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
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

  Future<String?> _getPrivKey() {
    return Web3AuthFlutter.getPrivKey();
  }

  Future<TorusUserInfo> _getUserInfo() {
    return Web3AuthFlutter.getUserInfo();
  }

  VoidCallback _login(
      Future<Web3AuthResponse> Function() method, BuildContext context) {
    return () async {
      try {
        final Web3AuthResponse response = await method();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('privateKey', response.privKey.toString());
        setState(() {
          _result = response.toString();
          logoutVisible = true;
        });
        final userInfo = await _userInfo();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ConfirmWallet(userInfo: userInfo!)));
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }

  VoidCallback _logout() {
    return () async {
      try {
        setState(() {
          _result = '';
          logoutVisible = false;
        });
        await Web3AuthFlutter.logout();
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }

  Future<Web3AuthResponse> _withGoogle() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.google,
      mfaLevel: MFALevel.DEFAULT,
    ));
  }

  Future<Web3AuthResponse> _withFacebook() {
    return Web3AuthFlutter.login(LoginParams(loginProvider: Provider.facebook));
  }

  Future<Web3AuthResponse> _withTwitter() {
    return Web3AuthFlutter.login(LoginParams(loginProvider: Provider.twitter));
  }

  Future<Web3AuthResponse> _withDiscord() {
    return Web3AuthFlutter.login(LoginParams(loginProvider: Provider.discord));
  }

  Future<String> _getAddress() async {
    final prefs = await SharedPreferences.getInstance();
    final privateKey = prefs.getString('privateKey') ?? '0';
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    debugPrint("Account, ${address.hexEip55}");
    setState(() {
      _result = address.hexEip55.toString();
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
      _result = balance.toString();
    });
    return balance;
  }
}
