import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'loginecadastro_widget.dart' show LoginecadastroWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginecadastroModel extends FlutterFlowModel<LoginecadastroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for nomecompletoCAD widget.
  FocusNode? nomecompletoCADFocusNode;
  TextEditingController? nomecompletoCADController;
  String? Function(BuildContext, String?)? nomecompletoCADControllerValidator;
  // State field(s) for emailAddressCAD widget.
  FocusNode? emailAddressCADFocusNode;
  TextEditingController? emailAddressCADController;
  String? Function(BuildContext, String?)? emailAddressCADControllerValidator;
  // State field(s) for passwordCAD widget.
  FocusNode? passwordCADFocusNode;
  TextEditingController? passwordCADController;
  late bool passwordCADVisibility;
  String? Function(BuildContext, String?)? passwordCADControllerValidator;
  // State field(s) for passwordCADconfim widget.
  FocusNode? passwordCADconfimFocusNode1;
  TextEditingController? passwordCADconfimController1;
  late bool passwordCADconfimVisibility1;
  String? Function(BuildContext, String?)?
      passwordCADconfimController1Validator;
  // State field(s) for passwordCADconfim widget.
  FocusNode? passwordCADconfimFocusNode2;
  TextEditingController? passwordCADconfimController2;
  late bool passwordCADconfimVisibility2;
  String? Function(BuildContext, String?)?
      passwordCADconfimController2Validator;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateController;
  String? Function(BuildContext, String?)?
      emailAddressCreateControllerValidator;
  // State field(s) for password_create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordCADVisibility = false;
    passwordCADconfimVisibility1 = false;
    passwordCADconfimVisibility2 = false;
    passwordCreateVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    nomecompletoCADFocusNode?.dispose();
    nomecompletoCADController?.dispose();

    emailAddressCADFocusNode?.dispose();
    emailAddressCADController?.dispose();

    passwordCADFocusNode?.dispose();
    passwordCADController?.dispose();

    passwordCADconfimFocusNode1?.dispose();
    passwordCADconfimController1?.dispose();

    passwordCADconfimFocusNode2?.dispose();
    passwordCADconfimController2?.dispose();

    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
