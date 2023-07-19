import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SimpleTech Copy Group Code

class SimpleTechCopyGroup {
  static String baseUrl = 'https://api.simplebeautyapp.com.br/parceiro-dev';
  static Map<String, String> headers = {};
  static AlterarCadastroCall alterarCadastroCall = AlterarCadastroCall();
  static AlterarSenhaCall alterarSenhaCall = AlterarSenhaCall();
  static AutenticarCall autenticarCall = AutenticarCall();
  static ObterFiliaisParceiroCall obterFiliaisParceiroCall =
      ObterFiliaisParceiroCall();
  static AlterarImagemCall alterarImagemCall = AlterarImagemCall();
  static ObterServicosPorParceiroCall obterServicosPorParceiroCall =
      ObterServicosPorParceiroCall();
  static ObterProdutosParaVendasCall obterProdutosParaVendasCall =
      ObterProdutosParaVendasCall();
  static NovoCadastroCall novoCadastroCall = NovoCadastroCall();
  static ObterPorIdCall obterPorIdCall = ObterPorIdCall();
  static IniciarAtendimentoCall iniciarAtendimentoCall =
      IniciarAtendimentoCall();
  static ObterAtendimentoCall obterAtendimentoCall = ObterAtendimentoCall();
  static ObterAtendimentosAvulsosCall obterAtendimentosAvulsosCall =
      ObterAtendimentosAvulsosCall();
  static ObterAtendimentoParaFinalizarCall obterAtendimentoParaFinalizarCall =
      ObterAtendimentoParaFinalizarCall();
  static FinalizarAtendimentoCall finalizarAtendimentoCall =
      FinalizarAtendimentoCall();
  static ObterAgendamentosParceiroCall obterAgendamentosParceiroCall =
      ObterAgendamentosParceiroCall();
  static ObterGanhosParceiroCall obterGanhosParceiroCall =
      ObterGanhosParceiroCall();
  static ObterPorCelularCall obterPorCelularCall = ObterPorCelularCall();
}

class AlterarCadastroCall {
  Future<ApiCallResponse> call() {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'alterar-cadastro',
      apiUrl: '${SimpleTechCopyGroup.baseUrl}/api/auth/alterar-cadastro',
      callType: ApiCallType.POST,
      headers: {
        ...SimpleTechCopyGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AlterarSenhaCall {
  Future<ApiCallResponse> call({
    String? login = '',
    String? senha = '',
    String? confirmacao = '',
    String? anterior = '',
    int? tipo = 0,
  }) {
    final body = '''
{
  "login": "${login}",
  "senha": "${senha}",
  "senhaConfirmacao": "${confirmacao}",
  "senhaAnterior": "${anterior}",
  "tipoDeUsuario": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'alterar-senha',
      apiUrl: '${SimpleTechCopyGroup.baseUrl}/api/parceiros/alterar-senha',
      callType: ApiCallType.POST,
      headers: {
        ...SimpleTechCopyGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AutenticarCall {
  Future<ApiCallResponse> call({
    String? bearerAuth =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBZG1pbmlzdHJhZG9yIjoiQWNlc3NvTWFuYWdlcixBY2Vzc29Vc3VhcmlvLENhZGFzdHJvVXN1YXJpbyxBbHRlcmFjYW9Vc3VhcmlvLEV4Y2x1c2FvVXN1YXJpbyxMaXN0YWdlbVVzdWFyaW8sTGlzdGFnZW1GaWxpYWxQYXJjZWlybyxMaXN0YWdlbUNvbWlzc2FvUGFyY2Vpcm8sTGlzdGFnZW1MaWNlbmNhLEFjZXNzb0ZpbGlhbCxDYWRhc3Ryb0ZpbGlhbCxBbHRlcmFjYW9GaWxpYWwsRXhjbHVzYW9GaWxpYWwsTGlzdGFnZW1GaWxpYWwsTGlzdGFnZW1BbWJpZW50ZXNQb3JDbGllbnRlLEFjZXNzb1NlcnZpY28sQ2FkYXN0cmFyU2VydmljbyxBbHRlcmFyU2VydmljbyxFeGNsdWlyU2VydmljbyxMaXN0YWdlbVNlcnZpY28sTGlzdGFnZW1TZXJ2aWNvc1BhcmNlaXJvLEFjZXNzb0NhdGVnb3JpYVByb2R1dG8sQ2FkYXN0cmFyQ2F0ZWdvcmlhUHJvZHV0byxBbHRlcmFyQ2F0ZWdvcmlhUHJvZHV0byxFeGNsdWlyQ2F0ZWdvcmlhUHJvZHV0byxMaXN0YWdlbUNhdGVnb3JpYVByb2R1dG8sQWNlc3NvTWFyY2FQcm9kdXRvLENhZGFzdHJhck1hcmNhUHJvZHV0byxBbHRlcmFyTWFyY2FQcm9kdXRvLEV4Y2x1aXJNYXJjYVByb2R1dG8sTGlzdGFnZW1NYXJjYVByb2R1dG8sQWNlc3NvQ2xhc3NlRGVJbXBvc3RvUHJvZHV0byxDYWRhc3RyYXJDbGFzc2VEZUltcG9zdG9Qcm9kdXRvLEFsdGVyYXJDbGFzc2VEZUltcG9zdG9Qcm9kdXRvLEV4Y2x1aXJDbGFzc2VEZUltcG9zdG9Qcm9kdXRvLExpc3RhZ2VtQ2xhc3NlRGVJbXBvc3RvUHJvZHV0byxBY2Vzc29Qcm9kdXRvLENhZGFzdHJhclByb2R1dG8sQWx0ZXJhclByb2R1dG8sRXhjbHVpclByb2R1dG8sTGlzdGFnZW1Qcm9kdXRvLEFjZXNzb1RhYmVsYURlUHJlY28sQ2FkYXN0cmFyVGFiZWxhRGVQcmVjbyxBbHRlcmFyVGFiZWxhRGVQcmVjbyxFeGNsdWlyVGFiZWxhRGVQcmVjbyxMaXN0YWdlbVRhYmVsYURlUHJlY28sQWNlc3NvUHJlY2lmaWNhY2FvUHJvZHV0byxDYWRhc3RyYXJQcmVjaWZpY2FjYW9Qcm9kdXRvLEFsdGVyYXJQcmVjaWZpY2FjYW9Qcm9kdXRvLEV4Y2x1aXJQcmVjaWZpY2FjYW9Qcm9kdXRvLExpc3RhZ2VtUHJlY2lmaWNhY2FvUHJvZHV0byxBY2Vzc29Db25maWdFc3RQcm9kLENhZGFzdHJhckNvbmZpZ0VzdFByb2QsQWx0ZXJhckNvbmZpZ0VzdFByb2QsRXhjbHVpckNvbmZpZ0VzdFByb2QsTGlzdGFnZW1Db25maWdFc3RQcm9kLEFwcm92YXJDb25maWdFc3RQcm9kLEFjZXNzb0NsaWVudGVzLENhZGFzdHJhckNsaWVudGVzLEFsdGVyYXJDbGllbnRlcyxFeGNsdWlyQ2xpZW50ZXMsTGlzdGFnZW1DbGllbnRlcyxDYWRhc3Ryb0NvbnRhLEFsdGVyYWNhb0NvbnRhLEV4Y2x1c2FvQ29udGEsTGlzdGFnZW1Db250YXMsQ2FkYXN0cm9Db250YVJlY2ViZXIsQWx0ZXJhY2FvQ29udGFSZWNlYmVyLEV4Y2x1c2FvQ29udGFSZWNlYmVyLExpc3RhZ2VtQ29udGFzUmVjZWJlcixBY2Vzc29BdGVuZGltZW50b3MsQ2FkYXN0cm9BdGVuZGltZW50byxBbHRlcmFjYW9BdGVuZGltZW50byxFeGNsdXNhb0F0ZW5kaW1lbnRvLExpc3RhZ2VtQXRlbmRpbWVudG9zLENhbmNlbGFyQXRlbmRpbWVudG8sSW5pY2lhckF0ZW5kaW1lbnRvLENhZGFzdHJvUGVkaWRvLEFsdGVyYWNhb0F0ZW5kaW1lbnRvLEV4Y2x1c2FvUGVkaWRvLExpc3RhZ2VtUGVkaWRvcyxDYWRhc3RyYXJBZ2VuZGFtZW50byxBbHRlcmFyQWdlbmRhbWVudG8sRXhjbHVpckFnZW5kYW1lbnRvLExpc3RhZ2VtQWdlbmRhbWVudG9zLEFjZXNzb1JlbGF0b3Jpb0VudHJhZGFTYWlkYSxBY2Vzc29SZWxhdG9yaW9BdGVuZGltZW50b3MsQWNlc3NvUmVsYXRvcmlvUmVzdW1vRGVSZW5kYSxBY2Vzc29SZWxhdG9yaW9WbENvbnRhc1BhZ2FyUG9yU2VtYW5hLEFjZXNzb1JlbGF0b3Jpb1ZsQ29udGFzUmVjZWJlclBvclNlbWFuYSxDYWRhc3RyYXJNZW5zYWdlbnNDbGllbnRlcyxBbHRlcmFyTWVuc2FnZW5zQ2xpZW50ZXMsRXhjbHVpck1lbnNhZ2Vuc0NsaWVudGVzLExpc3RhZ2VtTWVuc2FnZW5zQ2xpZW50ZXMsQWJyaXJDYWl4YSxGZWNoYXJDYWl4YSxDb25zdWx0YXJDYWl4YXMsQ29uc3VsdGFyVG9kb3NDYWl4YXMsUmVhYnJpckNhaXhhLENhZGFzdHJhclNhaWRhQ2FpeGEsQWx0ZXJhY2FvRXN0UHJvZFZlbmRhcyxMaXN0YWdlbUVzdFByb2RWZW5kYXMsTGlzdGFnZW1Qcm9kVmVuZGFzLExpc3RhZ2VtQXRlbmRBdnVsc29zLE9idGVyQXRlbmRpbWVudG8sT2J0ZXJHYW5ob3NQYXJjZWlybyxBbHRlcmFySW1hZ2VtUGVyZmlsIiwic3ViIjoiNzFjNjFiMWEtNDY1MC00NTQ2LTlkZTAtZjI0ZDdkYjUyYjA3IiwiZW1haWwiOiJ1c3VyZGV2QGdtYWlsLmNvbSIsImp0aSI6ImVmNDViNGY2LWNmNjYtNDViYi1iZDA0LWFiOTlhNjVlMmQ0ZSIsIm5iZiI6MTY4OTgwMTI0MCwiaWF0IjoxNjg5ODAxMjQwLCJpZFVzdWFyaW8iOiI0OCIsIm5vbWUiOiJVc3XDoXJpbyBBZG0gRGV2IiwibG9naW4iOiJpcm9uLnVzdXJhZG1kZXYiLCJ0aXBvRGVVc3VhcmlvIjoiQWRtaW5pc3RyYWRvciIsImltYWdlbSI6IiIsImFtYmllbnRlSWQiOiIzIiwiY2xpZW50ZUlkIjoiMyIsImNsaWVudGUiOiJJUk9OIE1BSURFTiIsImlkVXN1YXJpb051dmVtIjoiOSIsImV4cCI6MTY4OTgwODQ0MCwiaXNzIjoiQXBpSWRlbnRpZGFkZSIsImF1ZCI6Imh0dHBzOi8vYXBpLnNpbXBsZWJlYXV0eWFwcC5jb20uYnIifQ.TyhIBSNXy_RqKdq-K6R7HvleE2_itbF85RNolhrFREI',
    String? login = '',
    String? senha = '',
  }) {
    final body = '''
{
  "login": "${login}",
  "senha": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'autenticar',
      apiUrl: '${SimpleTechCopyGroup.baseUrl}/api/parceiros/autenticar',
      callType: ApiCallType.POST,
      headers: {
        ...SimpleTechCopyGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.data.accessToken''',
      );
  dynamic idUsuario(dynamic response) => getJsonField(
        response,
        r'''$.data.usuarioToken.idUsuario''',
      );
  dynamic cdgcliente(dynamic response) => getJsonField(
        response,
        r'''$.data.usuarioToken.clienteId''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.data.usuarioToken.email''',
      );
  dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.data.usuarioToken.nome''',
      );
  dynamic acessaParceiro(dynamic response) => getJsonField(
        response,
        r'''$.data.usuarioToken.podeAcessarAppParceiro''',
      );
}

class ObterFiliaisParceiroCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obter-filiais-parceiro',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/parceiros/obter-filiais-parceiro',
      callType: ApiCallType.GET,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AlterarImagemCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'alterar-imagem',
      apiUrl: '${SimpleTechCopyGroup.baseUrl}/api/parceiros/alterar-imagem',
      callType: ApiCallType.POST,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterServicosPorParceiroCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obter-servicos-por-parceiro',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/servicosporparceiros/obter-servicos-por-parceiro',
      callType: ApiCallType.GET,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterProdutosParaVendasCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'obter-produtos-para-vendas',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/produtosparavendas/obter-produtos-para-vendas',
      callType: ApiCallType.POST,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NovoCadastroCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'novo-cadastro',
      apiUrl: '${SimpleTechCopyGroup.baseUrl}/api/pedidos/novo-cadastro',
      callType: ApiCallType.POST,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterPorIdCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obter-por-id',
      apiUrl: '${SimpleTechCopyGroup.baseUrl}/api/pedidos/obter-por-id/30',
      callType: ApiCallType.GET,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class IniciarAtendimentoCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'iniciar-atendimento',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/atendimentos/iniciar-atendimento/4',
      callType: ApiCallType.PUT,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterAtendimentoCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'obter-atendimento',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/atendimentos/obter-atendimento',
      callType: ApiCallType.POST,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterAtendimentosAvulsosCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'obter-atendimentos-avulsos',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/atendimentos/obter-atendimentos-avulsos',
      callType: ApiCallType.POST,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterAtendimentoParaFinalizarCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obter-atendimento-para-finalizar',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/atendimentos/obter-atendimento-para-finalizar/45/9',
      callType: ApiCallType.GET,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FinalizarAtendimentoCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'finalizar-atendimento',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/atendimentos/finalizar-atendimento/4',
      callType: ApiCallType.PUT,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterAgendamentosParceiroCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? inicial = '',
    String? finaldate = '',
    int? filial,
  }) {
    final body = '''
{
  "dataInicial": "${inicial}",
  "dataFinal": "${finaldate}",
  "idDaFilial": ${filial}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'obter-agendamentos-parceiro',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/agendamentos/obter-agendamentos-parceiro',
      callType: ApiCallType.POST,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterGanhosParceiroCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'obter-ganhos-parceiro',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/ganhosparceiros/obter-ganhos-parceiro',
      callType: ApiCallType.POST,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObterPorCelularCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obter-por-celular',
      apiUrl:
          '${SimpleTechCopyGroup.baseUrl}/api/clientes/obter-por-celular/62991352281',
      callType: ApiCallType.GET,
      headers: {
        ...SimpleTechCopyGroup.headers,
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End SimpleTech Copy Group Code

/// Start identidade Group Code

class IdentidadeGroup {
  static String baseUrl = 'https://api.simplebeautyapp.com.br/identidade-dev';
  static Map<String, String> headers = {};
  static AlterarsenhaCall alterarsenhaCall = AlterarsenhaCall();
}

class AlterarsenhaCall {
  Future<ApiCallResponse> call({
    String? login = '',
    String? senha = '',
    String? confirmacao = '',
    String? anterior = '',
    int? tipo = 0,
  }) {
    final body = '''
{
  "login": "${login}",
  "senha": "${senha}",
  "senhaConfirmacao": "${confirmacao}",
  "senhaAnterior": "${anterior}",
  "tipoDeUsuario": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'alterarsenha',
      apiUrl: '${IdentidadeGroup.baseUrl}/api/auth/alterar-senha',
      callType: ApiCallType.POST,
      headers: {
        ...IdentidadeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic sucesso(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
}

/// End identidade Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
