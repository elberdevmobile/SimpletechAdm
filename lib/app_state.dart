import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
    _safeInit(() {
      _nomeuser = prefs.getString('ff_nomeuser') ?? _nomeuser;
    });
    _safeInit(() {
      _listaProd = prefs
              .getStringList('ff_listaProd')
              ?.map((x) {
                try {
                  return ProdutospedidoStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _listaProd;
    });
    _safeInit(() {
      _listaservice = prefs
              .getStringList('ff_listaservice')
              ?.map((x) {
                try {
                  return ServiopedidoStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _listaservice;
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

  dynamic _agenda;
  dynamic get agenda => _agenda;
  set agenda(dynamic _value) {
    _agenda = _value;
    prefs.setString('ff_agenda', jsonEncode(_value));
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

  String _nomeuser = '';
  String get nomeuser => _nomeuser;
  set nomeuser(String _value) {
    _nomeuser = _value;
    prefs.setString('ff_nomeuser', _value);
  }

  List<ProdutospedidoStruct> _listaProd = [];
  List<ProdutospedidoStruct> get listaProd => _listaProd;
  set listaProd(List<ProdutospedidoStruct> value) {
    _listaProd = value;
    prefs.setStringList(
        'ff_listaProd', value.map((x) => x.serialize()).toList());
  }

  void addToListaProd(ProdutospedidoStruct _value) {
    _listaProd.add(_value);
    prefs.setStringList(
        'ff_listaProd', _listaProd.map((x) => x.serialize()).toList());
  }

  void removeFromListaProd(ProdutospedidoStruct _value) {
    _listaProd.remove(_value);
    prefs.setStringList(
        'ff_listaProd', _listaProd.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListaProd(int _index) {
    _listaProd.removeAt(_index);
    prefs.setStringList(
        'ff_listaProd', _listaProd.map((x) => x.serialize()).toList());
  }

  void updateListaProdAtIndex(
    int _index,
    ProdutospedidoStruct Function(ProdutospedidoStruct) updateFn,
  ) {
    _listaProd[_index] = updateFn(_listaProd[_index]);
    prefs.setStringList(
        'ff_listaProd', _listaProd.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListaProd(int _index, ProdutospedidoStruct _value) {
    _listaProd.insert(_index, _value);
    prefs.setStringList(
        'ff_listaProd', _listaProd.map((x) => x.serialize()).toList());
  }

  List<ServiopedidoStruct> _listaservice = [];
  List<ServiopedidoStruct> get listaservice => _listaservice;
  set listaservice(List<ServiopedidoStruct> _value) {
    _listaservice = _value;
    prefs.setStringList(
        'ff_listaservice', _value.map((x) => x.serialize()).toList());
  }

  void addToListaservice(ServiopedidoStruct _value) {
    _listaservice.add(_value);
    prefs.setStringList(
        'ff_listaservice', _listaservice.map((x) => x.serialize()).toList());
  }

  void removeFromListaservice(ServiopedidoStruct _value) {
    _listaservice.remove(_value);
    prefs.setStringList(
        'ff_listaservice', _listaservice.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListaservice(int _index) {
    _listaservice.removeAt(_index);
    prefs.setStringList(
        'ff_listaservice', _listaservice.map((x) => x.serialize()).toList());
  }

  void updateListaserviceAtIndex(
    int _index,
    ServiopedidoStruct Function(ServiopedidoStruct) updateFn,
  ) {
    _listaservice[_index] = updateFn(_listaservice[_index]);
    prefs.setStringList(
        'ff_listaservice', _listaservice.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListaservice(int _index, ServiopedidoStruct _value) {
    _listaservice.insert(_index, _value);
    prefs.setStringList(
        'ff_listaservice', _listaservice.map((x) => x.serialize()).toList());
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
