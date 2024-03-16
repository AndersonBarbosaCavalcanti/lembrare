import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mover_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'questoes1_widget.dart' show Questoes1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Questoes1Model extends FlutterFlowModel<Questoes1Widget> {
  ///  Local state fields for this page.

  String? questaoref;

  List<String> listaquests = [];
  void addToListaquests(String item) => listaquests.add(item);
  void removeFromListaquests(String item) => listaquests.remove(item);
  void removeAtIndexFromListaquests(int index) => listaquests.removeAt(index);
  void insertAtIndexInListaquests(int index, String item) =>
      listaquests.insert(index, item);
  void updateListaquestsAtIndex(int index, Function(String) updateFn) =>
      listaquests[index] = updateFn(listaquests[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in questoes1 widget.
  List<QuestRecord>? questoes1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SubsubRecord? subsubdesat;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<QuestRecord>? questoes3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<QuestRecord>? questoes2;

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
