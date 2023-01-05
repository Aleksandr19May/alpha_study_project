import 'package:alpha_study_project/model/zikr.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final List<Zikr> zikrs = [
  Zikr(id: 1, counter: 11, dateTime: DateTime.now(), title: 'Первый'),
  Zikr(id: 2, counter: 22, dateTime: DateTime.now(), title: 'Second'),
  Zikr(id: 3, counter: 33, dateTime: DateTime.now(), title: 'Первый'),
  Zikr(id: 4, counter: 44, dateTime: DateTime.now(), title: 'Четвертый'),
  Zikr(id: 5, counter: 55, dateTime: DateTime.now(), title: 'Первый'),
  Zikr(id: 6, counter: 66, dateTime: DateTime.now(), title: 'Первый'),
];

class Saves extends StatelessWidget {
  const Saves({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width: widthScreen,
          height: 62,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            color: Colors.white,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Last saved dhikrs',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 2,
                          width: 80,
                          color: const Color.fromARGB(255, 2, 75, 202),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: widthScreen,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: zikrs.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Color.fromARGB(255, 244, 240, 240)),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      width: widthScreen,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox( width: widthScreen*0.1,
                            child: Text(zikrs[index].counter.toString(),
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 2, 75, 202), fontSize: 18,fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            height: 20,
                            width: 2,
                            color: Colors.white,
                          ),
                          SizedBox(width: widthScreen*0.3,child: Text(zikrs[index].title+zikrs[index].title+zikrs[index].title, style: TextStyle(fontSize: 14),)),
                          SizedBox(width: widthScreen*0.3,
                            child: Text(DateFormat('dd.MM.yy (kk:mm)').format(zikrs[index].dateTime,),
                              style: TextStyle(fontSize: 12)),
                          ),
                          SizedBox(width: widthScreen*0.2,
                            child: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.more_horiz),
                              color: const Color.fromARGB(255, 2, 75, 202),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              //zdes
            ),
          ),
        ),
      ],
    );
  }
}
