import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'newmodule_services_model.dart';
export 'newmodule_services_model.dart';

class NewmoduleServicesWidget extends StatefulWidget {
  const NewmoduleServicesWidget({
    super.key,
    required this.name,
    required this.marca,
    required this.value,
    required this.link,
    required this.idDoServico,
    required this.valorComissaoServico,required this.descricaoServico,
  });

  final String? name;
  final String? marca;
  final double? value;
  final String? link;
  final int? idDoServico;
  final double? valorComissaoServico;final String? descricaoServico;

  @override
  State<NewmoduleServicesWidget> createState() =>
      _NewmoduleServicesWidgetState();
}

class _NewmoduleServicesWidgetState extends State<NewmoduleServicesWidget>
    with TickerProviderStateMixin {
  late NewmoduleServicesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewmoduleServicesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: FlutterFlowTheme.of(context).primaryBackground,
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.no_accounts),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.name,
                          'Carregando...',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "",
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'R\$ ${widget.value?.toString()}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Container(
                  width: 100.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 2.0,
                    ),
                  ),
                  child: FlutterFlowCountController(
                    decrementIconBuilder: (enabled) => FaIcon(
                      FontAwesomeIcons.minus,
                      color: enabled
                          ? FlutterFlowTheme.of(context).secondaryText
                          : FlutterFlowTheme.of(context).alternate,
                      size: 15.0,
                    ),
                    incrementIconBuilder: (enabled) => FaIcon(
                      FontAwesomeIcons.plus,
                      color: enabled
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).alternate,
                      size: 15.0,
                    ),
                    countBuilder: (count) => Text(
                      count.toString(),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                          ),
                    ),
                    count: _model.countControllerValue ??= 0,
                    updateCount: (count) async {
                      setState(() => _model.countControllerValue = count);
                      setState(() {

                        if (FFAppState().listaservice.isEmpty || !FFAppState().listaservice.contains(ServiopedidoStruct(
                            idDoServico: widget.idDoServico!,
                            quantidadeDoServico: _model
                                .countControllerValue,
                            valorComissaoServico: widget
                                .valorComissaoServico,
                            valorServico: widget.value,
                            descricaoServico: widget.descricaoServico
                        ))) {
                          try {
                            FFAppState().addToListaservice(ServiopedidoStruct(
                                idDoServico: widget.idDoServico!,
                                quantidadeDoServico: _model
                                    .countControllerValue,
                                valorComissaoServico: widget
                                    .valorComissaoServico,
                                valorServico: widget.value,
                                descricaoServico: widget.descricaoServico
                            ));
                          }catch(e){
                            FFAppState().updateListaserviceAtIndex(
                              widget.idDoServico!,
                                  (e) => e
                                ..idDoServico = widget.idDoServico
                                ..quantidadeDoServico = _model.countControllerValue
                                ..valorComissaoServico = widget.valorComissaoServico
                                ..descricaoServico = widget.descricaoServico
                                ..valorServico = widget.value,
                            );
                          }
                        } else { FFAppState().updateListaserviceAtIndex(
                          widget.idDoServico!,
                              (e) => e
                            ..idDoServico = widget.idDoServico
                            ..quantidadeDoServico = _model.countControllerValue
                            ..valorComissaoServico = widget.valorComissaoServico
                            ..descricaoServico = widget.descricaoServico
                            ..valorServico = widget.value,
                        );
                        }

                      });
                    },
                    stepSize: 1,
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
