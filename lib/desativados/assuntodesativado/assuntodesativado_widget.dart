import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'assuntodesativado_model.dart';
export 'assuntodesativado_model.dart';

class AssuntodesativadoWidget extends StatefulWidget {
  const AssuntodesativadoWidget({super.key});

  @override
  State<AssuntodesativadoWidget> createState() =>
      _AssuntodesativadoWidgetState();
}

class _AssuntodesativadoWidgetState extends State<AssuntodesativadoWidget> {
  late AssuntodesativadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssuntodesativadoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.subsubdesativado = await querySubsubRecordOnce(
        queryBuilder: (subsubRecord) => subsubRecord
            .where(
              'desativado',
              isEqualTo: true,
            )
            .orderBy('subsubnome'),
      );
      setState(() {
        _model.listasubs = functions
            .subsubdesativadolistasub(_model.subsubdesativado?.toList())!
            .toList()
            .cast<String>();
      });
      _model.subdesativados2 = await querySubRecordOnce(
        queryBuilder: (subRecord) =>
            subRecord.whereIn('subcode', _model.listasubs),
      );
      setState(() {
        _model.listadecks = functions
            .subdesativadolistadecks(_model.subdesativados2?.toList())!
            .toList()
            .cast<String>();
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
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
                                  width: MediaQuery.sizeOf(context).width * 0.1,
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
                                    height: MediaQuery.sizeOf(context).height *
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
                                    context.pushNamed('desativados');
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
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          StreamBuilder<List<DeckRecord>>(
                            stream: queryDeckRecord(
                              queryBuilder: (deckRecord) => deckRecord.whereIn(
                                  'deckcode', _model.listadecks),
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
                              List<DeckRecord> listViewDeckRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewDeckRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewDeckRecord =
                                      listViewDeckRecordList[listViewIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              '${listViewDeckRecord.decknome} - ${functions.listaemstring(listViewDeckRecord.escola.toList())}',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                          StreamBuilder<List<SubRecord>>(
                                            stream: querySubRecord(
                                              queryBuilder: (subRecord) =>
                                                  subRecord
                                                      .where(
                                                        'deckcode',
                                                        isEqualTo:
                                                            listViewDeckRecord
                                                                .deckcode,
                                                      )
                                                      .whereIn('subcode',
                                                          _model.listasubs),
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
                                              List<SubRecord>
                                                  listViewSubRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: listViewSubRecordList
                                                    .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewSubRecord =
                                                      listViewSubRecordList[
                                                          listViewIndex];
                                                  return Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            '        ${listViewDeckRecord.decknome} - ${functions.listaemstring(listViewDeckRecord.escola.toList())}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                          ),
                                                        ),
                                                        StreamBuilder<
                                                            List<SubsubRecord>>(
                                                          stream:
                                                              querySubsubRecord(
                                                            queryBuilder:
                                                                (subsubRecord) =>
                                                                    subsubRecord
                                                                        .where(
                                                                          'desativado',
                                                                          isEqualTo:
                                                                              true,
                                                                        )
                                                                        .where(
                                                                          'subcode',
                                                                          isEqualTo:
                                                                              listViewSubRecord.subcode,
                                                                        )
                                                                        .orderBy(
                                                                            'subsubnome'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: Color(
                                                                        0xFF087C08),
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<SubsubRecord>
                                                                listViewSubsubRecordList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewSubsubRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewSubsubRecord =
                                                                    listViewSubsubRecordList[
                                                                        listViewIndex];
                                                                return Container(
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      FutureBuilder<
                                                                          int>(
                                                                        future:
                                                                            queryQuestRecordCount(
                                                                          queryBuilder: (questRecord) => questRecord
                                                                              .where(
                                                                                'subsubcode',
                                                                                isEqualTo: listViewSubsubRecord.subsubcode,
                                                                              )
                                                                              .where(
                                                                                'desativado',
                                                                                isEqualTo: false,
                                                                              ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          int textCount =
                                                                              snapshot.data!;
                                                                          return Text(
                                                                            '            ${listViewSubsubRecord.subsubnome} - ${textCount.toString()} questões',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  fontSize: 18.0,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                await listViewSubsubRecord.reference.update(createSubsubRecordData(
                                                                                  desativado: false,
                                                                                ));

                                                                                context.pushNamed('assuntodesativado');
                                                                              },
                                                                              text: '    ativar    ',
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.questsexcluir = await queryQuestRecordOnce(
                                                                                  queryBuilder: (questRecord) => questRecord.where(
                                                                                    'subsubcode',
                                                                                    isEqualTo: listViewSubsubRecord.subsubcode,
                                                                                  ),
                                                                                );
                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('Tem certeza que deseja ecluir este assunto?'),
                                                                                          content: Text('Você estará excluindo: 1 assunto e ${_model.questsexcluir?.length?.toString()} questões.'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: Text('Cancel'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: Text('Confirm'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ) ??
                                                                                    false;
                                                                                if (confirmDialogResponse) {
                                                                                  await actions.excluiquests(
                                                                                    _model.questsexcluir?.toList(),
                                                                                  );
                                                                                  await listViewSubsubRecord.reference.delete();

                                                                                  context.pushNamed('assuntodesativado');
                                                                                }

                                                                                setState(() {});
                                                                              },
                                                                              text: '   excluir   ',
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 10.0))
                                                          .addToEnd(SizedBox(
                                                              height: 10.0)),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ]
                                            .divide(SizedBox(height: 20.0))
                                            .around(SizedBox(height: 20.0)),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ]
                            .divide(SizedBox(height: 10.0))
                            .around(SizedBox(height: 10.0)),
                      ),
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
    );
  }
}
