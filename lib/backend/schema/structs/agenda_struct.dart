// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendaStruct extends BaseStruct {
  AgendaStruct({
    String? ssss,
    List<String>? listaProdutospedido,
  })  : _ssss = ssss,
        _listaProdutospedido = listaProdutospedido;

  // "ssss" field.
  String? _ssss;
  String get ssss => _ssss ?? '';
  set ssss(String? val) => _ssss = val;
  bool hasSsss() => _ssss != null;

  // "listaProdutospedido" field.
  List<String>? _listaProdutospedido;
  List<String> get listaProdutospedido => _listaProdutospedido ?? const [];
  set listaProdutospedido(List<String>? val) => _listaProdutospedido = val;
  void updateListaProdutospedido(Function(List<String>) updateFn) =>
      updateFn(_listaProdutospedido ??= []);
  bool hasListaProdutospedido() => _listaProdutospedido != null;

  static AgendaStruct fromMap(Map<String, dynamic> data) => AgendaStruct(
        ssss: data['ssss'] as String?,
        listaProdutospedido: getDataList(data['listaProdutospedido']),
      );

  static AgendaStruct? maybeFromMap(dynamic data) =>
      data is Map ? AgendaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ssss': _ssss,
        'listaProdutospedido': _listaProdutospedido,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ssss': serializeParam(
          _ssss,
          ParamType.String,
        ),
        'listaProdutospedido': serializeParam(
          _listaProdutospedido,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static AgendaStruct fromSerializableMap(Map<String, dynamic> data) =>
      AgendaStruct(
        ssss: deserializeParam(
          data['ssss'],
          ParamType.String,
          false,
        ),
        listaProdutospedido: deserializeParam<String>(
          data['listaProdutospedido'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'AgendaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AgendaStruct &&
        ssss == other.ssss &&
        listEquality.equals(listaProdutospedido, other.listaProdutospedido);
  }

  @override
  int get hashCode => const ListEquality().hash([ssss, listaProdutospedido]);
}

AgendaStruct createAgendaStruct({
  String? ssss,
}) =>
    AgendaStruct(
      ssss: ssss,
    );
