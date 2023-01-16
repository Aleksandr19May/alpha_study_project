import 'package:alpha_study_project/model/zikr.dart';
import 'package:alpha_study_project/screens/counter.dart';
import 'package:alpha_study_project/screens/saves.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool activity = true;

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final String keyCounter = 'counter';
  int counter = 0;
  


  Future<void> instanceDb() async {
    final SharedPreferences _prefs = await prefs;

    

    if (_prefs.getInt(keyCounter) == null) {
      _prefs.setInt(keyCounter, 0);
    } else {
      counter = _prefs.getInt(keyCounter)!;
    }
    setState(() {});
  }

  late Box<Zikr> savesZikrs;
  String titleZikr = '5';
  @override
  void initState() {
    instanceDb();
    savesZikrs = Hive.box<Zikr>('zikrs');
    super.initState();
  }

  Future<void> saveCount() async {
    setState(() {});

    final SharedPreferences _prefs = await prefs;
    _prefs.setInt(keyCounter, counter);
  }

  void increment() {
    counter++;
    saveCount();
  }

  void decrement() {
    if (counter > 0) {
      counter--;
      saveCount();
    }
  }

  void zeroing() {
    if (counter > 0) {
      counter = 0;
      saveCount();
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(titleZikr);
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 246),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 38,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 38,
                      width: 276,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              activity = true;
                              setState(() {});
                            },
                            child: Container(
                              height: 30,
                              width: 134,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: activity
                                    ? const Color.fromARGB(255, 2, 75, 202)
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  'Activity',
                                  style: TextStyle(
                                      color: activity
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              activity = false;
                              setState(() {});
                            },
                            child: Container(
                              height: 30,
                              width: 134,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: activity
                                    ? Colors.white
                                    : const Color.fromARGB(255, 2, 75, 202),
                              ),
                              child: Center(
                                child: Text(
                                  'Saved',
                                  style: TextStyle(
                                      color: activity
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 38,
                        width: 54,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () { context.go('/settings');
                              // Navigator.of(context).pushNamed('/settings');
                            },
                            icon: const Icon(Icons.menu))),
                  ],
                ),
              ),
              activity
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Counter(
                          counter: counter,
                          decrement: decrement,
                          increment: increment,
                          zeroing: zeroing,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        InkWell(
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Save Dhikr'),
                              content: TextField(
                                onChanged: (value) {
                                  titleZikr = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Please enter a title Dhikr',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    savesZikrs.add(
                                      Zikr(
                                        dateTime: DateTime.now(),
                                        counter: counter,
                                        title: titleZikr,
                                      ),
                                    );
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'Save dhikr',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 2, 75, 202),
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Saves(),
                // child: ListView.builder(
                //   reverse: true,
                //   itemCount: savesZikrs.length,
                // physics: const BouncingScrollPhysics(),
                // itemBuilder: (context, index) {
                //   return Container(
                //     height: 49,
                //     //width: widthScreen,
                //     margin: const EdgeInsets.only(top: 10),
                //     //padding: const EdgeInsets.symmetric(horizontal: 15),
                //     decoration: const BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       color: Color.fromARGB(255, 249, 246, 246),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         SizedBox(
                //           width: (widthScreen - 60) * 0.15,
                //           child: Center(
                //             child: Text(
                //               savesZikrs.getAt(index)!.counter.toString(),
                //               style: const TextStyle(
                //                 fontSize: 20,
                //                 color: Color.fromARGB(255, 2, 75, 202),
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           width: (widthScreen - 60) * 0.48,
                //           child: Row(
                //             children: [
                //               Container(
                //                 height: 20,
                //                 width: 2,
                //                 margin: const EdgeInsets.only(right: 10),
                //                 color: Colors.white,
                //               ),
                //               Flexible(
                //                 child: Text(
                //                   savesZikrs.getAt(index)!.title.toString(),
                //                   style: const TextStyle(
                //                       fontSize: 14, color: Colors.black),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         SizedBox(
                //           width: (widthScreen - 60) * 0.25,
                //           child: Text(DateFormat('MM-dd-yyyy HH:mm').format(savesZikrs.getAt(index)!.dateTime)
                //             ,
                //             style: const TextStyle(
                //               fontSize: 12,
                //               color: Colors.black54,
                //             ),
                //             textAlign: TextAlign.end,
                //           ),
                //         ),
                //         Container(
                //           padding: const EdgeInsets.symmetric(horizontal: 12),
                //           width: (widthScreen - 60) * 0.12,
                //           child: Image.asset(
                //             'assets/images/ellipsis.png',
                //             fit: BoxFit.fitWidth,
                //             width: 10,
                //           ),
                //         ),
                //       ],
                //     ),
                //   );
                // },
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

