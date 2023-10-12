import 'package:driipa_reloaded/src/onboarding/onboarding_forms.dart';
import 'package:flutter/material.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import '../../core/components/bg_gradient.dart';

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'dart:async';

class ConfirmWallet extends StatefulWidget {
  const ConfirmWallet({super.key, required this.userInfo});

  final TorusUserInfo userInfo;

  @override
  State<ConfirmWallet> createState() => _ConfirmWalletState();
}

class _ConfirmWalletState extends State<ConfirmWallet> {
  String _walletAddress = '';
  String _walletBalance = '';
  TorusUserInfo? user;
  String rpcUrl = 'https://rpc.ankr.com/eth_goerli';

  @override
  void initState() {
    _getAddress();
    _getBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundGradient(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
                child: Column(children: [
                  Center(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Image.asset('assets/images/driipalogo.png'))),
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(top: 40),
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
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.20),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: double.infinity,
                                        child: Stack(children: [
                                          Positioned(
                                              top: 0,
                                              right: 0,
                                              child: IconButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20),
                                                  icon: const Icon(Icons.close,
                                                      color: Colors.white,
                                                      size: 20))),
                                          Center(
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: FadeInImage(
                                                      fit: BoxFit.cover,
                                                      height: 80,
                                                      width: 80,
                                                      imageErrorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Container(
                                                              height: 80,
                                                              width: 80,
                                                              padding:
                                                                  const EdgeInsets.symmetric(
                                                                      vertical:
                                                                          10,
                                                                      horizontal:
                                                                          20),
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: const Icon(
                                                                  Icons.perm_identity,
                                                                  color: Colors.white,
                                                                  size: 40)),
                                                      placeholder: const AssetImage("assets/images/profile.png"),
                                                      image: NetworkImage(widget.userInfo.profileImage ?? ''))))
                                        ])),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, bottom: 10),
                                        child: Image.asset(
                                            'assets/images/qrcode.png')),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3,
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Row(children: [
                                                Image.asset(
                                                    "assets/images/money.png"),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Text(_walletBalance,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white)))
                                              ])),
                                          TextButton.icon(
                                              onPressed: () {},
                                              label: const Text(
                                                'Deposit',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                              icon: const Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.white))
                                        ]),
                                    ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 30),
                                        title: const Text(
                                            "you may need to deposit some tokens to be able to process some transactions",
                                            style: TextStyle(
                                                color: Colors.yellow,
                                                fontSize: 14),
                                            textAlign: TextAlign.center),
                                        trailing: Image.asset(
                                            "assets/images/question.png")),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: const Icon(Icons.copy),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10,
                                                      horizontal: 20),
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
                                              label: Text(
                                                  "${_walletAddress.substring(0, 6)}...${_walletAddress.substring(_walletAddress.length - 6)}")),
                                          Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10.0),
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              const Color.fromRGBO(
                                                                  64, 62, 75, 0.74),
                                                          textStyle: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight
                                                                  .w500),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          30.0),
                                                                  side:
                                                                      const BorderSide(
                                                                          color: Colors
                                                                              .white, // Border color
                                                                          width:
                                                                              1.0))),
                                                  child: const Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical: 8.0),
                                                      child: Icon(Icons.share,
                                                          color: Colors.white))))
                                        ]),
                                    Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
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
                                                        color: Color(
                                                            0xFF2F1EA9), // Border color
                                                        width: 1.0))),
                                            child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "Open Blockchain Explorer"),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.0),
                                                      child: Icon(
                                                          Icons.arrow_forward))
                                                ]))),
                                    Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
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
                                                        color: Color(
                                                            0xFF2F1EA9), // Border color
                                                        width: 1.0))),
                                            child: const Text(
                                                "Export private key"))),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          const OnboardingForms()));
                                            },
                                            style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30)),
                                            child: const Text("Continue",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16))))
                                  ]))))
                ]))));
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
}
