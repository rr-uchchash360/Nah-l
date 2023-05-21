import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for inputEmail widget.
  TextEditingController? inputEmailController1;
  String? Function(BuildContext, String?)? inputEmailController1Validator;
  // State field(s) for inputEmail widget.
  TextEditingController? inputEmailController2;
  String? Function(BuildContext, String?)? inputEmailController2Validator;
  // State field(s) for inputPassword widget.
  TextEditingController? inputPasswordController;
  late bool inputPasswordVisibility;
  String? Function(BuildContext, String?)? inputPasswordControllerValidator;
  // State field(s) for confirmPassword widget.
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputPasswordVisibility = false;
    confirmPasswordVisibility = false;
  }

  void dispose() {
    inputEmailController1?.dispose();
    inputEmailController2?.dispose();
    inputPasswordController?.dispose();
    confirmPasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}
