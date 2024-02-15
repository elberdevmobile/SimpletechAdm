import 'dart:convert';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../app_state.dart';
import '../flutter_flow/flutter_flow_util.dart';

class AtendimentoIniciado {
  final String dataDoAtendimento;
  final int idAtendimento;
  final int idDoCliente;
  final String atendimentoAvulso;
  final String cliente;
  final String celularCliente;
  final int idDaFilial;
  final String filial;

  AtendimentoIniciado({
    required this.dataDoAtendimento,
    required this.idAtendimento,
    required this.idDoCliente,
    required this.atendimentoAvulso,
    required this.cliente,
    required this.celularCliente,
    required this.idDaFilial,
    required this.filial,
  });

  factory AtendimentoIniciado.fromJson(Map<String, dynamic> json) {
    return AtendimentoIniciado(
      dataDoAtendimento: json['dataDoAtendimento'],
      idAtendimento: json['idAtendimento'],
      idDoCliente: json['idDoCliente'],
      atendimentoAvulso: json['atendimentoAvulso'],
      cliente: json['cliente'],
      celularCliente: json['celularCliente'],
      idDaFilial: json['idDaFilial'],
      filial: json['filial'],
    );
  }
}

class AtendimentoIniciadoList {
  final List<AtendimentoIniciado> list;
  final int totalResults;

  AtendimentoIniciadoList({
    required this.list,
    required this.totalResults,
  });

  factory AtendimentoIniciadoList.fromJson(Map<String, dynamic> json) {
    List<AtendimentoIniciado> atendimentos = [];
    if (json['list'] != null) {
      json['list'].forEach((v) {
        atendimentos.add(AtendimentoIniciado.fromJson(v));
      });
    }
    return AtendimentoIniciadoList(
      list: atendimentos,
      totalResults: json['totalResults'],
    );
  }
}

class Atendimento {
  final double vlTotalServicos;
  final double vlTotalProdutos;
  final double vlTotalAtendimento;
  final DateTime dataDeFinalizacaoDoAtendimento;
  final String tipoDePagamento;
  final String nfGerada;
  final String notaFiscalDoAtendimento;
  final int idAtendimento;
  final int idDoCliente;
  final String atendimentoAvulso;
  final String cliente;
  final String celularCliente;
  final int idDaFilial;
  final String filial;

  Atendimento({
    required this.vlTotalServicos,
    required this.vlTotalProdutos,
    required this.vlTotalAtendimento,
    required this.dataDeFinalizacaoDoAtendimento,
    required this.tipoDePagamento,
    required this.nfGerada,
    required this.notaFiscalDoAtendimento,
    required this.idAtendimento,
    required this.idDoCliente,
    required this.atendimentoAvulso,
    required this.cliente,
    required this.celularCliente,
    required this.idDaFilial,
    required this.filial,
  });

  factory Atendimento.fromJson(Map<String, dynamic> json) {
    return Atendimento(
      vlTotalServicos: json['vlTotalServicos'],
      vlTotalProdutos: json['vlTotalProdutos'] ?? 0.0,
      vlTotalAtendimento: json['vlTotalAtendimento'],
      dataDeFinalizacaoDoAtendimento:
          DateTime.parse(json['dataDeFinalizacaoDoAtendimento']),
      tipoDePagamento: json['tipoDePagamento'],
      nfGerada: json['nfGerada'],
      notaFiscalDoAtendimento: json['notaFiscalDoAtendimento'] ?? "",
      idAtendimento: json['idAtendimento'],
      idDoCliente: json['idDoCliente'],
      atendimentoAvulso: json['atendimentoAvulso'],
      cliente: json['cliente'],
      celularCliente: json['celularCliente'],
      idDaFilial: json['idDaFilial'],
      filial: json['filial'],
    );
  }
}

class AtendimentosFinalizadosScreen extends StatefulWidget {
  @override
  _AtendimentosFinalizadosScreenState createState() =>
      _AtendimentosFinalizadosScreenState();
}

class _AtendimentosFinalizadosScreenState
    extends State<AtendimentosFinalizadosScreen> {
  List<Atendimento> atendimentos = [];
  List<AtendimentoIniciado> atendimentoiniciado = [];
  late Future<List<Atendimento>>? _futureAtendimentos;
  late Future<List<AtendimentoIniciado>>? _futureAtendimentosIniciado;

  @override
  void initState() {
    super.initState();
    _futureAtendimentos = fetchData();
    _futureAtendimentosIniciado = fetchDataIniciados();
  }

  Future<List<Atendimento>> fetchData() async {
    final response = await http.post(
      Uri.parse(
          'https://api.simplebeautyapp.com.br/manager-dev/api/atendimentos/obter-atendimentos-finalizados'),
      body: jsonEncode({
        "pageIndex": 10,
        "dataInicio": DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(Duration(days: 7))),
        "dataFim": DateFormat('yyyy-MM-dd').format(DateTime.now()),
        "idDaFilial": 1,
        "pesquisa": ""
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer  ${FFAppState().token}',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> list = responseData['list'];

      setState(() {
        atendimentos = list.map((json) => Atendimento.fromJson(json)).toList();
      });
      return list.map((json) => Atendimento.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
    return [];
  }

  Future<List<AtendimentoIniciado>> fetchDataIniciados() async {
    final response = await http.post(
      Uri.parse(
          'https://api.simplebeautyapp.com.br/manager-dev/api/atendimentos/obter-atendimentos-iniciados'),
      body: jsonEncode({
        "pageIndex": 10,
        "dataInicio": DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(Duration(days: 7))),
        "dataFim": DateFormat('yyyy-MM-dd').format(DateTime.now()),
        "idDaFilial": 1,
        "pesquisa": ""
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer  ${FFAppState().token}',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> list = responseData['list'];

      setState(() {
        atendimentoiniciado =
            list.map((json) => AtendimentoIniciado.fromJson(json)).toList();
      });
      return list.map((json) => AtendimentoIniciado.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atendimentos Finalizados'),
      ),
      body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: FutureBuilder<List<Atendimento>>(
            future: _futureAtendimentos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final dataFormatada = DateFormat('dd/MM/yyyy HH:mm').format(
                        snapshot.data![index].dataDeFinalizacaoDoAtendimento);
                    return Card(
                      color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cliente:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(snapshot.data![index].cliente),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.date_range,
                                    size: 16, color: Colors.blue),
                                SizedBox(width: 5),
                                Text(
                                  'Data:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Text(dataFormatada.toString()),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.attach_money,
                                    size: 16, color: Colors.green),
                                SizedBox(width: 5),
                                Text(
                                  'Valor Total:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Text(
                                    'R\$ ${snapshot.data![index].vlTotalAtendimento.toStringAsFixed(2)}'),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.payment,
                                    size: 16, color: Colors.orange),
                                SizedBox(width: 5),
                                Text(
                                  'Tipo de Pagamento:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Text(snapshot.data![index].tipoDePagamento),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator(),);
            },
          ),
        ),
        Divider(),
        Center(
          child: Text(
            'Atendimentos Iniciados',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: FutureBuilder<List<AtendimentoIniciado>>(
            future: _futureAtendimentosIniciado,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final dataFormatada = DateFormat('dd/MM/yyyy HH:mm').format(
                        DateTime.parse(
                            snapshot.data![index].dataDoAtendimento));
                    return Card(
                      color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cliente:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(snapshot.data![index].cliente),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.date_range,
                                    size: 16, color: Colors.blue),
                                SizedBox(width: 5),
                                Text(
                                  'Data:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Text(dataFormatada.toString()),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.merge_type,
                                    size: 16, color: Colors.green),
                                SizedBox(width: 5),
                                const Text(
                                  'Avulso:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Text('${snapshot.data![index].atendimentoAvulso}'),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.phone_android,
                                    size: 16, color: Colors.orange),
                                SizedBox(width: 5),
                                Text(
                                  'Telefone:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Text(snapshot.data![index].celularCliente),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child:CircularProgressIndicator());
            },
          ),
        )
      ])),
    );
  }
}
