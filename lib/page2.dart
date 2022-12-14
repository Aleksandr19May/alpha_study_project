import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
                                  color: Colors.white),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Activity',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          Color.fromARGB(255, 174, 166, 166), fontFamily: 'Gilroy-Black'),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 5, 5, 5),
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 57, 92, 220)),
                              child: const Text(
                                'Saved',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white, fontFamily: 'Gilroy-Black'),
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
                 
                                  
                      Container(
                          height: 640,
                          width:360,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: 
                           ListView.builder(
                              padding:  const EdgeInsets.all(25),
                              itemCount: 10,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                        height: 50,
                                        width: 320,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: const  Color.fromARGB(
                                            255, 238, 231, 231)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text(
                                              '14',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 86, 137, 255),
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
                                              color:
                                                  Color.fromARGB(255, 86, 137, 255),
                                            )
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                );
                              })),
                    ],
                  )
    )));
  }
}
