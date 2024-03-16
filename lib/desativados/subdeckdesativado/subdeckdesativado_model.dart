import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'subdeckdesativado_widget.dart' show SubdeckdesativadoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubdeckdesativadoModel extends FlutterFlowModel<SubdeckdesativadoWidget> {
  ///  Local state fields for this page.

  List<String> listadecks = [];
  void addToListadecks(String item) => listadecks.add(item);
  void removeFromListadecks(String item) => listadecks.remove(item);
  void removeAtIndexFromListadecks(int index) => listadecks.removeAt(index);
  void insertAtIndexInListadecks(int index, String item) =>
      listadecks.insert(index, item);
  void updateListadecksAtIndex(int index, Function(String) updateFn) =>
      listadecks[index] = updateFn(listadecks[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in subdeckdesativado widget.
  List<SubRecord>? subdesativado;

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
