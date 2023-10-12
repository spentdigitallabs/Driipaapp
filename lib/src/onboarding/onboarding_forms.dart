import 'package:driipa_reloaded/src/onboarding/waitlist.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../core/components/bg_gradient.dart';
import '../profile/profile_image.dart';

class OnboardingForms extends StatefulWidget {
  const OnboardingForms({super.key});

  @override
  State<OnboardingForms> createState() => _OnboardingFormsState();
}

class _OnboardingFormsState extends State<OnboardingForms> {
  String dob = '2012-12-12';
  final dobController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    setState(() {
      dobController.text = ('2012-12-30');
      try {
        DateTime.parse('2012-12-12').runtimeType == DateTime;
      } catch (e) {
        dobController.text = '2012-12-12';
      }
    });

    return Scaffold(
        resizeToAvoidBottomInset: true,
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
                      child: SingleChildScrollView(
                          child: Container(
                              margin: const EdgeInsets.only(top: 40),
                              width: double.infinity,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Just few steps...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                            height: 180,
                                            child: Stack(children: [
                                              Container(
                                                  width: double.infinity,
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 20),
                                                  height: 100,
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      20)),
                                                      color:
                                                          Color(0xFF150F3F))),
                                              Positioned(
                                                  top: 20,
                                                  right: 20,
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons
                                                            .add_circle_outlined,
                                                        color: Colors.white,
                                                      ))),
                                              Positioned(
                                                  top: 80,
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  child: SettingsProfileImage(
                                                      avatarUrl:
                                                          'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp',
                                                      onChange: () {}))
                                            ])),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: TextFormField(
                                                decoration: InputDecoration(
                                                    prefixIcon: const Icon(Icons.person_2_outlined,
                                                        color: Color.fromARGB(
                                                            73, 33, 149, 243)),
                                                    hintText: '@Daniseeth',
                                                    fillColor: Colors.white,
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(
                                                            20.0),
                                                        borderSide: const BorderSide(
                                                            color:
                                                                Colors.blue)),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(15.0),
                                                        borderSide: const BorderSide(color: Color.fromARGB(73, 33, 149, 243), width: 2.0)),
                                                    label: const Text('Driiptag', style: TextStyle(color: Color.fromARGB(73, 33, 149, 243), fontSize: 13)),
                                                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                keyboardType: TextInputType.emailAddress)),
                                        InkWell(
                                            onTap: () => showModalBottomSheet(
                                                context: context,
                                                builder: (context) => Container(
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius.circular(
                                                                    20)),
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment.bottomCenter,
                                                            colors: [
                                                              Colors.black,
                                                              Color(0xFF320A67)
                                                            ])),
                                                    width: double.infinity,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.35,
                                                    child: Column(children: [
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                        foregroundColor:
                                                                            Colors
                                                                                .white),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: const Text(
                                                                    'Cancel')),
                                                            TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                        foregroundColor:
                                                                            Colors
                                                                                .white),
                                                                child:
                                                                    const Text(
                                                                        'Done'),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                })
                                                          ]),
                                                      Expanded(
                                                          child:
                                                              ScrollDatePicker(
                                                                  selectedDate:
                                                                      DateTime.parse(
                                                                          dobController
                                                                              .text),
                                                                  locale:
                                                                      const Locale(
                                                                          'en'),
                                                                  maximumDate:
                                                                      DateTime
                                                                          .now(),
                                                                  options: const DatePickerOptions(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      itemExtent:
                                                                          40),
                                                                  onDateTimeChanged:
                                                                      (DateTime
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      dob = value
                                                                          .toString();
                                                                    });
                                                                  }))
                                                    ])),
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top: Radius.circular(20)))),
                                            child: Container(
                                                margin: const EdgeInsets.symmetric(vertical: 10),
                                                height: 55,
                                                decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(73, 33, 149, 243), width: 2), borderRadius: BorderRadius.circular(10)),
                                                padding: const EdgeInsets.only(left: 20, right: 16),
                                                child: Column(children: [
                                                  const Row(children: [
                                                    Icon(Icons.calendar_month,
                                                        color: Color.fromARGB(
                                                            73, 33, 149, 243)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: Text(
                                                            "Date of birth",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color
                                                                    .fromARGB(
                                                                        73,
                                                                        33,
                                                                        149,
                                                                        243))))
                                                  ]),
                                                  Row(children: [
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 20.0),
                                                        child: Row(children: [
                                                          Text(
                                                              "${DateTime.parse(dobController.text).day}",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey)),
                                                          const Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color: Color
                                                                  .fromARGB(
                                                                      73,
                                                                      33,
                                                                      149,
                                                                      243))
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    20.0),
                                                        child: Row(children: [
                                                          Text(
                                                              "${DateTime.parse(dobController.text).month}",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey)),
                                                          const Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color: Color
                                                                  .fromARGB(
                                                                      73,
                                                                      33,
                                                                      149,
                                                                      243))
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    20.0),
                                                        child: Row(children: [
                                                          Text(
                                                              "${DateTime.parse(dobController.text).year}",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey)),
                                                          const Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color: Color
                                                                  .fromARGB(
                                                                      73,
                                                                      33,
                                                                      149,
                                                                      243))
                                                        ]))
                                                  ])
                                                ]))),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: TextFormField(
                                                decoration: InputDecoration(
                                                    prefixIcon: const Icon(Icons.person_search_sharp,
                                                        color: Color.fromARGB(
                                                            73, 33, 149, 243)),
                                                    hintText: '@Daniseeth',
                                                    fillColor: Colors.white,
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(
                                                            20.0),
                                                        borderSide: const BorderSide(
                                                            color:
                                                                Colors.blue)),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(15.0),
                                                        borderSide: const BorderSide(color: Color.fromARGB(73, 33, 149, 243), width: 2.0)),
                                                    label: const Text('Public display name', style: TextStyle(color: Color.fromARGB(73, 33, 149, 243), fontSize: 13)),
                                                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                keyboardType: TextInputType.emailAddress)),
                                        Container(
                                            width: double.infinity,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 30),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              const WaitListPage()));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 20),
                                                    textStyle: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                            side:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xFF2F1EA9), // Border color
                                                                    width:
                                                                        1.0))),
                                                child: const Text("Continue")))
                                      ])))))
                ]))));
  }
}
