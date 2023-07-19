import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotpassModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController2;
  late bool emailAddressVisibility;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  // State field(s) for pass widget.
  TextEditingController? passController;
  late bool passVisibility;
  String? Function(BuildContext, String?)? passControllerValidator;
  // State field(s) for passconfirm widget.
  TextEditingController? passconfirmController;
  late bool passconfirmVisibility;
  String? Function(BuildContext, String?)? passconfirmControllerValidator;
  // Stores action output result for [Backend Call - API (alterarsenha)] action in Button widget.
  ApiCallResponse? alteracaosenha;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailAddressVisibility = false;
    passVisibility = false;
    passconfirmVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressController1?.dispose();
    emailAddressController2?.dispose();
    passController?.dispose();
    passconfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
