import 'package:flutter/material.dart';
import 'package:alpha_study_project/page2.dart';
import 'package:alpha_study_project/settings.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
// мой коммит
var activity = true;
int a = 6;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Page1(),
      routes: {
        '/Page2': (context) => Page2(),
        '/Page3': (context) => Page3(),
      },
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 238, 231, 231),
            body:  Column(
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
                            InkWell (
                              onTap: () => setState(() {
                                activity = true;
                              }),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(35, 5, 5, 5),
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        activity ? Color.fromARGB(255, 57, 92, 220) : Colors.white),
                                child:  Text(
                                  'Activity',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: activity ? Colors.white : Color.fromARGB(255, 174, 166, 166),
                                      fontFamily: 'Gilroy-Black'),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 5, 5, 5),
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: activity ?Colors.white : Color.fromARGB(255, 57, 92, 220) ),
                              child: GestureDetector(
                                onTap: () {
                                  activity = false;
                                  setState(() {
                                    
                                  });
                                },
                                child:  Text(
                                  'Saved',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: activity ? Color.fromARGB(255, 174, 166, 166) : Colors.white,
                                      fontFamily: 'Gilroy-Black'),
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/Page3');
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.blue,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  activity ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Counter(),
                    ],
                  ) : const SizedBox.shrink(),
                  activity ? Row(
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
                  ) : const  SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: 340,
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
                ]) 
                )
                );
  }
}

class Counter extends StatefulWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  int counter = 0;
  final String keyCount = 'counter';

  Future<void> dataBase() async {
    final SharedPreferences _prefs = await prefs;
    if (_prefs.getInt(keyCount) == null) {
      _prefs.setInt(keyCount, 0);
    } else {
      counter = _prefs.getInt(keyCount)!;
    }
    setState(() {});
  }

  @override
  void initState() {
    dataBase();
    super.initState();
  }

  void saveData() async {
    final SharedPreferences _prefs = await prefs;
    _prefs.setInt(keyCount, counter);
    setState(() {});
  }

  void increment() async {
    counter++;
    saveData();
  }

  void decrement() {
    if (counter > 0) {
      counter--;
    }
     saveData();
  }

  void makeZero() {
    if (counter > 0) {
      counter = 0;
       saveData();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 370,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 86, 137, 255),
            child: InkWell(
              child: Container(
                height: 40,
                width: 40,
                child: IconButton(
                    onPressed: () => decrement(),
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 57, 92, 220),
            child: InkWell(
              onTap: () => increment(),
              child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(counter.toString(),
                          style: const TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const Text(
                        'Dhikr',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
            ),
          ),
          Material(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 86, 137, 255),
              child: InkWell(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                      onPressed: () => makeZero(),
                      icon: const Icon(
                        Icons.replay,
                        color: Colors.white,
                      )),
                ),
              )),
        ],
      ),
    );
  }
}
