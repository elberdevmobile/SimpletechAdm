import 'package:flutter/scheduler.dart';

import '../backend/api_requests/api_calls.dart';
import '/components/bar_home_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';
class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.agendamentos =
      await SimpleTechCopyGroup.obterAgendamentosParceiroCall.call(
        bearerAuth: FFAppState().token,
        inicial: formatarDataAtual(),
        finaldate: formatarDataAtualMais7Dias(),
        filial: 3,
      );
      if ((_model.agendamentos?.succeeded ?? true) &&
          jsonEncode(_model.agendamentos!.jsonBody).isNotEmpty) {
        FFAppState().agenda =
            jsonEncode(_model.agendamentos!.jsonBody);
        setState(() {_model.agendamentos!.jsonBody;});
      }
    });
  }

  String formatarDataAtual() {
    DateTime agora = DateTime.now();
    DateFormat formato = DateFormat('yyyy-MM-dd');
    String dataFormatada = formato.format(agora);
    return dataFormatada;
  }

  String formatarDataAtualMais7Dias() {
    DateTime agora = DateTime.now();
    DateTime dataMais7Dias = agora.add(Duration(days: 7));
    DateFormat formato = DateFormat('yyyy-MM-dd');
    String dataFormatada = formato.format(dataMais7Dias);
    return dataFormatada;
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.barHomeModel,
                updateCallback: () => setState(() {}),
                child: BarHomeWidget(
                  nome: FFAppState().nomeuser,
                ),
              ),

              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('comanda');
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.7397,
                  child: _model.agendamentos != null
                      ? custom_widgets.Schedule(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.7397,
                    lista: _model.agendamentos!.jsonBody.length > 0
                        ? _model.agendamentos!.jsonBody
                        : [],
                  )
                      : SpinKitFadingCircle(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}