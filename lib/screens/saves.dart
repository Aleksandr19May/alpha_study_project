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
        
        Expanded(
          child: ItemZikr(widthScreen: widthScreen),
        ),
      ],
    );
  }
}

class ItemZikr extends StatelessWidget {
  const ItemZikr({
    Key? key,
    required this.widthScreen,
  }) : super(key: key);

  final double widthScreen;

  @override
  Widget build(BuildContext context) {
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
            //width: widthScreen,
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
                  return Container(
                    height: 49,
                    //width: widthScreen,
                    margin: const EdgeInsets.only(top: 10),
                    //padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 249, 246, 246),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (widthScreen - 60) * 0.15,
                          child: Center(
                            child: Text(
                              zikrs[index].counter.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 2, 75, 202),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (widthScreen - 60) * 0.48,
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 2,
                                margin: const EdgeInsets.only(right: 10),
                                color: Colors.white,
                              ),
                              Flexible(
                                child: Text(
                                  zikrs[index].title,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: (widthScreen - 60) * 0.25,
                          child: Text(
                            DateFormat('dd.MM.yy (kk:mm)')
                                .format(zikrs[index].dateTime),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 25),
                          width: (widthScreen - 60) * 0.12,
                          // color: Colors.red,
                          child: IconButton(
                            onPressed: () {
                            
                          }, icon: Icon(Icons.more_horiz))
                          
                        ),
                      ],
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
