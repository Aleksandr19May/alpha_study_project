import 'package:flutter/material.dart';
import 'package:alpha_study_project/page2.dart';
import 'package:alpha_study_project/settings.dart';
 // мой коммит


 int a = 5;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Page1(),
      routes: {
        '/Page2':(context) => Page2(),
        '/Page3':(context) => Page3(),
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 238, 231, 231),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40,
                        width: 270,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        // padding: EdgeInsets.all(7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 5, 5, 5),
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 57, 92, 220)),
                              child: const Text(
                                'Activity',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white, fontFamily: 'Gilroy-Black'),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 5, 5, 5),
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child:  GestureDetector (
                                onTap: () {
                                   Navigator.pushNamed(context, '/Page2');
                                },
                                child: const Text(
                                  'Saved',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 174, 166, 166), fontFamily: 'Gilroy-Black'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: IconButton(
                          onPressed: () {Navigator.pushNamed(context, '/Page3');},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.blue,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 370,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 86, 137, 255)),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                            ),
                            Container(
                                height: 130,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(255, 57, 92, 220)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('33',
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text(
                                      'Dhikr',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 86, 137, 255)),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.replay,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(150, 15, 50, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        height: 50,
                        width: 370,
                        child: const Text(
                          'Save dhikr',
                          style: TextStyle(
                              color: Color.fromARGB(255, 86, 137, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 300,
                        width: 370,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 320,
                                height: 22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Last saved dhikrs',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14, fontFamily: 'Gilroy-Black'),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(1, 1, 250, 1),
                                      width: 65,
                                      height: 2,
                                      color: const Color.fromARGB(
                                          255, 86, 137, 255),
                                    )
                                  ],
                                )),
                            Container(
                                width: 320,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 238, 231, 231)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      '14',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 86, 137, 255),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700, fontFamily: 'Gilroy-Black'),
                                    ),
                                    Text(
                                      'Name of the file dhikr',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400, fontFamily: 'Gilroy-Black'),
                                    ),
                                    Text(
                                      '19.02.2021',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400, fontFamily: 'Gilroy-Black'),
                                    ),
                                    Icon(
                                      Icons.more_horiz,
                                      color: Color.fromARGB(255, 86, 137, 255),
                                    )
                                  ],
                                )),
                            Container(
                                width: 320,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 238, 231, 231)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      '  9',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 86, 137, 255),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700, fontFamily: 'Gilroy-Black'),
                                    ),
                                    Text(
                                      'Name of the file dhikr',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400, fontFamily: 'Gilroy-Black'),
                                    ),
                                    Text(
                                      '19.02.2021',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400, fontFamily: 'Gilroy-Black'),
                                    ),
                                    Icon(
                                      Icons.more_horiz,
                                      color: Color.fromARGB(255, 86, 137, 255),
                                    )
                                  ],
                                )),
                            Container(
                                width: 320,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 238, 231, 231)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      '15',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 86, 137, 255),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700, fontFamily: 'Gilroy-Black'),
                                    ),
                                    Text(
                                      'Name of the file dhikr',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400, fontFamily: 'Gilroy-Black'),
                                    ),
                                    Text(
                                      '19.02.2021',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400, fontFamily: 'Gilroy-Black'),
                                    ),
                                    Icon(
                                      Icons.more_horiz,
                                      color: Color.fromARGB(255, 86, 137, 255),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      )
                    ],
                  )
                ])));
  }
}
