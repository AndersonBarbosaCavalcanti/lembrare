import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'arvore_deckdesativado_widget.dart' show ArvoreDeckdesativadoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArvoreDeckdesativadoModel
    extends FlutterFlowModel<ArvoreDeckdesativadoWidget> {
  ///  Local state fields for this page.

  List<String> listacodes = [];
  void addToListacodes(String item) => listacodes.add(item);
  void removeFromListacodes(String item) => listacodes.remove(item);
  void removeAtIndexFromListacodes(int index) => listacodes.removeAt(index);
  void insertAtIndexInListacodes(int index, String item) =>
      listacodes.insert(index, item);
  void updateListacodesAtIndex(int index, Function(String) updateFn) =>
      listacodes[index] = updateFn(listacodes[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<SubRecord>? excluirsubs3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<SubsubRecord>? escluisubsubs3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<QuestRecord>? excluiquests3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
