import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future<dynamic> auth(
  BuildContext context, {
  required String? login,
  required String? senha,
}) async {
  ApiCallResponse? resultadoLogin;

  resultadoLogin = await SimpleTechCopyGroup.autenticarCall.call(
    login: login,
    senha: senha,
  );
  if ((resultadoLogin?.succeeded ?? true)) {
    return (resultadoLogin?.jsonBody ?? '');
  }

  return getJsonField(
    (resultadoLogin?.jsonBody ?? ''),
    r'''$''',
  );
}
