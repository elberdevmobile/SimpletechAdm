import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_user')) {
        try {
          _user = jsonDecode(prefs.getString('ff_user') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _logged = prefs.getBool('ff_logged') ?? _logged;
    });
    _safeInit(() {
      _login = prefs.getString('ff_login') ?? _login;
    });
    _safeInit(() {
      _senha = prefs.getString('ff_senha') ?? _senha;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    prefs.setString('ff_token', _value);
  }

  dynamic _user;
  dynamic get user => _user;
  set user(dynamic _value) {
    _user = _value;
    prefs.setString('ff_user', jsonEncode(_value));
  }

  bool _logged = false;
  bool get logged => _logged;
  set logged(bool _value) {
    _logged = _value;
    prefs.setBool('ff_logged', _value);
  }

  String _login = '';
  String get login => _login;
  set login(String _value) {
    _login = _value;
    prefs.setString('ff_login', _value);
  }

  String _senha = '';
  String get senha => _senha;
  set senha(String _value) {
    _senha = _value;
    prefs.setString('ff_senha', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
