import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _soundDung = prefs.getString('ff_soundDung') ?? _soundDung;
    });
    _safeInit(() {
      _soundSai = prefs.getString('ff_soundSai') ?? _soundSai;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _soundDung =
      'https://dqjzsvmipzeupgqkowpf.supabase.co/storage/v1/object/public/sound/dung.mp3?t=2024-11-16T09%3A55%3A31.252Z';
  String get soundDung => _soundDung;
  set soundDung(String value) {
    _soundDung = value;
    prefs.setString('ff_soundDung', value);
  }

  String _soundSai =
      'https://dqjzsvmipzeupgqkowpf.supabase.co/storage/v1/object/public/sound/sai.mp3';
  String get soundSai => _soundSai;
  set soundSai(String value) {
    _soundSai = value;
    prefs.setString('ff_soundSai', value);
  }

  String _SoundURL = '';
  String get SoundURL => _SoundURL;
  set SoundURL(String value) {
    _SoundURL = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
