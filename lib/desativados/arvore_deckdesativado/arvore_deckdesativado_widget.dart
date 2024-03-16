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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'arvore_deckdesativado_model.dart';
export 'arvore_deckdesativado_model.dart';

class ArvoreDeckdesativadoWidget extends StatefulWidget {
  const ArvoreDeckdesativadoWidget({
    super.key,
    required this.deckcode,
  });

  final String? deckcode;

  @override
  State<ArvoreDeckdesativadoWidget> createState() =>
      _ArvoreDeckdesativadoWidgetState();
}

class _ArvoreDeckdesativadoWidgetState
    extends State<ArvoreDeckdesativadoWidget> {
  late ArvoreDeckdesativadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArvoreDeckdesativadoModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                                    context.pushNamed('deckdesativado');
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
                    StreamBuilder<List<DeckRecord>>(
                      stream: queryDeckRecord(
                        queryBuilder: (deckRecord) => deckRecord.where(
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
                        List<DeckRecord> textDeckRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final textDeckRecord = textDeckRecordList.isNotEmpty
                            ? textDeckRecordList.first
                            : null;
                        return Text(
                          'Deck desativado - ${textDeckRecord?.decknome}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        );
                      },
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
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
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
                                      List<DeckRecord> containerDeckRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerDeckRecord =
                                          containerDeckRecordList.isNotEmpty
                                              ? containerDeckRecordList.first
                                              : null;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: FutureBuilder<int>(
                                                future: querySubRecordCount(
                                                  queryBuilder: (subRecord) =>
                                                      subRecord.where(
                                                    'deckcode',
                                                    isEqualTo: widget.deckcode,
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
                                                  int textCount =
                                                      snapshot.data!;
                                                  return Text(
                                                    '${containerDeckRecord?.decknome} (${textCount.toString()} subdecks)',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18.0,
                                                        ),
                                                  );
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
                                                        0.85,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0),
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: StreamBuilder<
                                                    List<SubRecord>>(
                                                  stream: querySubRecord(
                                                    queryBuilder: (subRecord) =>
                                                        subRecord
                                                            .where(
                                                              'deckcode',
                                                              isEqualTo: widget
                                                                  .deckcode,
                                                            )
                                                            .orderBy('subnome'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child: SpinKitRipple(
                                                            color: Color(
                                                                0xFF087C08),
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
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewSubRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewSubRecord =
                                                            listViewSubRecordList[
                                                                listViewIndex];
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.8,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                FutureBuilder<
                                                                    int>(
                                                                  future:
                                                                      querySubsubRecordCount(
                                                                    queryBuilder:
                                                                        (subsubRecord) =>
                                                                            subsubRecord.where(
                                                                      'subcode',
                                                                      isEqualTo:
                                                                          listViewSubRecord
                                                                              .subcode,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitRipple(
                                                                            color:
                                                                                Color(0xFF087C08),
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    int textCount =
                                                                        snapshot
                                                                            .data!;
                                                                    return Text(
                                                                      '${listViewSubRecord.subnome} (${textCount.toString()} assuntos)',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                18.0,
                                                                          ),
                                                                    );
                                                                  },
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.75,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(10.0),
                                                                        bottomRight:
                                                                            Radius.circular(10.0),
                                                                        topLeft:
                                                                            Radius.circular(10.0),
                                                                        topRight:
                                                                            Radius.circular(10.0),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        StreamBuilder<
                                                                            List<SubsubRecord>>(
                                                                          stream:
                                                                              querySubsubRecord(
                                                                            queryBuilder: (subsubRecord) => subsubRecord
                                                                                .where(
                                                                                  'subcode',
                                                                                  isEqualTo: listViewSubRecord.subcode,
                                                                                )
                                                                                .orderBy('subsubnome'),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<SubsubRecord>
                                                                                listViewSubsubRecordList =
                                                                                snapshot.data!;
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewSubsubRecordList.length,
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewSubsubRecord = listViewSubsubRecordList[listViewIndex];
                                                                                return Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: FutureBuilder<int>(
                                                                                    future: queryQuestRecordCount(
                                                                                      queryBuilder: (questRecord) => questRecord.where(
                                                                                        'subsubcode',
                                                                                        isEqualTo: listViewSubsubRecord.subsubcode,
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
                                                                                      int containerCount = snapshot.data!;
                                                                                      return Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                        decoration: BoxDecoration(),
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 0.4,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Text(
                                                                                                      listViewSubsubRecord.subsubnome,
                                                                                                      textAlign: TextAlign.start,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Readex Pro',
                                                                                                            fontSize: 18.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Text(
                                                                                                      '- ${containerCount.toString()} questões',
                                                                                                      textAlign: TextAlign.start,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Readex Pro',
                                                                                                            fontSize: 18.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)).around(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ].divide(SizedBox(height: 10.0)).around(
                                                                              SizedBox(height: 10.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          10.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          10.0)),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                ' ',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18.0,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
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
                                  List<DeckRecord> rowDeckRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final rowDeckRecord =
                                      rowDeckRecordList.isNotEmpty
                                          ? rowDeckRecordList.first
                                          : null;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await rowDeckRecord!.reference
                                              .update(createDeckRecordData(
                                            desativado: false,
                                          ));
                                          context.safePop();
                                        },
                                        text: '   Ativar deck   ',
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
                                      FFButtonWidget(
                                        onPressed: () async {
                                          _model.excluirsubs3 =
                                              await querySubRecordOnce(
                                            queryBuilder: (subRecord) =>
                                                subRecord.where(
                                              'deckcode',
                                              isEqualTo: widget.deckcode,
                                            ),
                                          );
                                          _model.escluisubsubs3 =
                                              await querySubsubRecordOnce(
                                            queryBuilder: (subsubRecord) =>
                                                subsubRecord.whereIn('subcode',
                                                    _model.listacodes),
                                          );
                                          _model.excluiquests3 =
                                              await queryQuestRecordOnce(
                                            queryBuilder: (questRecord) =>
                                                questRecord.where(
                                              'deckcode',
                                              isEqualTo: widget.deckcode,
                                            ),
                                          );
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Tem certeza que deseja ecluir este deck?'),
                                                        content: Text(
                                                            'Você estará excluindo: 1 deck, ${_model.excluirsubs3?.length?.toString()} subdecks, ${_model.escluisubsubs3?.length?.toString()} assuntos e ${_model.excluiquests3?.length?.toString()} questões.'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            setState(() {
                                              _model.listacodes = functions
                                                  .extraisubdeckCODE(_model
                                                      .excluirsubs3!
                                                      .toList())
                                                  .toList()
                                                  .cast<String>();
                                            });
                                            await actions.excluiquests(
                                              _model.excluiquests3?.toList(),
                                            );
                                            await actions.excluirsubs(
                                              _model.excluirsubs3?.toList(),
                                            );
                                            await actions.excluisubsubs(
                                              _model.escluisubsubs3?.toList(),
                                            );
                                            await rowDeckRecord!.reference
                                                .delete();
                                            context.safePop();
                                          }

                                          setState(() {});
                                        },
                                        text: '   Excluir deck   ',
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
                                  );
                                },
                              ),
                            ]
                                .divide(SizedBox(height: 10.0))
                                .addToStart(SizedBox(height: 10.0))
                                .addToEnd(SizedBox(height: 50.0)),
                          ),
                        ),
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
