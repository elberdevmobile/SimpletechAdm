import 'package:simple_adm/models/Agendamento.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import '../backend/schema/structs/serviopedido_struct.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comanda_model.dart';
export 'comanda_model.dart';

class ComandaWidget extends StatefulWidget {
  const ComandaWidget({
    Key? key,
    required this.agendamento,
  }) : super(key: key);

  final Agendamento agendamento;

  @override
  _ComandaWidgetState createState() => _ComandaWidgetState(this.agendamento);
}

class _ComandaWidgetState extends State<ComandaWidget>
    with TickerProviderStateMixin {
  late ComandaModel _model;
  final Agendamento agendamento;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 240.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 240.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 240.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  _ComandaWidgetState(this.agendamento);

  @override
  void initState() {
    startAtendimento(widget.agendamento.idDoAtendimento!,FFAppState().token);
    super.initState();
    _model = createModel(context, () => ComandaModel());

    if (FFAppState().listaservice.isEmpty) {
      for (int i = 0; i < widget.agendamento.servicos!.length; i++) {
        FFAppState().addToListaservice(ServiopedidoStruct(
          idDoServico: widget.agendamento.servicos![i]!.idDoServico,
          quantidadeDoServico: 1,
          descricaoServico: widget.agendamento.servicos![i]!.descricaoServico,
          valorComissaoServico: widget.agendamento.servicos![i]!.comissao,
          valorServico: widget.agendamento.servicos![i]!.valor,
        ));
      }
    }

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              FFAppState().listaProd.clear();FFAppState().listaservice.clear();
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 1.0),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'f5o1u2at' /* Suas Comandas */,
                                ),
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '371e22wk' /* Aqui você terá os detalhes do ... */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 44.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 5.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: Color(0xFF06235C),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 12.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  agendamento.cliente!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                ),
                                                StyledDivider(
                                                  thickness: 2.0,
                                                  color: Color(0xFF095E2D),
                                                  lineStyle:
                                                      DividerLineStyle.dashed,
                                                ),


                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          agendamento.valorServicos.toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation']!),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            ),
                          ),
                          // Generated code for this Column Widget...
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 32),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'p6x962i5' /* Produtos */,
                                    ),
                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'searchproducts',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType: PageTransitionType.fade,
                                        ),
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      width: 242,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Color(0x5100AEEF),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Color(0xFF00AEEF),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.add_circle,
                                                color: Color(0xFF00AEEF),
                                                size: 24,
                                              ),
                                              Text(
                                                FFLocalizations.of(context).getText(
                                                  '8341rlar' /* Adicionar */,
                                                ),
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Mulish',
                                                  color: Color(0xFF00AEEF),
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(height: 150,child:Builder(
                                builder: (context) {
                                  final lista =  FFAppState().listaProd;
                                  if (lista.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/no-results.png',
                                        width: 100,
                                        height: 100,
                                      ),
                                    );
                                  }
                                  return ListView.separated(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: lista.length,
                                    separatorBuilder: (_, __) => SizedBox(height: 8),
                                    itemBuilder: (context, listaIndex) {
                                      final listaItem = lista[listaIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1554519934-e32b1629d9ee?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxoYWlyfGVufDB8fHx8MTcwNjQxNjQ2Mnww&ixlib=rb-4.0.3&q=80&w=1080',
                                                    width: 45,
                                                    height: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Align(
                                                  alignment: AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment: AlignmentDirectional(-1, 0),
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                8, 8, 8, 8),
                                                            child: Text(
                                                              listaItem.nome,
                                                              style: FlutterFlowTheme.of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: AlignmentDirectional(-1, 0),
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                8, 8, 8, 8),
                                                            child: RichText(
                                                              textScaleFactor: MediaQuery.of(context)
                                                                  .textScaleFactor,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(context)
                                                                        .getText(
                                                                      'afzxdzcl' /* R$ */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                      fontFamily: 'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .success,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: listaItem.valorProduto.toString(),
                                                                    style: TextStyle(),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                  onTap: (){
                                                    FFAppState().listaProd.remove(listaItem);
                                                    setState(() {

                                                    });
                                                  },

                                                  child:Expanded(
                                                child: Align(
                                                  alignment: AlignmentDirectional(1, -1),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                    child: Icon(
                                                      Icons.remove_circle,
                                                      color: FlutterFlowTheme.of(context).alternate,
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              )),
                            ],
                          ),

                          // Generated code for this Column Widget...
                          SafeArea(
                              bottom: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 32),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'gunelbfe' /* Serviços */,
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'searchServices',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType: PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        width: 242,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: Color(0x5100AEEF),
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xFF00AEEF),
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.add_circle,
                                                  color: Color(0xFF00AEEF),
                                                  size: 24,
                                                ),
                                                Text(
                                                  FFLocalizations.of(context).getText(
                                                    'mo72ez5e' /* Adicionar */,
                                                  ),
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Mulish',
                                                    color: Color(0xFF00AEEF),
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Container(height: 200,child:Builder(
                                  builder: (context) {
                                    final lista = FFAppState().listaservice;
                                    if (FFAppState().listaservice == null || lista!.isEmpty ) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/no-results.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      );
                                    }
                                    return ListView.separated(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      shrinkWrap: true,
                                      primary: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: lista!.length,
                                      separatorBuilder: (_, __) => SizedBox(height: 8),
                                      itemBuilder: (context, listaIndex) {
                                        final listaItem = lista[listaIndex];
                                        return Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: Image.network(
                                                      'https://images.unsplash.com/photo-1554519934-e32b1629d9ee?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxoYWlyfGVufDB8fHx8MTcwNjQxNjQ2Mnww&ixlib=rb-4.0.3&q=80&w=1080',
                                                      width: 45,
                                                      height: 45,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Align(
                                                    alignment: AlignmentDirectional(-1, 0),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment: AlignmentDirectional(-1, 0),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                  8, 8, 8, 8),
                                                              child: Text(
                                                                listaItem!.descricaoServico ?? "",
                                                                style: FlutterFlowTheme.of(context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: AlignmentDirectional(-1, 0),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                  8, 8, 8, 8),
                                                              child: RichText(
                                                                textScaleFactor: MediaQuery.of(context)
                                                                    .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: "R\$",
                                                                      style: FlutterFlowTheme.of(
                                                                          context)
                                                                          .bodyMedium
                                                                          .override(
                                                                        fontFamily: 'Poppins',
                                                                        color: FlutterFlowTheme.of(
                                                                            context)
                                                                            .success,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: listaItem!.valorServico!.toString(),
                                                                      style: TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment: AlignmentDirectional(1, -1),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                      child: Icon(
                                                        Icons.remove_circle,
                                                        color: FlutterFlowTheme.of(context).alternate,
                                                        size: 35,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                )),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton:Stack(
    children: [
    // Outros widgets podem ser adicionados aqui
    Positioned(
    bottom: 16.0, // Ajuste conforme necessário
    right: MediaQuery.of(context).size.width * 0.25, // Ajuste conforme necessário
    child: ElevatedButton.icon(
          onPressed: _isLoading ? null : _onSubmit,
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16.0),backgroundColor: Colors.green),
          icon: _isLoading
              ? Container(
            width: 24,
            height: 24,
            padding: const EdgeInsets.all(2.0),
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          )
              : const Icon(Icons.cloud_upload_rounded,color: Colors.white,),
          label: const Text('Finalizar Atendimento',style: TextStyle(color: Colors.white),),
        ),

      ),
        ]
      ),
      )
    );
  }

  void _onSubmit() {
    setState(() => _isLoading = true);
    Future.delayed(
      const Duration(seconds: 2),
          () {
            sendFlutterRequest();

          }
    );
  }
  void sendFlutterRequest() async {
    const url = 'https://api.simplebeautyapp.com.br/parceiro-dev/api/pedidos/novo-cadastro';
    final token = FFAppState().token;
    final Map<String, dynamic> requestData = {

      "idDoAtendimento": widget.agendamento.idDoAtendimento,
      "idDoParceiro": FFAppState().idUsuarioNuvem ,
      "idDaFilial": 1,
      "idDoCliente": widget.agendamento.idDoCliente,
      "percentualDescontoPedido": 0,
      "produtos": FFAppState().listaProd .map((prod) => prod.toMap()).toList(),
      "servicos": FFAppState().listaservice?.toList().map((serv) => serv.toMap()).toList(),
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      setState(() => _isLoading = false);

      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Show!!'),
            content: Text('Atendimento finalizado com sucesso!'),
            actions: [
              TextButton(
                onPressed: ()
          {
            FFAppState().listaProd.clear();FFAppState().listaservice.clear();
            FFAppState().listaservice.clear();
            context.pop();
            context.goNamed("Home");

          },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      print('Request successful');
      print('Response: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }

  void startAtendimento(int atendimentoId, String token) async {
    final url = 'https://api.simplebeautyapp.com.br/parceiro-dev/api/atendimentos/iniciar-atendimento/$atendimentoId';

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('Atendimento started successfully');
        print('Response: ${response.body}');
      } else {
        print('Failed to start atendimento. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void _showLoadingOverlay() {
    setState(() {
      _isLoading = true;
      OverlayEntry overlayEntry;
      overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          bottom: 80.0,
          right: 16.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      );
      Overlay.of(context)!.insert(overlayEntry);

      // Save overlay entry so we can remove it later
      _overlayEntry = overlayEntry;
    });
  }

  void _hideLoadingOverlay() {
    setState(() {
      _isLoading = false;
      _overlayEntry?.remove();
    });
  }

  OverlayEntry? _overlayEntry;
  bool _isLoading = false;
}
