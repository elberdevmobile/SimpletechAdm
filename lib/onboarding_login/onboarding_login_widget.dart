import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_login_model.dart';
export 'onboarding_login_model.dart';

class OnboardingLoginWidget extends StatefulWidget {
  const OnboardingLoginWidget({Key? key}) : super(key: key);

  @override
  _OnboardingLoginWidgetState createState() => _OnboardingLoginWidgetState();
}

class _OnboardingLoginWidgetState extends State<OnboardingLoginWidget> {
  late OnboardingLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingLoginModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF0E1647), Color(0xFF0A1033)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(1.0, 0.34),
                                end: AlignmentDirectional(-1.0, -0.34),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 20.0),
                                    child: Image.asset(
                                      'assets/images/device.png',
                                      width: 290.0,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 8.0, 15.0, 24.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '5vdf9hdx' /* Bem vindo ao Simple adm! O seu... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: ' SF Pro Display',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      21.0, 0.0, 30.0, 25.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'y6wstwiv' /* Aqui você irá gerenciar sua ag... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: ' SF Pro Display',
                                      color: Color(0xC8FFFFFF),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 28.0, 80.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ij31y7vr' /* Avançar */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: ' SF Pro Display',
                                            color: Color(0xC8FFFFFF),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF0E1647), Color(0xFF0A1033)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(1.0, 0.34),
                                end: AlignmentDirectional(-1.0, -0.34),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 113.0, 15.0, 24.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'vbeyku87' /* Calendário dinâmico, sua agend... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: ' SF Pro Display',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      21.0, 0.0, 30.0, 25.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '3wgqkhm0' /* Uma linha do tempo, mostrando ... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: ' SF Pro Display',
                                      color: Color(0xC8FFFFFF),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 0.2),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 28.0, 36.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'f6z3c9eg' /* Avançar */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: ' SF Pro Display',
                                            color: Color(0xC8FFFFFF),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/new.png',
                                      width: 290.0,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF0E1647), Color(0xFF0A1033)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(1.0, 0.34),
                                end: AlignmentDirectional(-1.0, -0.34),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 20.0),
                                    child: Image.asset(
                                      'assets/images/outra.png',
                                      width: 290.0,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 8.0, 15.0, 24.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'osewqdig' /* Sem comandas de papeis, adotam... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: ' SF Pro Display',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      21.0, 0.0, 30.0, 25.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'zdxnhhr9' /* A funcionalidade faz a leitura... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: ' SF Pro Display',
                                      color: Color(0xC8FFFFFF),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 28.0, 79.5),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('Logininit');
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '1w4n3fab' /* Concluir */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: ' SF Pro Display',
                                            color: Color(0xC8FFFFFF),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.86, 0.84),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: smooth_page_indicator.SlideEffect(
                              spacing: 8.0,
                              radius: 100.0,
                              dotWidth: 8.0,
                              dotHeight: 8.0,
                              dotColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              activeDotColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
