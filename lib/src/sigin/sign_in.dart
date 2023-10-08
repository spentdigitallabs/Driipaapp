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
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.white)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Image.asset('assets/images/driipalogo.png'))
                  ]),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(top: 80),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: const Color.fromRGBO(255, 255, 255, 0.20),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50)),
                ))
              ]),
            )));
  }
}
