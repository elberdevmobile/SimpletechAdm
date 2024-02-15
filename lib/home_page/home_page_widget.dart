import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      if (FFAppState().logged == true) {
        _model.auth = await action_blocks.auth(
          context,
          login: FFAppState().login,
          senha: FFAppState().senha,
        );
        if (getJsonField(
              _model.auth,
              r'''$.success''',
            ) ==
            true) {
          FFAppState().token = getJsonField(
            _model.auth,
            r'''$.data.accessToken''',
          ).toString().toString();
          FFAppState().idUsuarioNuvem = _model.auth['data']['usuarioToken']['claims']
              .firstWhere((claim) => claim['type'] == 'idUsuarioNuvem', orElse: () => null)?
          ['value'];
          FFAppState().user = _model.auth!;
          FFAppState().logged = true;
          FFAppState().nomeuser = getJsonField(
            _model.auth,
            r'''$.data.usuarioToken.nome''',
          ).toString().toString();

          FFAppState().email = getJsonField(
            _model.auth,
            r'''$.data.usuarioToken.email''',
          ).toString();

          context.pushNamed(
            'Home',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.scale,
                alignment: Alignment.bottomCenter,
              ),
            },
          );
        }
      } else {
        context.pushNamed('OnboardingLogin');
      }
    });
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
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0E1647), Color(0xFF0A1033)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.34, -1.0),
                end: AlignmentDirectional(-0.34, 1.0),
              ),
            ),
            child: SvgPicture.asset(
              'assets/images/Camada_3_(1).svg',
              width: 152.0,
              height: 51.0,
              fit: BoxFit.none,
            ),
          ),
        ),
      ),
    );
  }
}
