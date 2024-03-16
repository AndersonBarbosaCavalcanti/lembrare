import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mover_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'questoes1_model.dart';
export 'questoes1_model.dart';

class Questoes1Widget extends StatefulWidget {
  const Questoes1Widget({
    super.key,
    required this.deckcode,
    required this.subcode,
    required this.subsubcode,
  });

  final String? deckcode;
  final String? subcode;
  final String? subsubcode;

  @override
  State<Questoes1Widget> createState() => _Questoes1WidgetState();
}

class _Questoes1WidgetState extends State<Questoes1Widget> {
  late Questoes1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Questoes1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.questoes1 = await queryQuestRecordOnce(
        queryBuilder: (questRecord) => questRecord
            .where(
              'subsubcode',
              isEqualTo: widget.subsubcode,
            )
            .where(
              'desativado',
              isEqualTo: false,
            ),
      );
      setState(() {
        _model.listaquests = functions
            .extraiquestcode(_model.questoes1!.toList())
            .toList()
            .cast<String>();
      });
      setState(() {
        _model.questaoref = _model.listaquests.first;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SubsubRecord>>(
      stream: querySubsubRecord(
        queryBuilder: (subsubRecord) => subsubRecord.where(
          'subsubcode',
          isEqualTo: widget.subsubcode,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: Color(0xFF087C08),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<SubsubRecord> questoes1SubsubRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final questoes1SubsubRecord = questoes1SubsubRecordList.isNotEmpty
            ? questoes1SubsubRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            endDrawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.5,
              child: Drawer(
                elevation: 16.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 120.0,
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.1,
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
                                          'subsubdecks',
                                          queryParameters: {
                                            'subcode': serializeParam(
                                              widget.subcode,
                                              ParamType.String,
                                            ),
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
                        height: 800.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 800.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Assunto: ${questoes1SubsubRecord?.subsubnome}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    ' ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (!questoes1SubsubRecord!.emuso)
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'novaquestao',
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
                                                  widget.subsubcode,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          text: '   Adicionar nova pergunta   ',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      if (!questoes1SubsubRecord!.emuso)
                                        FFButtonWidget(
                                          onPressed: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Desativar assunto?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              _model.subsubdesat =
                                                  await querySubsubRecordOnce(
                                                queryBuilder: (subsubRecord) =>
                                                    subsubRecord.where(
                                                  'subsubcode',
                                                  isEqualTo: widget.subsubcode,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);

                                              await _model
                                                  .subsubdesat!.reference
                                                  .update(
                                                      createSubsubRecordData(
                                                desativado: true,
                                              ));

                                              context.pushNamed(
                                                'subsubdecks',
                                                queryParameters: {
                                                  'subcode': serializeParam(
                                                    widget.subcode,
                                                    ParamType.String,
                                                  ),
                                                  'deckcode': serializeParam(
                                                    widget.deckcode,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }

                                            setState(() {});
                                          },
                                          text: '   Desativar assunto   ',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Text(
                                    ' ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    ' ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: 680.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                StreamBuilder<List<QuestRecord>>(
                                  stream: queryQuestRecord(
                                    queryBuilder: (questRecord) =>
                                        questRecord.where(
                                      'questcode',
                                      isEqualTo: _model.questaoref,
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
                                    List<QuestRecord> containerQuestRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final containerQuestRecord =
                                        containerQuestRecordList.isNotEmpty
                                            ? containerQuestRecordList.first
                                            : null;
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 680.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  borderRadius: 20.0,
                                                  borderWidth: 0.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    Icons.chevron_left_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 60.0,
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      _model.questaoref = functions
                                                          .questaoanterior(
                                                              _model.listaquests
                                                                  .toList(),
                                                              _model
                                                                  .questaoref!);
                                                    });
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.6,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.55,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    border: Border.all(
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.56,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.51,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (containerQuestRecord?.tipo ==
                                                                              1) {
                                                                            return 'CARD ESTILO PERGUNTA-RESPOSTA';
                                                                          } else if (containerQuestRecord?.tipo ==
                                                                              2) {
                                                                            return 'CARD ESTILO COMPLETE A FRASE';
                                                                          } else {
                                                                            return 'CARD ESTILO ALTERNATIVAS';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (containerQuestRecord?.nivel ==
                                                                              1) {
                                                                            return 'fundamento';
                                                                          } else if (containerQuestRecord?.nivel ==
                                                                              2) {
                                                                            return 'fácil';
                                                                          } else if (containerQuestRecord?.nivel ==
                                                                              2) {
                                                                            return 'médio';
                                                                          } else {
                                                                            return 'difícil';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          25.0)),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    containerQuestRecord!
                                                                        .titulo,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                if (containerQuestRecord
                                                                        ?.tipo !=
                                                                    2)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      containerQuestRecord!
                                                                          .questdesc,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        2))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        3))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        4))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        5))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        6))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        7))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        8))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        9))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[8],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        10))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[8],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        11))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[8],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[10],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        12))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[8],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____ ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[10],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' _____.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (containerQuestRecord
                                                                        ?.tipo ==
                                                                    3)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.circle_outlined,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Text(
                                                                                '  ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                              Text(
                                                                                containerQuestRecord!.questresp,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      fontSize: 16.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.circle_outlined,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Text(
                                                                                '  ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                              Text(
                                                                                containerQuestRecord!.alternativas[0],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      fontSize: 16.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.circle_outlined,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Text(
                                                                                '  ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                              Text(
                                                                                containerQuestRecord!.alternativas[1],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      fontSize: 16.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.circle_outlined,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Text(
                                                                                '  ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                              Text(
                                                                                containerQuestRecord!.alternativas[2],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      fontSize: 16.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (containerQuestRecord
                                                                            ?.imgpergunta !=
                                                                        null &&
                                                                    containerQuestRecord
                                                                            ?.imgpergunta !=
                                                                        '')
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      containerQuestRecord!
                                                                          .imgpergunta,
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          200.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                if (containerQuestRecord
                                                                        ?.tipo !=
                                                                    2)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'RESPOSTA: ${containerQuestRecord?.questresp}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        2))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        3))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        4))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[3],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        5))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[3],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        6))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[3],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[5],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        7))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[3],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[5],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        8))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[3],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[5],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[7],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        9))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[3],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[5],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[7],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[8],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        10))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[3],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[5],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[7],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[8],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[9],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        11))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[3],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[5],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[7],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[8],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[9],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[10],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((containerQuestRecord
                                                                            ?.tipo ==
                                                                        2) &&
                                                                    (containerQuestRecord
                                                                            ?.complete
                                                                            ?.length ==
                                                                        12))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[0],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[1],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[2],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[3],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[4],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[5],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[6],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[7],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[8],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[9],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[10],
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                containerQuestRecord!.complete[11],
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '.',
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Explicação: ${containerQuestRecord?.explicacao}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                if (containerQuestRecord
                                                                            ?.imgresposta !=
                                                                        null &&
                                                                    containerQuestRecord
                                                                            ?.imgresposta !=
                                                                        '')
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      containerQuestRecord!
                                                                          .imgresposta,
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          200.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          10.0))
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          height:
                                                                              10.0))
                                                                  .addToEnd(SizedBox(
                                                                      height:
                                                                          10.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  borderRadius: 20.0,
                                                  borderWidth: 0.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    Icons.navigate_next_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 60.0,
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      _model.questaoref =
                                                          functions.proximodalista(
                                                              _model.listaquests
                                                                  .toList(),
                                                              _model
                                                                  .questaoref);
                                                    });
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            ' ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: '     editar card     ',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                              if (!questoes1SubsubRecord!.emuso)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child:
                                                                    MoverWidget(
                                                                  questaoref: _model
                                                                      .questaoref!,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));

                                                        _model.questoes3 =
                                                            await queryQuestRecordOnce(
                                                          queryBuilder:
                                                              (questRecord) =>
                                                                  questRecord
                                                                      .where(
                                                                        'subsubcode',
                                                                        isEqualTo:
                                                                            widget.subsubcode,
                                                                      )
                                                                      .where(
                                                                        'desativado',
                                                                        isEqualTo:
                                                                            false,
                                                                      ),
                                                        );
                                                        setState(() {
                                                          _model.questaoref = functions
                                                              .questaoanterior(
                                                                  _model
                                                                      .listaquests
                                                                      .toList(),
                                                                  _model
                                                                      .questaoref!);
                                                        });
                                                        setState(() {
                                                          _model.listaquests = functions
                                                              .extraiquestcode(
                                                                  _model
                                                                      .questoes3!
                                                                      .toList())
                                                              .toList()
                                                              .cast<String>();
                                                        });

                                                        setState(() {});
                                                      },
                                                      text:
                                                          '     mover card     ',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (!questoes1SubsubRecord!.emuso)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await containerQuestRecord!
                                                          .reference
                                                          .update(
                                                              createQuestRecordData(
                                                        desativado: true,
                                                      ));
                                                      _model.questoes2 =
                                                          await queryQuestRecordOnce(
                                                        queryBuilder:
                                                            (questRecord) =>
                                                                questRecord
                                                                    .where(
                                                                      'subsubcode',
                                                                      isEqualTo:
                                                                          widget
                                                                              .subsubcode,
                                                                    )
                                                                    .where(
                                                                      'desativado',
                                                                      isEqualTo:
                                                                          false,
                                                                    ),
                                                      );
                                                      setState(() {
                                                        _model.questaoref = functions
                                                            .questaoanterior(
                                                                _model
                                                                    .listaquests
                                                                    .toList(),
                                                                _model
                                                                    .questaoref!);
                                                      });
                                                      setState(() {
                                                        _model.listaquests = functions
                                                            .extraiquestcode(
                                                                _model
                                                                    .questoes2!
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                      });

                                                      setState(() {});
                                                    },
                                                    text:
                                                        '   desativar card   ',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.05,
                        height: MediaQuery.sizeOf(context).height * 0.83,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
