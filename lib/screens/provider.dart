import 'package:alpha_study_project/model/zikr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyCounter = 'counter';

class ProviderZikr extends ChangeNotifier {
  bool activity = true;
  int counter = 0;
  late String title;
  bool loadingProvider = true;

  ProviderZikr() {
    preloadData();
  }

  void toggleActivity(bool boolevo) {
    if (boolevo != activity) {
      activity = boolevo;
      notifyListeners();
    }
  }


  Future<void> saveZikrToHive(Zikr zikr) async{
    
  }

  Future<void> preloadData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(keyCounter)) counter = prefs.getInt(keyCounter)!;

    loadingProvider = false;
    notifyListeners();
  }

  late Box<Zikr> savesZikrs;

  Future<void> saveCount() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyCounter, counter);
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
