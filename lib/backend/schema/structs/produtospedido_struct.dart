// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutospedidoStruct extends BaseStruct {
  ProdutospedidoStruct({
    int? idDoProduto,
    int? quantidadeDoProduto,
    double? valorComissaoProduto,
    double? valorProduto,
    String? nome,
    String? marca

  })  : _idDoProduto = idDoProduto,
        _quantidadeDoProduto = quantidadeDoProduto,
        _valorComissaoProduto = valorComissaoProduto,
        _valorProduto = valorProduto,
        _nome = nome,
  _marca = marca;

  // "idDoProduto" field.
  int? _idDoProduto;
  int get idDoProduto => _idDoProduto ?? 0;
  String? _nome;
  String get nome => _nome ?? "";
  String? _marca;
  set marca(String? val) => _marca = val;
  String get marca => _marca ??"";
  set idDoProduto(int? val) => _idDoProduto = val;
  set nome(String? val) => _nome = val;
  void incrementIdDoProduto(int amount) => _idDoProduto = idDoProduto + amount;
  bool hasIdDoProduto() => _idDoProduto != null;

  // "quantidadeDoProduto" field.
  int? _quantidadeDoProduto;
  int get quantidadeDoProduto => _quantidadeDoProduto ?? 0;
  set quantidadeDoProduto(int? val) => _quantidadeDoProduto = val;
  void incrementQuantidadeDoProduto(int amount) =>
      _quantidadeDoProduto = quantidadeDoProduto + amount;
  bool hasQuantidadeDoProduto() => _quantidadeDoProduto != null;

  // "valorComissaoProduto" field.
  double? _valorComissaoProduto;
  double get valorComissaoProduto => _valorComissaoProduto ?? 0.0;
  set valorComissaoProduto(double? val) => _valorComissaoProduto = val;
  void incrementValorComissaoProduto(double amount) =>
      _valorComissaoProduto = valorComissaoProduto + amount;
  bool hasValorComissaoProduto() => _valorComissaoProduto != null;

  // "valorProduto" field.
  double? _valorProduto;
  double get valorProduto => _valorProduto ?? 0.0;
  set valorProduto(double? val) => _valorProduto = val;
  void incrementValorProduto(double amount) =>
      _valorProduto = valorProduto + amount;
  bool hasValorProduto() => _valorProduto != null;

  static ProdutospedidoStruct fromMap(Map<String, dynamic> data) =>
      ProdutospedidoStruct(
        idDoProduto: castToType<int>(data['idDoProduto']),
        quantidadeDoProduto: castToType<int>(data['quantidadeDoProduto']),
        valorComissaoProduto: castToType<double>(data['valorComissaoProduto']),
        valorProduto: castToType<double>(data['valorProduto']),
          nome: castToType<String>(data['nome']),
          marca: castToType<String>(data['marca']),


      );

  static ProdutospedidoStruct? maybeFromMap(dynamic data) => data is Map
      ? ProdutospedidoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'idDoProduto': _idDoProduto,
        'quantidadeDoProduto': _quantidadeDoProduto,
        'valorComissaoProduto': _valorComissaoProduto,
        'valorProduto': _valorProduto,
    'nome': _nome,
    'marca': _marca,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idDoProduto': serializeParam(
          _idDoProduto,
          ParamType.int,
        ),
        'quantidadeDoProduto': serializeParam(
          _quantidadeDoProduto,
          ParamType.int,
        ),
        'valorComissaoProduto': serializeParam(
          _valorComissaoProduto,
          ParamType.double,
        ),
        'valorProduto': serializeParam(
          _valorProduto,
          ParamType.double,
        ),'nome': serializeParam(
          _nome,
          ParamType.String,
        ),'marca': serializeParam(
          _marca,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProdutospedidoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProdutospedidoStruct(
        idDoProduto: deserializeParam(
          data['idDoProduto'],
          ParamType.int,
          false,
        ),
        quantidadeDoProduto: deserializeParam(
          data['quantidadeDoProduto'],
          ParamType.int,
          false,
        ),
        valorComissaoProduto: deserializeParam(
          data['valorComissaoProduto'],
          ParamType.double,
          false,
        ),
        valorProduto: deserializeParam(
          data['valorProduto'],
          ParamType.double,
          false,
        ), nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ), marca: deserializeParam(
          data['marca'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProdutospedidoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProdutospedidoStruct &&
        idDoProduto == other.idDoProduto &&
        quantidadeDoProduto == other.quantidadeDoProduto &&
        valorComissaoProduto == other.valorComissaoProduto &&
        valorProduto == other.valorProduto &&
    nome == other.nome &&
    marca == other.marca;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [idDoProduto, quantidadeDoProduto, valorComissaoProduto, valorProduto, nome,marca]);
}

ProdutospedidoStruct createProdutospedidoStruct({
  int? idDoProduto,
  int? quantidadeDoProduto,
  double? valorComissaoProduto,
  double? valorProduto,
  String? nome,
  String? marca
}) =>
    ProdutospedidoStruct(
      idDoProduto: idDoProduto,
      quantidadeDoProduto: quantidadeDoProduto,
      valorComissaoProduto: valorComissaoProduto,
      valorProduto: valorProduto,
        nome: nome,
        marca: marca
    );
