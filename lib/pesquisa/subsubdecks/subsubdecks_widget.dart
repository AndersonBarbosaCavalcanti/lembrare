import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subsubdecks_model.dart';
export 'subsubdecks_model.dart';

class SubsubdecksWidget extends StatefulWidget {
  const SubsubdecksWidget({
    super.key,
    required this.subcode,
    required this.deckcode,
  });

  final String? subcode;
  final String? deckcode;

  @override
  State<SubsubdecksWidget> createState() => _SubsubdecksWidgetState();
}

class _SubsubdecksWidgetState extends State<SubsubdecksWidget> {
  late SubsubdecksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubsubdecksModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.17,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.1,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/2rg4v_&.jpg',
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.12,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 0.0,
                                    buttonSize: 100.0,
                                    fillColor: Colors.transparent,
                                    icon: Icon(
                                      Icons.keyboard_return,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed(
                                        'subdecks',
                                        queryParameters: {
                                          'deckcode': serializeParam(
                                            widget.deckcode,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 0.0,
                                      buttonSize: 100.0,
                                      fillColor: Colors.transparent,
                                      icon: Icon(
                                        Icons.home,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('menu');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.05,
                      height: MediaQuery.sizeOf(context).height * 0.83,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: MediaQuery.sizeOf(context).height * 0.83,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: StreamBuilder<List<SubRecord>>(
                        stream: querySubRecord(
                          queryBuilder: (subRecord) => subRecord
                              .where(
                                'subcode',
                                isEqualTo: widget.subcode,
                              )
                              .where(
                                'desativado',
                                isEqualTo: false,
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRipple(
                                  color: Color(0xFF087C08),
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<SubRecord> columnSubRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final columnSubRecord = columnSubRecordList.isNotEmpty
                              ? columnSubRecordList.first
                              : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StreamBuilder<List<DeckRecord>>(
                                stream: queryDeckRecord(
                                  queryBuilder: (deckRecord) =>
                                      deckRecord.where(
                                    'deckcode',
                                    isEqualTo: widget.deckcode,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitRipple(
                                          color: Color(0xFF087C08),
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<DeckRecord> textDeckRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final textDeckRecord =
                                      textDeckRecordList.isNotEmpty
                                          ? textDeckRecordList.first
                                          : null;
                                  return Text(
                                    'Subdeck: ${columnSubRecord?.subnome}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  );
                                },
                              ),
                              Text(
                                ' ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF154315),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                ' ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF154315),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: ' Nome...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.subsubigual =
                                          await querySubsubRecordOnce(
                                        queryBuilder: (subsubRecord) =>
                                            subsubRecord
                                                .where(
                                                  'subsubnome',
                                                  isEqualTo: _model
                                                      .textController.text,
                                                )
                                                .where(
                                                  'subcode',
                                                  isEqualTo: widget.subcode,
                                                )
                                                .where(
                                                  'desativado',
                                                  isEqualTo: false,
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.subsubigual != null) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Este nome já está em uso'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        var subsubRecordReference =
                                            SubsubRecord.collection.doc();
                                        await subsubRecordReference
                                            .set(createSubsubRecordData(
                                          subcode: widget.subcode,
                                          subsubnome:
                                              _model.textController.text,
                                          desativado: false,
                                        ));
                                        _model.subsubnovo =
                                            SubsubRecord.getDocumentFromData(
                                                createSubsubRecordData(
                                                  subcode: widget.subcode,
                                                  subsubnome: _model
                                                      .textController.text,
                                                  desativado: false,
                                                ),
                                                subsubRecordReference);

                                        await _model.subsubnovo!.reference
                                            .update(createSubsubRecordData(
                                          subsubcode:
                                              _model.subsubnovo?.reference.id,
                                        ));
                                        setState(() {
                                          _model.textController?.clear();
                                        });
                                      }

                                      setState(() {});
                                    },
                                    text: '   Adicionar novo assunto   ',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                ' ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF154315),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                ' ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF154315),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              StreamBuilder<List<SubsubRecord>>(
                                stream: querySubsubRecord(
                                  queryBuilder: (subsubRecord) => subsubRecord
                                      .where(
                                        'subcode',
                                        isEqualTo: columnSubRecord?.subcode,
                                      )
                                      .where(
                                        'desativado',
                                        isEqualTo: false,
                                      ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitRipple(
                                          color: Color(0xFF087C08),
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<SubsubRecord> listViewSubsubRecordList =
                                      snapshot.data!;
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewSubsubRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 15.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewSubsubRecord =
                                          listViewSubsubRecordList[
                                              listViewIndex];
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  offset: Offset(0.0, 0.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                              border: Border.all(
                                                width: 1.0,
                                              ),
                                            ),
                                            child: FutureBuilder<int>(
                                              future: queryQuestRecordCount(
                                                queryBuilder: (questRecord) =>
                                                    questRecord.where(
                                                  'subsubcode',
                                                  isEqualTo:
                                                      listViewSubsubRecord
                                                          .subsubcode,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitRipple(
                                                        color:
                                                            Color(0xFF087C08),
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                int listTileCount =
                                                    snapshot.data!;
                                                return ListTile(
                                                  title: Text(
                                                    listViewSubsubRecord
                                                        .subsubnome,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge,
                                                  ),
                                                  subtitle: Text(
                                                    '    ${listTileCount.toString()}${listTileCount == 1 ? ' questão' : ' questões'}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                  trailing: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  dense: false,
                                                );
                                              },
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                'questoes1',
                                                queryParameters: {
                                                  'deckcode': serializeParam(
                                                    widget.deckcode,
                                                    ParamType.String,
                                                  ),
                                                  'subcode': serializeParam(
                                                    widget.subcode,
                                                    ParamType.String,
                                                  ),
                                                  'subsubcode': serializeParam(
                                                    listViewSubsubRecord
                                                        .subsubcode,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
                                            },
                                            text: ' ',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 67.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00087C08),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              Text(
                                ' ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF154315),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                ' ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF154315),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Desativar subdeck?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                                  if (confirmDialogResponse) {
                                    _model.subdesat = await querySubRecordOnce(
                                      queryBuilder: (subRecord) =>
                                          subRecord.where(
                                        'subcode',
                                        isEqualTo: widget.subcode,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);

                                    await _model.subdesat!.reference
                                        .update(createSubRecordData(
                                      desativado: true,
                                    ));
                                    context.safePop();
                                  }

                                  setState(() {});
                                },
                                text: '   Desativar subdeck   ',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].addToStart(SizedBox(height: 10.0)),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.05,
                      height: MediaQuery.sizeOf(context).height * 0.83,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
