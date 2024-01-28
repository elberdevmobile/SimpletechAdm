// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiopedidoStruct extends BaseStruct {
  ServiopedidoStruct({
    int? idDoServico,
    int? quantidadeDoServico,
    double? valorComissaoServico,
    double? valorServico,
  })  : _idDoServico = idDoServico,
        _quantidadeDoServico = quantidadeDoServico,
        _valorComissaoServico = valorComissaoServico,
        _valorServico = valorServico;

  // "idDoServico" field.
  int? _idDoServico;
  int get idDoServico => _idDoServico ?? 0;
  set idDoServico(int? val) => _idDoServico = val;
  void incrementIdDoServico(int amount) => _idDoServico = idDoServico + amount;
  bool hasIdDoServico() => _idDoServico != null;

  // "quantidadeDoServico" field.
  int? _quantidadeDoServico;
  int get quantidadeDoServico => _quantidadeDoServico ?? 0;
  set quantidadeDoServico(int? val) => _quantidadeDoServico = val;
  void incrementQuantidadeDoServico(int amount) =>
      _quantidadeDoServico = quantidadeDoServico + amount;
  bool hasQuantidadeDoServico() => _quantidadeDoServico != null;

  // "valorComissaoServico" field.
  double? _valorComissaoServico;
  double get valorComissaoServico => _valorComissaoServico ?? 0.0;
  set valorComissaoServico(double? val) => _valorComissaoServico = val;
  void incrementValorComissaoServico(double amount) =>
      _valorComissaoServico = valorComissaoServico + amount;
  bool hasValorComissaoServico() => _valorComissaoServico != null;

  // "valorServico" field.
  double? _valorServico;
  double get valorServico => _valorServico ?? 0.0;
  set valorServico(double? val) => _valorServico = val;
  void incrementValorServico(double amount) =>
      _valorServico = valorServico + amount;
  bool hasValorServico() => _valorServico != null;

  static ServiopedidoStruct fromMap(Map<String, dynamic> data) =>
      ServiopedidoStruct(
        idDoServico: castToType<int>(data['idDoServico']),
        quantidadeDoServico: castToType<int>(data['quantidadeDoServico']),
        valorComissaoServico: castToType<double>(data['valorComissaoServico']),
        valorServico: castToType<double>(data['valorServico']),
      );

  static ServiopedidoStruct? maybeFromMap(dynamic data) => data is Map
      ? ServiopedidoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'idDoServico': _idDoServico,
        'quantidadeDoServico': _quantidadeDoServico,
        'valorComissaoServico': _valorComissaoServico,
        'valorServico': _valorServico,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idDoServico': serializeParam(
          _idDoServico,
          ParamType.int,
        ),
        'quantidadeDoServico': serializeParam(
          _quantidadeDoServico,
          ParamType.int,
        ),
        'valorComissaoServico': serializeParam(
          _valorComissaoServico,
          ParamType.double,
        ),
        'valorServico': serializeParam(
          _valorServico,
          ParamType.double,
        ),
      }.withoutNulls;

  static ServiopedidoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServiopedidoStruct(
        idDoServico: deserializeParam(
          data['idDoServico'],
          ParamType.int,
          false,
        ),
        quantidadeDoServico: deserializeParam(
          data['quantidadeDoServico'],
          ParamType.int,
          false,
        ),
        valorComissaoServico: deserializeParam(
          data['valorComissaoServico'],
          ParamType.double,
          false,
        ),
        valorServico: deserializeParam(
          data['valorServico'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ServiopedidoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiopedidoStruct &&
        idDoServico == other.idDoServico &&
        quantidadeDoServico == other.quantidadeDoServico &&
        valorComissaoServico == other.valorComissaoServico &&
        valorServico == other.valorServico;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [idDoServico, quantidadeDoServico, valorComissaoServico, valorServico]);
}

ServiopedidoStruct createServiopedidoStruct({
  int? idDoServico,
  int? quantidadeDoServico,
  double? valorComissaoServico,
  double? valorServico,
}) =>
    ServiopedidoStruct(
      idDoServico: idDoServico,
      quantidadeDoServico: quantidadeDoServico,
      valorComissaoServico: valorComissaoServico,
      valorServico: valorServico,
    );
