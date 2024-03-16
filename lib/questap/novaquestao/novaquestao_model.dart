import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'novaquestao_widget.dart' show NovaquestaoWidget;
import 'package:flip_card/flip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NovaquestaoModel extends FlutterFlowModel<NovaquestaoWidget> {
  ///  Local state fields for this page.

  int tipo = 0;

  FFUploadedFile? imagemPERGUNTA;

  FFUploadedFile? imagemRESPOSTA;

  int rep = 0;

  bool pergunta = false;

  bool resposta = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for explica1 widget.
  FocusNode? explica1FocusNode;
  TextEditingController? explica1Controller;
  String? Function(BuildContext, String?)? explica1ControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TXT widget.
  FocusNode? txtFocusNode;
  TextEditingController? txtController;
  String? Function(BuildContext, String?)? txtControllerValidator;
  // State field(s) for TXT1 widget.
  FocusNode? txt1FocusNode;
  TextEditingController? txt1Controller;
  String? Function(BuildContext, String?)? txt1ControllerValidator;
  // State field(s) for TXT2 widget.
  FocusNode? txt2FocusNode;
  TextEditingController? txt2Controller;
  String? Function(BuildContext, String?)? txt2ControllerValidator;
  // State field(s) for TXT3 widget.
  FocusNode? txt3FocusNode;
  TextEditingController? txt3Controller;
  String? Function(BuildContext, String?)? txt3ControllerValidator;
  // State field(s) for TXT4 widget.
  FocusNode? txt4FocusNode;
  TextEditingController? txt4Controller;
  String? Function(BuildContext, String?)? txt4ControllerValidator;
  // State field(s) for TXT5 widget.
  FocusNode? txt5FocusNode;
  TextEditingController? txt5Controller;
  String? Function(BuildContext, String?)? txt5ControllerValidator;
  // State field(s) for TXT6 widget.
  FocusNode? txt6FocusNode;
  TextEditingController? txt6Controller;
  String? Function(BuildContext, String?)? txt6ControllerValidator;
  // State field(s) for TXT7 widget.
  FocusNode? txt7FocusNode;
  TextEditingController? txt7Controller;
  String? Function(BuildContext, String?)? txt7ControllerValidator;
  // State field(s) for TXT8 widget.
  FocusNode? txt8FocusNode;
  TextEditingController? txt8Controller;
  String? Function(BuildContext, String?)? txt8ControllerValidator;
  // State field(s) for TXT9 widget.
  FocusNode? txt9FocusNode;
  TextEditingController? txt9Controller;
  String? Function(BuildContext, String?)? txt9ControllerValidator;
  // State field(s) for TXT10 widget.
  FocusNode? txt10FocusNode;
  TextEditingController? txt10Controller;
  String? Function(BuildContext, String?)? txt10ControllerValidator;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for esplica2 widget.
  FocusNode? esplica2FocusNode;
  TextEditingController? esplica2Controller;
  String? Function(BuildContext, String?)? esplica2ControllerValidator;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Slideresse2 widget.
  double? slideresse2Value;
  // State field(s) for TextField31 widget.
  FocusNode? textField31FocusNode;
  TextEditingController? textField31Controller;
  String? Function(BuildContext, String?)? textField31ControllerValidator;
  // State field(s) for TextField32 widget.
  FocusNode? textField32FocusNode;
  TextEditingController? textField32Controller;
  String? Function(BuildContext, String?)? textField32ControllerValidator;
  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController21;
  String? Function(BuildContext, String?)? textController21Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController22;
  String? Function(BuildContext, String?)? textController22Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController23;
  String? Function(BuildContext, String?)? textController23Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController24;
  String? Function(BuildContext, String?)? textController24Validator;
  // State field(s) for explica3 widget.
  FocusNode? explica3FocusNode;
  TextEditingController? explica3Controller;
  String? Function(BuildContext, String?)? explica3ControllerValidator;
  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Slideresse3 widget.
  double? slideresse3Value;
  bool isDataUploading7 = false;
  FFUploadedFile uploadedLocalFile7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl7 = '';

  bool isDataUploading8 = false;
  FFUploadedFile uploadedLocalFile8 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl8 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuestRecord? questdentro1;
  bool isDataUploading9 = false;
  FFUploadedFile uploadedLocalFile9 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl9 = '';

  bool isDataUploading10 = false;
  FFUploadedFile uploadedLocalFile10 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl10 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuestRecord? questdentro2;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuestRecord? questdentro3;
  bool isDataUploading11 = false;
  FFUploadedFile uploadedLocalFile11 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl11 = '';

  bool isDataUploading12 = false;
  FFUploadedFile uploadedLocalFile12 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl12 = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    explica1FocusNode?.dispose();
    explica1Controller?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    textFieldFocusNode5?.dispose();
    textController6?.dispose();

    txtFocusNode?.dispose();
    txtController?.dispose();

    txt1FocusNode?.dispose();
    txt1Controller?.dispose();

    txt2FocusNode?.dispose();
    txt2Controller?.dispose();

    txt3FocusNode?.dispose();
    txt3Controller?.dispose();

    txt4FocusNode?.dispose();
    txt4Controller?.dispose();

    txt5FocusNode?.dispose();
    txt5Controller?.dispose();

    txt6FocusNode?.dispose();
    txt6Controller?.dispose();

    txt7FocusNode?.dispose();
    txt7Controller?.dispose();

    txt8FocusNode?.dispose();
    txt8Controller?.dispose();

    txt9FocusNode?.dispose();
    txt9Controller?.dispose();

    txt10FocusNode?.dispose();
    txt10Controller?.dispose();

    esplica2FocusNode?.dispose();
    esplica2Controller?.dispose();

    textField31FocusNode?.dispose();
    textField31Controller?.dispose();

    textField32FocusNode?.dispose();
    textField32Controller?.dispose();

    textFieldFocusNode6?.dispose();
    textController21?.dispose();

    textFieldFocusNode7?.dispose();
    textController22?.dispose();

    textFieldFocusNode8?.dispose();
    textController23?.dispose();

    textFieldFocusNode9?.dispose();
    textController24?.dispose();

    explica3FocusNode?.dispose();
    explica3Controller?.dispose();
  }

  /// Action blocks are added here.

  Future subirpergunta(BuildContext context) async {}

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
