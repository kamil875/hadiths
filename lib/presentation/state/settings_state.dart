import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../core/strings/app_constrains.dart';

class SettingsState extends ChangeNotifier {
  final _appSettings = Hive.box(AppConstrains.keyMainAppBox);

  SettingsState() {
    _themeIndex = _appSettings.get(AppConstrains.keyThemeIndex, defaultValue: 3);
    _textSize = _appSettings.get(AppConstrains.keyTextSize, defaultValue: 1);
    _alwaysOn = _appSettings.get(AppConstrains.keyAlwaysOn, defaultValue: true);
    _alwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
  }

  late int _themeIndex;

  int get getThemeIndex => _themeIndex;

  set setThemeIndex(int index) {
    _themeIndex = index;
    _appSettings.put(AppConstrains.keyThemeIndex, _themeIndex);
    notifyListeners();
  }

  late int _textSize;

  int get getTextSize => _textSize;

  set setTextSize(int size) {
    _textSize = size;
    _appSettings.put(AppConstrains.keyTextSize, _textSize);
    notifyListeners();
  }

  late bool _alwaysOn;

  bool get getAlwaysOn => _alwaysOn;

  set setAlwaysOn(bool onChanged) {
    _alwaysOn = onChanged;
    _appSettings.put(AppConstrains.keyAlwaysOn, _alwaysOn);
    _alwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
    notifyListeners();
  }
}