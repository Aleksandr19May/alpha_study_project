// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ru = {
    "last_saved_dhikrs": "Последний сохраненный dhikrs",
    "activity": "Активный",
    "saved": "Сохраненный",
    "save_dhikr": "Сохранить Dhikr",
    "please_enter_a_title_dhikr": "Пожалуйста введите название Dhikr",
    "save": "Сохранить",
    "save_dhikr_2": "Сохранить dhikr",
    "settings": "Настройки",
    "language": "Язык",
    "english": "Английский",
    "vibration": "Вибрация",
    "on": "Вкл.",
    "off": "Выкл.",
    "sound": "Звук",
    "count_as_volume_keys": "Звук клавиш",
    "cancel": "Отмена"
  };
  static const Map<String, dynamic> en = {
    "last_saved_dhikrs": "Last saved dhikrs",
    "activity": "Activity",
    "saved": "Saved",
    "save_dhikr": "Save Dhikr",
    "please_enter_a_title_dhikr": "Please enter a title Dhikr",
    "save": "Save",
    "save_dhikr_2": "Save dhikr",
    "settings": "Settings",
    "language": "Language",
    "english": "English",
    "vibration": "Vibration",
    "on": "On",
    "off": "Off",
    "sound": "Sound",
    "count_as_volume_keys": "Count as volume keys",
    "cancel": "Cancel"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ru": ru,
    "en": en
  };
}
