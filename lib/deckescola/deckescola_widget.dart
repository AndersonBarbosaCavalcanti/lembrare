import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deckescola_model.dart';
export 'deckescola_model.dart';

class DeckescolaWidget extends StatefulWidget {
  const DeckescolaWidget({
    super.key,
    required this.escola,
    required this.code,
  });

  final bool? escola;
  final String? code;

  @override
  State<DeckescolaWidget> createState() => _DeckescolaWidgetState();
}

class _DeckescolaWidgetState extends State<DeckescolaWidget> {
  late DeckescolaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeckescolaModel());

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
                                    if (widget.escola!) {
                                      context.pushNamed(
                                        'decks',
                                        queryParameters: {
                                          'escolacode': serializeParam(
                                            widget.code,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      context.pushNamed(
                                        'subdecks',
                                        queryParameters: {
                                          'deckcode': serializeParam(
                                            widget.code,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!widget.escola!)
                          StreamBuilder<List<DeckRecord>>(
                            stream: queryDeckRecord(
                              queryBuilder: (deckRecord) => deckRecord.where(
                                'deckcode',
                                isEqualTo: widget.code,
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
                              List<DeckRecord> columnDECKDeckRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final columnDECKDeckRecord =
                                  columnDECKDeckRecordList.isNotEmpty
                                      ? columnDECKDeckRecordList.first
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Adicionar deck ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: columnDECKDeckRecord!.decknome,
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' à(s) escola(s):',
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 18.0,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.6,
                                    decoration: BoxDecoration(),
                                    child: StreamBuilder<List<EscolaRecord>>(
                                      stream: queryEscolaRecord(
                                        queryBuilder: (escolaRecord) =>
                                            escolaRecord
                                                .where(
                                                  'desativado',
                                                  isEqualTo: false,
                                                )
                                                .orderBy('escolanome'),
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
                                        List<EscolaRecord>
                                            listViewEscolaRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewEscolaRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewEscolaRecord =
                                                listViewEscolaRecordList[
                                                    listViewIndex];
                                            return Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              child: CheckboxListTile(
                                                value: _model
                                                            .checkboxListTileValueMap1[
                                                        listViewEscolaRecord] ??=
                                                    columnDECKDeckRecord!.escola
                                                        .contains(
                                                            listViewEscolaRecord
                                                                .escolacode),
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                              .checkboxListTileValueMap1[
                                                          listViewEscolaRecord] =
                                                      newValue!);
                                                  if (newValue!) {
                                                    _model.decksdaescola2 =
                                                        await queryDeckRecordOnce(
                                                      queryBuilder:
                                                          (deckRecord) =>
                                                              deckRecord.where(
                                                        'escola',
                                                        arrayContains:
                                                            listViewEscolaRecord
                                                                .escolacode,
                                                      ),
                                                    );
                                                    if (functions
                                                        .procuranomedecktrueestarepetido(
                                                            _model
                                                                .decksdaescola2
                                                                ?.toList(),
                                                            columnDECKDeckRecord
                                                                ?.decknome)) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Nome repetido'),
                                                            content: Text(
                                                                'Já existe um deck com esse nome na escola'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      await columnDECKDeckRecord!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'escola': FieldValue
                                                                .arrayUnion([
                                                              listViewEscolaRecord
                                                                  .escolacode
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }

                                                    setState(() {});
                                                  } else {
                                                    await columnDECKDeckRecord!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'escola': FieldValue
                                                              .arrayRemove([
                                                            listViewEscolaRecord
                                                                .escolacode
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  }
                                                },
                                                title: Text(
                                                  listViewEscolaRecord
                                                      .escolanome,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge,
                                                ),
                                                subtitle: Text(
                                                  ' ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                dense: false,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 20.0))
                                    .around(SizedBox(height: 20.0)),
                              );
                            },
                          ),
                        if (widget.escola ?? true)
                          StreamBuilder<List<EscolaRecord>>(
                            stream: queryEscolaRecord(
                              queryBuilder: (escolaRecord) => escolaRecord
                                  .where(
                                    'escolacode',
                                    isEqualTo: widget.code,
                                  )
                                  .orderBy('escolanome'),
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
                              List<EscolaRecord> columnDECKEscolaRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final columnDECKEscolaRecord =
                                  columnDECKEscolaRecordList.isNotEmpty
                                      ? columnDECKEscolaRecordList.first
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Adicionar decks à escola ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: columnDECKEscolaRecord!
                                              .escolanome,
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ':',
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 18.0,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.6,
                                    decoration: BoxDecoration(),
                                    child: StreamBuilder<List<DeckRecord>>(
                                      stream: queryDeckRecord(
                                        queryBuilder: (deckRecord) => deckRecord
                                            .where(
                                              'desativado',
                                              isEqualTo: false,
                                            )
                                            .orderBy('decknome'),
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
                                        List<DeckRecord>
                                            listViewDeckRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewDeckRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewDeckRecord =
                                                listViewDeckRecordList[
                                                    listViewIndex];
                                            return Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              child: CheckboxListTile(
                                                value: _model
                                                            .checkboxListTileValueMap2[
                                                        listViewDeckRecord] ??=
                                                    listViewDeckRecord.escola
                                                        .contains(widget.code),
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                              .checkboxListTileValueMap2[
                                                          listViewDeckRecord] =
                                                      newValue!);
                                                  if (newValue!) {
                                                    _model.decksdaescola1 =
                                                        await queryDeckRecordOnce(
                                                      queryBuilder:
                                                          (deckRecord) =>
                                                              deckRecord.where(
                                                        'escola',
                                                        arrayContains:
                                                            widget.code,
                                                      ),
                                                    );
                                                    if (functions
                                                        .procuranomedecktrueestarepetido(
                                                            _model
                                                                .decksdaescola1
                                                                ?.toList(),
                                                            listViewDeckRecord
                                                                .decknome)) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Nome repetido'),
                                                            content: Text(
                                                                'Já existe um deck com esse nome na escola'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      await listViewDeckRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'escola': FieldValue
                                                                .arrayUnion([
                                                              widget.code
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }

                                                    setState(() {});
                                                  } else {
                                                    await listViewDeckRecord
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'escola': FieldValue
                                                              .arrayRemove([
                                                            widget.code
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  }
                                                },
                                                title: Text(
                                                  listViewDeckRecord.decknome,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge,
                                                ),
                                                subtitle: Text(
                                                  functions.listaemstring(
                                                      listViewDeckRecord.escola
                                                          .toList())!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                dense: false,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 20.0))
                                    .around(SizedBox(height: 20.0)),
                              );
                            },
                          ),
                      ],
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
