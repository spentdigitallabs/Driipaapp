import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Color(0xFF320A67)])),
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
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.20),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              child: Column(children: [
                                const Text("Welcome Back!",
                                    style: TextStyle(
                                        color:
                                            Colors.white,
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
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
                                          Image.asset(
                                              'assets/images/facebook.png'),
                                          Image.asset(
                                              'assets/images/twitter.png'),
                                          Image.asset(
                                              'assets/images/discord.png'),
                                          Image.asset('assets/images/more.png')
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
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          backgroundColor:
                                              const Color(0xFF2F1EA9),
                                        ),
                                        child:
                                            const Text("Connect with Gmail"))),
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
                                            backgroundColor: Colors.transparent,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20),
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                side: const BorderSide(
                                                    color: Colors
                                                        .white, // Border color
                                                    width: 1.0))),
                                        child:
                                            const Text("Connect with wallet")))
                              ]))))
                ]))));
  }
}
