import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'codigos_widget.dart' show CodigosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CodigosModel extends FlutterFlowModel<CodigosWidget> {
  ///  Local state fields for this page.

  List<String> codigos = [];
  void addToCodigos(String item) => codigos.add(item);
  void removeFromCodigos(String item) => codigos.remove(item);
  void removeAtIndexFromCodigos(int index) => codigos.removeAt(index);
  void insertAtIndexInCodigos(int index, String item) =>
      codigos.insert(index, item);
  void updateCodigosAtIndex(int index, Function(String) updateFn) =>
      codigos[index] = updateFn(codigos[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown10 widget.
  String? dropDown10Value;
  FormFieldController<String>? dropDown10ValueController;
  // State field(s) for DropDown11 widget.
  String? dropDown11Value;
  FormFieldController<String>? dropDown11ValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CredenciaisRecord? doc1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CredenciaisRecord? doc2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CredenciaisRecord? doc3;
  // State field(s) for TextFieldnro widget.
  FocusNode? textFieldnroFocusNode;
  TextEditingController? textFieldnroController;
  String? Function(BuildContext, String?)? textFieldnroControllerValidator;
  // State field(s) for DropDown20 widget.
  String? dropDown20Value;
  FormFieldController<String>? dropDown20ValueController;
  // State field(s) for DropDown21 widget.
  String? dropDown21Value;
  FormFieldController<String>? dropDown21ValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  EscolaRecord? escolaaqui;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CredenciaisRecord? aqui1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CredenciaisRecord? aqui2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CredenciaisRecord? aqui3;
  // State field(s) for TextField4 widget.
  FocusNode? textField4FocusNode;
  TextEditingController? textField4Controller;
  String? Function(BuildContext, String?)? textField4ControllerValidator;
  // State field(s) for TextField5 widget.
  FocusNode? textField5FocusNode;
  TextEditingController? textField5Controller;
  String? Function(BuildContext, String?)? textField5ControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldnroFocusNode?.dispose();
    textFieldnroController?.dispose();

    textField4FocusNode?.dispose();
    textField4Controller?.dispose();

    textField5FocusNode?.dispose();
    textField5Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
