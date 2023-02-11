import 'package:alpha_study_project/generated/locale_keys.g.dart';

import 'package:alpha_study_project/screens/provider.dart';
import 'package:alpha_study_project/screens/counter.dart';
import 'package:alpha_study_project/screens/saves.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/zikr.dart';

// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final providerZikr = context.read<ProviderZikr>();

    //final widthScreen = MediaQuery.of(context).size.width;
    // print('ПРОВЕРЯЕМ');
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
                              context.watch<ProviderZikr>().activity=true;
                              
                              
                            },
                            child: Container(
                              height: 30,
                              width: 134,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: ProviderZikr().activity
                                    ? const Color.fromARGB(255, 2, 75, 202)
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.activity.tr(),
                                  style: TextStyle(
                                      color: ProviderZikr().activity
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                             context.watch<ProviderZikr>().activity=false;
                                 
                            },
                            child: Container(
                              height: 30,
                              width: 134,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: ProviderZikr().activity
                                    ? Colors.white
                                    : const Color.fromARGB(255, 2, 75, 202),
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.saved.tr(),
                                  style: TextStyle(
                                      color: ProviderZikr().activity
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
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: ProviderZikr().activity
                              ? Colors.white
                              : Colors.red,
                        ),
                        child: IconButton(
                            onPressed: () async {
                              context.go('/settings');
                              Navigator.of(context).pushNamed('/settings');
                            },
                            icon: const Icon(Icons.menu))),
                  ],
                ),
              ),
            ProviderZikr().activity
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                         Counter(
                            // counter: context.watch<ProviderZikr>().counter,
                            // decrement: context.read<ProviderZikr>().decrement,
                            // increment: context.read<ProviderZikr>().increment,
                            // zeroing: context.read<ProviderZikr>().zeroing,
                            ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(LocaleKeys.save_dhikr.tr()),
                              content: TextField(
                                onChanged: (value) {
                                  // context.watch<ProviderZikr>().titleZikr = value;
                                },
                                decoration: InputDecoration(
                                  hintText: LocaleKeys
                                      .please_enter_a_title_dhikr
                                      .tr(),
                                  enabledBorder: const OutlineInputBorder(
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
                                  child: Text(LocaleKeys.cancel.tr()),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<ProviderZikr>().savesZikrs.add(
                                      Zikr(
                                        dateTime: DateTime.now(),
                                        counter: ProviderZikr().counter,
                                        title: ProviderZikr().title,
                                      ),
                                    );

                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    LocaleKeys.save.tr(),
                                    style: const TextStyle(
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
                            child: Center(
                              child: Text(
                                LocaleKeys.save_dhikr_2.tr(),
                                style: const TextStyle(
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
              const Expanded(
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

