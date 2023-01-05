import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 238, 231, 231),
            body: (Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 370,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 238, 231, 231)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 40,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 57, 92, 220)),
                              child: IconButton(
                                padding: const EdgeInsets.fromLTRB(1, 1, 1, 2),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: 700,
                      width: 370,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                width: 320,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Settings',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16, fontFamily: 'Gilroy-Black'),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(1, 1, 275, 1),
                                    width: 150,
                                    height: 2,
                                    color:
                                        const Color.fromARGB(255, 86, 137, 255),
                                  ),
                                ])),
                            Container(
                              width: 330,
                              height: 400,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      // ignore: sized_box_for_whitespace
                                      Container(
                                        width: 320,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('Language',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16, fontFamily: 'Gilroy-Black')),
                                            SizedBox(
                                              width: 130,
                                            ),
                                            Text('English',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 86, 137, 255), fontFamily: 'Gilroy-Black')),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      // ignore: sized_box_for_whitespace
                                      Container(
                                        width: 320,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('Vibration',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16, fontFamily: 'Gilroy-Black')),
                                            SizedBox(
                                              width: 130,
                                            ),
                                            Text('On',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 86, 137, 255), fontFamily: 'Gilroy-Black')),
                                                        SizedBox(width: 15,),
                                                        Text('Off',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Color.fromARGB(255, 238, 231, 231), fontFamily: 'Gilroy-Black')),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                 Row(
                                    children: [
                                      // ignore: sized_box_for_whitespace
                                      Container(
                                        width: 320,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('Sound',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16, fontFamily: 'Gilroy-Black')),
                                            SizedBox(
                                              width: 150,
                                            ),
                                            Text('On',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 86, 137, 255), fontFamily: 'Gilroy-Black')),
                                                        SizedBox(width: 15,),
                                                        Text('Off',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Color.fromARGB(255, 238, 231, 231), fontFamily: 'Gilroy-Black')),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                Row(
                                    children: [
                                      // ignore: sized_box_for_whitespace
                                      Container(
                                        width: 320,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('Count as volume keys',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16, fontFamily: 'Gilroy-Black')),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Text('On',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 86, 137, 255), fontFamily: 'Gilroy-Black')),
                                                        SizedBox(width: 15,),
                                                        Text('Off',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Color.fromARGB(255, 238, 231, 231), fontFamily: 'Gilroy-Black')),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]))
                ]))));
  }
}
