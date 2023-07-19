import '/components/bar_home_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
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
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.barHomeModel,
                updateCallback: () => setState(() {}),
                child: BarHomeWidget(),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x230E151B),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                    ),
                    child: FlutterFlowCalendar(
                      color: Color(0xFF0A1033),
                      iconColor: Colors.black,
                      weekFormat: true,
                      weekStartsMonday: true,
                      initialDate: getCurrentTimestamp,
                      rowHeight: 80.0,
                      onChange: (DateTimeRange? newSelectedDate) {
                        setState(
                            () => _model.calendarSelectedDay = newSelectedDate);
                      },
                      titleStyle: FlutterFlowTheme.of(context).titleMedium,
                      dayOfWeekStyle: FlutterFlowTheme.of(context).bodySmall,
                      dateStyle: FlutterFlowTheme.of(context).bodyMedium,
                      selectedDateStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      inactiveDateStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Poppins',
                                color: Color(0x6B57636C),
                              ),
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: custom_widgets.Schedule(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
