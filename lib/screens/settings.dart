import 'dart:io';

import 'package:alpha_study_project/generated/locale_keys.g.dart';
import 'package:alpha_study_project/screens/provider.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProviderZikr>();

    bool selectedMusic = true;
    final isSoundEnabled = context.watch<ProviderZikr>().isSoundEnabled;
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
                            color: const Color.fromARGB(255, 57, 92, 220)),
                        child: IconButton(
                          padding: const EdgeInsets.fromLTRB(1, 1, 1, 2),
                          onPressed: () {
                            context.pop();
                            // context.go('/');
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
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.settings.tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-Black'),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(1, 1, 275, 1),
                          width: 150,
                          height: 2,
                          color: const Color.fromARGB(255, 86, 137, 255),
                        ),
                      ])),
                  SizedBox(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(LocaleKeys.language.tr(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-Black')),
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.setLocale(const Locale('en'));
                                    },
                                    child: const Text('En',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 86, 137, 255),
                                            fontFamily: 'Gilroy-Black')),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.setLocale(const Locale('ru'));
                                    },
                                    child: const Text('Ru',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 86, 137, 255),
                                            fontFamily: 'Gilroy-Black')),
                                  ),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(LocaleKeys.vibration.tr(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-Black')),
                                  const SizedBox(
                                    width: 130,
                                  ),
                                  Text(LocaleKeys.on.tr(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 86, 137, 255),
                                          fontFamily: 'Gilroy-Black')),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(LocaleKeys.off.tr(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                              255, 238, 231, 231),
                                          fontFamily: 'Gilroy-Black')),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(LocaleKeys.sound.tr(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              fontFamily: 'Gilroy-Black')),
                                      const SizedBox(
                                        width: 130,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          provider.toggleSound(true);
                                          provider.setVolume();
                                        },
                                        child: Text(LocaleKeys.on.tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: isSoundEnabled
                                                    ? const Color.fromARGB(
                                                        255, 86, 137, 255)
                                                    : const Color.fromARGB(
                                                        255, 238, 231, 231),
                                                fontFamily: 'Gilroy-Black')),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          provider.toggleSound(false);
                                          provider.setVolume();
                                        },
                                        child: Text(LocaleKeys.off.tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: isSoundEnabled
                                                    ? const Color.fromARGB(
                                                        255, 238, 231, 231)
                                                    : const Color.fromARGB(
                                                        255, 86, 137, 255),
                                                fontFamily: 'Gilroy-Black')),
                                      ),
                                    ]))
                          ],
                        ),
                        Row(
                          children: [
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: 320,
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(LocaleKeys.count_as_volume_keys.tr(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-Black')),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  DropdownButton<int>(
                                      value: provider.x,
                                      icon: const Icon(Icons.arrow_downward),
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onChanged: (value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          provider.x = value!;
                                        });
                                      },
                                      items: const [
                                        DropdownMenuItem(
                                          value: 0,
                                          child: Text('Дротик'),
                                        ),
                                        DropdownMenuItem(
                                          value: 1,
                                          child: Text('Хлыст'),
                                        ),
                                        DropdownMenuItem(
                                          value: 2,
                                          child: Text('Песок'),
                                        ),
                                        DropdownMenuItem(
                                          value: 3,
                                          child: Text('Мышка'),
                                        ),
                                      ]),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                 MyBanner(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class MyBanner extends StatefulWidget {
  const MyBanner({super.key});

  @override
  State<MyBanner> createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  // ca-app-pub-3940256099942544/6300978111 //android
  // ca-app-pub-3940256099942544/2934735716 // ios

  

  final BannerAd myBanner = BannerAd(
      size: AdSize.mediumRectangle,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: error');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
      request: const AdRequest());

      @override
  void initState() {
   myBanner.load();
    super.initState();
  }
  @override
  void dispose() {  // всегда выполняется также как и инит стейт
    myBanner.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Align(
    alignment: Alignment.center,
    child: SizedBox(
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
      child: AdWidget(ad: myBanner),
    ),
    ) ;
  }
}
