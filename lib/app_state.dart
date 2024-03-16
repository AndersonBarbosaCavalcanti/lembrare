import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _QUESTimage = '';
  String get QUESTimage => _QUESTimage;
  set QUESTimage(String _value) {
    _QUESTimage = _value;
  }

  String _perguntaOUresposta = '';
  String get perguntaOUresposta => _perguntaOUresposta;
  set perguntaOUresposta(String _value) {
    _perguntaOUresposta = _value;
  }

  String _subsubdeckedit = '';
  String get subsubdeckedit => _subsubdeckedit;
  set subsubdeckedit(String _value) {
    _subsubdeckedit = _value;
  }

  String _questcodeedit = '';
  String get questcodeedit => _questcodeedit;
  set questcodeedit(String _value) {
    _questcodeedit = _value;
  }

  String _codigodialog = '';
  String get codigodialog => _codigodialog;
  set codigodialog(String _value) {
    _codigodialog = _value;
  }
}
