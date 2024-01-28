import '/backend/api_requests/api_calls.dart';
import '/components/newmodule_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'searchproducts_widget.dart' show SearchproductsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchproductsModel extends FlutterFlowModel<SearchproductsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (obterprodutos)] action in searchproducts widget.
  ApiCallResponse? produtos;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for newmodule dynamic component.
  late FlutterFlowDynamicModels<NewmoduleModel> newmoduleModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    newmoduleModels = FlutterFlowDynamicModels(() => NewmoduleModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    newmoduleModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
