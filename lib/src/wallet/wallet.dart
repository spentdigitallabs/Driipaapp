import 'package:flutter/material.dart';

import '../../core/components/bg_gradient.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundGradient(
            child: Padding(
                padding: const EdgeInsets.only(top: 50, right: 5, left: 5),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // IconButton(
                            //     onPressed: () => Navigator.of(context).pop(),
                            //     icon: const Icon(Icons.arrow_back,
                            //         color: Colors.white)),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child:
                                    Image.asset('assets/images/driipalogo.png'))
                          ])),
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          width: double.infinity,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Deposit DREP',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                      Center(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0, bottom: 10),
                                              child: Image.asset(
                                                'assets/images/qrcode.png',
                                                width: 130,
                                                height: 130,
                                                fit: BoxFit.cover,
                                              ))),
                                      const Center(
                                          child: Text(
                                              'Send only DREP to this deposit address.',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14))),
                                      const Padding(
                                          padding: EdgeInsets.only(
                                              top: 30, bottom: 10),
                                          child: Divider(
                                              height: 2,
                                              thickness: 1,
                                              color: Colors.white)),
                                      const SizedBox(
                                          width: 170,
                                          child: ListTile(
                                              title: Text(
                                                  'DREP Deposit Addresss',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13)),
                                              horizontalTitleGap: 0,
                                              contentPadding: EdgeInsets.zero,
                                              trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 14,
                                                  color: Colors.grey))),
                                      ListTile(
                                          title: const Text(
                                              '98fzs4537854321x7654908765k453456e78676734456c54678',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14)),
                                          contentPadding: EdgeInsets.zero,
                                          trailing: IconButton(
                                              icon: const Icon(Icons.copy,
                                                  size: 16, color: Colors.grey),
                                              onPressed: () {})),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          width: double.infinity,
                                          height: 100,
                                          child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ListTile(
                                                    title: Text(
                                                        'Minimum deposit',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14)),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    minVerticalPadding: 0,
                                                    dense: true,
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    trailing: Text(
                                                        '0.00000001 DREP',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14))),
                                                ListTile(
                                                    title: Text(
                                                        'Contract Information',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14)),
                                                    minVerticalPadding: 0,
                                                    dense: true,
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    trailing: Text('***6fre4',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14)))
                                              ])),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 5),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors.blue
                                                                        .shade800,
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        25,
                                                                    vertical:
                                                                        20),
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(30.0),
                                                                    side: const BorderSide(
                                                                        color: Colors.white, // Border color
                                                                        width: 1.0))),
                                                        child: const Text("Save as Image"))),
                                                ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        25,
                                                                    vertical:
                                                                        20),
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0),
                                                                    side:
                                                                        const BorderSide(
                                                                            color: Color(
                                                                                0xFF2F1EA9), // Border color
                                                                            width:
                                                                                1.0))),
                                                    child: const Text(
                                                        "Export private key"))
                                              ]))
                                    ])
                              ))))
                ]))));
  }
}
