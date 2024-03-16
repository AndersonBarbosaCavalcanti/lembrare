import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mover_model.dart';
export 'mover_model.dart';

class MoverWidget extends StatefulWidget {
  const MoverWidget({
    super.key,
    required this.questaoref,
  });

  final String? questaoref;

  @override
  State<MoverWidget> createState() => _MoverWidgetState();
}

class _MoverWidgetState extends State<MoverWidget> {
  late MoverModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoverModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 800.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 500.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 30.0,
                height: 400.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              Container(
                width: 340.0,
                height: 400.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Text(
                        'Mover card para:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    StreamBuilder<List<EscolaRecord>>(
                      stream: queryEscolaRecord(
                        queryBuilder: (escolaRecord) =>
                            escolaRecord.orderBy('escolanome'),
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
                        List<EscolaRecord> dropDownEscolaRecordList =
                            snapshot.data!;
                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController1 ??=
                              FormFieldController<String>(
                            _model.dropDownValue1 ??= '',
                          ),
                          options: List<String>.from(functions.extraiescolaCODE(
                              dropDownEscolaRecordList.toList())),
                          optionLabels: functions
                              .extraiescola(dropDownEscolaRecordList.toList()),
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue1 = val),
                          width: 300.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Escola...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                    if (_model.dropDownValue1 != null &&
                        _model.dropDownValue1 != '')
                      StreamBuilder<List<DeckRecord>>(
                        stream: queryDeckRecord(
                          queryBuilder: (deckRecord) => deckRecord
                              .where(
                                'escola',
                                arrayContains: _model.dropDownValue1,
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
                          List<DeckRecord> dropDownDeckRecordList =
                              snapshot.data!;
                          return FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController2 ??=
                                FormFieldController<String>(
                              _model.dropDownValue2 ??= '',
                            ),
                            options: List<String>.from(functions.extraideckCODE(
                                dropDownDeckRecordList.toList())),
                            optionLabels: functions
                                .extraideck(dropDownDeckRecordList.toList()),
                            onChanged: (val) =>
                                setState(() => _model.dropDownValue2 = val),
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Deck...',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    if ((_model.dropDownValue1 != null &&
                            _model.dropDownValue1 != '') &&
                        (_model.dropDownValue2 != null &&
                            _model.dropDownValue2 != ''))
                      StreamBuilder<List<SubRecord>>(
                        stream: querySubRecord(
                          queryBuilder: (subRecord) => subRecord
                              .where(
                                'deckcode',
                                isEqualTo: _model.dropDownValue2,
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
                                  color: Color(0xFF087C08),
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<SubRecord> dropDownSubRecordList =
                              snapshot.data!;
                          return FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController3 ??=
                                FormFieldController<String>(
                              _model.dropDownValue3 ??= '',
                            ),
                            options: List<String>.from(
                                functions.extraisubdeckCODE(
                                    dropDownSubRecordList.toList())),
                            optionLabels: functions
                                .extraisubdeck(dropDownSubRecordList.toList()),
                            onChanged: (val) =>
                                setState(() => _model.dropDownValue3 = val),
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Subdeck...',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    if ((_model.dropDownValue1 != null &&
                            _model.dropDownValue1 != '') &&
                        (_model.dropDownValue2 != null &&
                            _model.dropDownValue2 != '') &&
                        (_model.dropDownValue3 != null &&
                            _model.dropDownValue3 != ''))
                      StreamBuilder<List<SubsubRecord>>(
                        stream: querySubsubRecord(
                          queryBuilder: (subsubRecord) => subsubRecord
                              .where(
                                'subcode',
                                isEqualTo: _model.dropDownValue3,
                              )
                              .orderBy('subsubnome'),
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
                          List<SubsubRecord> dropDownSubsubRecordList =
                              snapshot.data!;
                          return FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController4 ??=
                                FormFieldController<String>(
                              _model.dropDownValue4 ??= '',
                            ),
                            options: List<String>.from(
                                functions.extraisubsubdeckCODE(
                                    dropDownSubsubRecordList.toList())),
                            optionLabels: functions.extraisubsubdeck(
                                dropDownSubsubRecordList.toList()),
                            onChanged: (val) =>
                                setState(() => _model.dropDownValue4 = val),
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Assunto...',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: '   Cancelar   ',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
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
                        if ((_model.dropDownValue1 != null &&
                                _model.dropDownValue1 != '') &&
                            (_model.dropDownValue2 != null &&
                                _model.dropDownValue2 != '') &&
                            (_model.dropDownValue3 != null &&
                                _model.dropDownValue3 != '') &&
                            (_model.dropDownValue4 != null &&
                                _model.dropDownValue4 != ''))
                          FFButtonWidget(
                            onPressed: () async {
                              _model.questedit = await queryQuestRecordOnce(
                                queryBuilder: (questRecord) =>
                                    questRecord.where(
                                  'questcode',
                                  isEqualTo: widget.questaoref,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.questedit!.reference
                                  .update(createQuestRecordData(
                                subcode: _model.dropDownValue3,
                                deckcode: _model.dropDownValue2,
                                subsubcode: _model.dropDownValue4,
                              ));

                              setState(() {});
                            },
                            text: '   Mover   ',
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
                      ],
                    ),
                  ].divide(SizedBox(height: 15.0)),
                ),
              ),
              Container(
                width: 30.0,
                height: 400.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
