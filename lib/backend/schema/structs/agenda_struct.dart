// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendaStruct extends BaseStruct {
  AgendaStruct({
    String? ssss,
  }) : _ssss = ssss;

  // "ssss" field.
  String? _ssss;
  String get ssss => _ssss ?? '';
  set ssss(String? val) => _ssss = val;
  bool hasSsss() => _ssss != null;

  static AgendaStruct fromMap(Map<String, dynamic> data) => AgendaStruct(
        ssss: data['ssss'] as String?,
      );

  static AgendaStruct? maybeFromMap(dynamic data) =>
      data is Map ? AgendaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ssss': _ssss,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ssss': serializeParam(
          _ssss,
          ParamType.String,
        ),
      }.withoutNulls;

  static AgendaStruct fromSerializableMap(Map<String, dynamic> data) =>
      AgendaStruct(
        ssss: deserializeParam(
          data['ssss'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AgendaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgendaStruct && ssss == other.ssss;
  }

  @override
  int get hashCode => const ListEquality().hash([ssss]);
}

AgendaStruct createAgendaStruct({
  String? ssss,
}) =>
    AgendaStruct(
      ssss: ssss,
    );
