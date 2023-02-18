import 'package:alpha_study_project/model/zikr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyCounter = 'counter';

class ProviderZikr extends ChangeNotifier {
  bool loadingProvider = true;
  bool activity = true;
  int counter = 0;
  late String title;
  List<Zikr> listSavedZikrsFromHive = [];

  ProviderZikr() {
    preloadData();
  }

  void toggleActivity(bool boolevo) {
    if (boolevo != activity) {
      activity = boolevo;
      notifyListeners();
    }
  }

  Future<void> saveZikrToHive(Zikr zikr) async {
    await Hive.openBox<Zikr>('zikrs');
    Box<Zikr> boxZikrs = Hive.box('zikrs');

    boxZikrs.add(zikr);

    notifyListeners();
  }

  Future<void> deleteZikrFromHive(int index) async {
    Box<Zikr> boxZikrs = Hive.box('zikrs');
    await boxZikrs.deleteAt(index);
    notifyListeners();
  }

  Future<void> preloadZikrsFromHive() async {
    await Hive.openBox<Zikr>('zikrs');
    Box<Zikr> boxZikrs = Hive.box('zikrs');

    listSavedZikrsFromHive = boxZikrs.values.toList().reversed.toList();
    notifyListeners();
  }

//  Future<void> changeZikrsinHive(Zikr zikr) async {

// await Hive.openBox<Zikr>('zikrs');
//     Box<Zikr> boxZikrs = Hive.box('zikrs');

// notifyListeners();
//   }

  Future<void> preloadData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(keyCounter)) counter = prefs.getInt(keyCounter)!;

    preloadZikrsFromHive();
    loadingProvider = false;
    notifyListeners();
  }

  late Box<Zikr> savesZikrs;

  Future<void> saveCount() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyCounter, counter);
  }

  void pushCount(int count) async {
    counter = count;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyCounter, counter);
    notifyListeners();
  }

  void increment() {
    counter++;
    saveCount();

    notifyListeners();
  }

  void decrement() {
    if (counter > 0) {
      counter--;
      saveCount();
      notifyListeners();
    }
  }

  void zeroing() {
    if (counter > 0) {
      counter = 0;
      saveCount();
      notifyListeners();
    }
  }
}
