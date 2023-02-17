import 'package:alpha_study_project/generated/locale_keys.g.dart';
import 'package:alpha_study_project/model/zikr.dart';
import 'package:alpha_study_project/screens/provider.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final List<Zikr> zikrs = [
  Zikr(dateTime: DateTime.now(), counter: 11, title: 'Первый'),
  Zikr(dateTime: DateTime.now(), counter: 22, title: 'Второй'),
  Zikr(dateTime: DateTime.now(), counter: 33, title: 'Третий'),
  Zikr(dateTime: DateTime.now(), counter: 44, title: 'Четвертый'),
  Zikr(dateTime: DateTime.now(), counter: 55, title: 'Пятый'),
  Zikr(dateTime: DateTime.now(), counter: 66, title: 'Шестой'),
];

// ДЗ - контекст

class Saves extends StatelessWidget {
  const Saves({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    final listSaveZikrsFromHive =
        context.watch<ProviderZikr>().listSavedZikrsFromHive;

    List<Zikr> listSaveZikrsFromHiveK = listSaveZikrsFromHive.reversed.toList();

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
                      children: [
                        Text(
                          LocaleKeys.last_saved_dhikrs.tr(),
                          style: const TextStyle(
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
                reverse: false,
                itemCount: listSaveZikrsFromHiveK.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context
                          .read<ProviderZikr>()
                          .pushCount(listSaveZikrsFromHiveK[index].counter);
                    },
                    child: Container(
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
                                listSaveZikrsFromHiveK[index]
                                    .counter
                                    .toString(),
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
                                    listSaveZikrsFromHiveK[index].title,
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
                              DateFormat('MM-dd-yyyy HH:mm').format(
                                  listSaveZikrsFromHiveK[index].dateTime),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          InkWell(
                            onTap: () => showDialog(
                              context: context,
                              builder: ((context) => Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 250),
                                      child: Material(
                                          color: Colors.transparent,
                                          child: Container(
                                            height: 220,
                                            width: widthScreen * 0.95,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: Column(

                                              children: [
                                                const  SizedBox(height: 15,),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      'Внесение изменений',
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    )
                                                  ],
                                                ),
                                               const  SizedBox(height: 25,),
                                                   const Padding(
                                                     padding:  EdgeInsets.symmetric(horizontal: 30),
                                                     child:  TextField(
                                                      textAlign: TextAlign.center,
                                                                                 //  controller: controller,
                                                                                   decoration: InputDecoration(
                                                                                     hintText: 'Введите новое значение',
                                                                                     enabledBorder: OutlineInputBorder(
                                                                                       borderSide: BorderSide(
                                                                                         width: 2,
                                                                                         color: Colors.grey,
                                                                                       ),
                                                                                     ),
                                                                                   ),
                                                                                 ),
                                                   ),
                                                   const  SizedBox(height: 10,),
                              const Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                //  controller: controller,
                                  decoration: InputDecoration(
                                    hintText: 'Введите новое имя',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),


                                              ],
                                            ),
                                          )),
                                    )
                                  ])),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              width: (widthScreen - 60) * 0.12,
                              child: const Icon(
                                Icons.more_horiz,
                                color: Color.fromARGB(255, 2, 75, 202),
                              ),
                            ),
                          ),
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
