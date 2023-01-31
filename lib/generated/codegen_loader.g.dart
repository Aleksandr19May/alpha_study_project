// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "Last saved dhikrs": "Last saved dhikrs",
  "Activity": "Activity",
  "Saved": "Saved",
  "Save Dhikr": "Save Dhikr",
  "Please enter a title Dhikr": "Please enter a title Dhikr",
  "Save": "Save",
  "Save dhikr": "Save dhikr",
  "Settings": "Settings",
  "Language": "Language",
  "English": "English",
  "Vibration": "Vibration",
  "On": "On",
  "Off": "Off",
  "Sound": "Sound",
  "Count as volume keys": "Count as volume keys",
  "Cancel":"Cancel"
};
static const Map<String,dynamic> ru = {
  "Last saved dhikrs": "Последний сохраненный dhikrs",
  "Activity": "Активный",
  "Saved": "Сохраненный",
  "Save Dhikr": "Сохранить Dhikr",
  "Please enter a title Dhikr": "Пожалуйста введите название Dhikr",
  "Save": "Сохранить",
  "Save dhikr": "Сохранить dhikr",
  "Settings": "Настройки",
  "Language": "Язык",
  "English": "Английский",
  "Vibration": "Вибрация",
  "On": "Вкл.",
  "Off": "Выкл.",
  "Sound": "Звук",
  "Count as volume keys": "Звук клавиш",
  "Cancel": "Отмена"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
