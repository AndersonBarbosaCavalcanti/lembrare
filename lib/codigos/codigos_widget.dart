import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'package:url_launcher/url_launcher.dart';
import 'codigos_model.dart';
export 'codigos_model.dart';

class CodigosWidget extends StatefulWidget {
  const CodigosWidget({super.key});

  @override
  State<CodigosWidget> createState() => _CodigosWidgetState();
}

class _CodigosWidgetState extends State<CodigosWidget> {
  late CodigosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CodigosModel());

    _model.textFieldnroController ??= TextEditingController();
    _model.textFieldnroFocusNode ??= FocusNode();

    _model.textField4Controller ??= TextEditingController();
    _model.textField4FocusNode ??= FocusNode();

    _model.textField5Controller ??= TextEditingController();
    _model.textField5FocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textFieldnroController?.text = '0';
        }));
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDown10ValueController ??=
                                          FormFieldController<String>(
                                    _model.dropDown10Value ??= '',
                                  ),
                                  options: List<String>.from(['1', '2', '3']),
                                  optionLabels: [
                                    'Banco de dados',
                                    'Aplicativo',
                                    'Página institucional'
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.dropDown10Value = val),
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20.0,
                                      ),
                                  hintText: 'Plataforma...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                if ((_model.dropDown10Value == '2') ||
                                    (_model.dropDown10Value == '3'))
                                  StreamBuilder<List<EscolaRecord>>(
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
                                          dropDown11EscolaRecordList =
                                          snapshot.data!;
                                      return FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDown11ValueController ??=
                                                FormFieldController<String>(
                                          _model.dropDown11Value ??= '',
                                        ),
                                        options: List<String>.from(
                                            functions.extraiescolaCODE(
                                                dropDown11EscolaRecordList
                                                    .toList())),
                                        optionLabels:
                                            functions.extraiescolaCODE(
                                                dropDown11EscolaRecordList
                                                    .toList()),
                                        onChanged: (val) => setState(
                                            () => _model.dropDown11Value = val),
                                        width: 300.0,
                                        height: 50.0,
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 20.0,
                                                ),
                                        searchTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                            ),
                                        hintText: 'Escola...',
                                        searchHintText: 'Search for an item...',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                if (_model.dropDown10Value != null &&
                                    _model.dropDown10Value != '') {
                                  if ((_model.dropDown11Value != null &&
                                          _model.dropDown11Value != '') ||
                                      (_model.dropDown11Value == '1')) {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Deseja limpar os códigos da plataforma selecionada?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      if (_model.dropDown10Value == '1') {
                                        _model.doc1 =
                                            await queryCredenciaisRecordOnce(
                                          queryBuilder: (credenciaisRecord) =>
                                              credenciaisRecord.where(
                                            'plataforma',
                                            isEqualTo: 'BANCO',
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);

                                        await _model.doc1!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'codigos': FieldValue.delete(),
                                            },
                                          ),
                                        });
                                      } else if (_model.dropDown10Value ==
                                          '2') {
                                        _model.doc2 =
                                            await queryCredenciaisRecordOnce(
                                          queryBuilder: (credenciaisRecord) =>
                                              credenciaisRecord
                                                  .where(
                                                    'plataforma',
                                                    isEqualTo: 'APP',
                                                  )
                                                  .where(
                                                    'escola',
                                                    isEqualTo:
                                                        _model.dropDown11Value,
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);

                                        await _model.doc2!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'codigos': FieldValue.delete(),
                                            },
                                          ),
                                        });
                                      } else if (_model.dropDown10Value ==
                                          '3') {
                                        _model.doc3 =
                                            await queryCredenciaisRecordOnce(
                                          queryBuilder: (credenciaisRecord) =>
                                              credenciaisRecord
                                                  .where(
                                                    'plataforma',
                                                    isEqualTo: 'INSTITUCIONAL',
                                                  )
                                                  .where(
                                                    'escola',
                                                    isEqualTo:
                                                        _model.dropDown11Value,
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);

                                        await _model.doc3!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'codigos': FieldValue.delete(),
                                            },
                                          ),
                                        });
                                      }
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(
                                              'Complete os dados obrigatórios'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(
                                            'Complete os dados obrigatórios'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                setState(() {});
                              },
                              text: 'Limpar códigos da plataforma',
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
                        Divider(
                          height: 100.0,
                          thickness: 3.0,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '       Criar  ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                            ),
                            Expanded(
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Container(
                                    width: 10.0,
                                    child: TextFormField(
                                      controller: _model.textFieldnroController,
                                      focusNode: _model.textFieldnroFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                            ),
                                        hintText: 'nro de senhas',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 16.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 20.0,
                                          ),
                                      maxLength: 3,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .textFieldnroControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'senhas para acesso de ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                            ),
                            FlutterFlowDropDown<String>(
                              controller: _model.dropDown20ValueController ??=
                                  FormFieldController<String>(
                                _model.dropDown20Value ??= '',
                              ),
                              options: List<String>.from(['1', '2', '3']),
                              optionLabels: [
                                'Banco de dados',
                                'Aplicativo',
                                'Página institucional'
                              ],
                              onChanged: (val) =>
                                  setState(() => _model.dropDown20Value = val),
                              width: 300.0,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                              hintText: 'Plataforma...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ],
                        ),
                        if ((_model.dropDown20Value == '2') ||
                            (_model.dropDown20Value == '3'))
                          StreamBuilder<List<EscolaRecord>>(
                            stream: queryEscolaRecord(
                              queryBuilder: (escolaRecord) => escolaRecord
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
                              List<EscolaRecord> dropDown21EscolaRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller: _model.dropDown21ValueController ??=
                                    FormFieldController<String>(
                                  _model.dropDown21Value ??= '',
                                ),
                                options: List<String>.from(
                                    functions.extraiescolaCODE(
                                        dropDown21EscolaRecordList.toList())),
                                optionLabels: functions.extraiescolaCODE(
                                    dropDown21EscolaRecordList.toList()),
                                onChanged: (val) => setState(
                                    () => _model.dropDown21Value = val),
                                width: 300.0,
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20.0,
                                        ),
                                searchTextStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 20.0,
                                    ),
                                hintText: 'Escola...',
                                searchHintText: 'Search for an item...',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: true,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        if (valueOrDefault<bool>(
                          () {
                            if ((_model.textFieldnroController.text != '0') &&
                                (_model.textFieldnroController.text != null &&
                                    _model.textFieldnroController.text != '') &&
                                (_model.dropDown20Value == '1')) {
                              return true;
                            } else if ((_model.textFieldnroController.text !=
                                    '0') &&
                                (_model.textFieldnroController.text != null &&
                                    _model.textFieldnroController.text != '') &&
                                (_model.dropDown20Value == '2') &&
                                (_model.dropDown21Value != null &&
                                    _model.dropDown21Value != '')) {
                              return true;
                            } else if ((_model.textFieldnroController.text !=
                                    '0') &&
                                (_model.textFieldnroController.text != null &&
                                    _model.textFieldnroController.text != '') &&
                                (_model.dropDown20Value == '3') &&
                                (_model.dropDown21Value != null &&
                                    _model.dropDown21Value != '')) {
                              return true;
                            } else {
                              return false;
                            }
                          }(),
                          false,
                        ))
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.escolaaqui =
                                      await queryEscolaRecordOnce(
                                    queryBuilder: (escolaRecord) =>
                                        escolaRecord.where(
                                      'escolacode',
                                      isEqualTo:
                                          _model.textField5Controller.text,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (_model.textField4Controller.text !=
                                          null &&
                                      _model.textField4Controller.text != '') {
                                    setState(() {
                                      _model.codigos = functions
                                          .xcodigos(_model
                                              .textFieldnroController.text)!
                                          .toList()
                                          .cast<String>();
                                    });
                                    if (_model.textField4Controller.text ==
                                        '1') {
                                      _model.aqui1 =
                                          await queryCredenciaisRecordOnce(
                                        queryBuilder: (credenciaisRecord) =>
                                            credenciaisRecord.where(
                                          'plataforma',
                                          isEqualTo: 'BANCO',
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.aqui1!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'codigos': functions.juntarlistas(
                                                _model.aqui1?.codigos?.toList(),
                                                _model.codigos.toList()),
                                          },
                                        ),
                                      });
                                    } else if (_model
                                            .textField4Controller.text ==
                                        '2') {
                                      _model.aqui2 =
                                          await queryCredenciaisRecordOnce(
                                        queryBuilder: (credenciaisRecord) =>
                                            credenciaisRecord
                                                .where(
                                                  'plataforma',
                                                  isEqualTo: 'APP',
                                                )
                                                .where(
                                                  'escola',
                                                  isEqualTo: _model
                                                      .textField5Controller
                                                      .text,
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.aqui2!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'codigos': functions.juntarlistas(
                                                _model.aqui2?.codigos?.toList(),
                                                _model.codigos.toList()),
                                          },
                                        ),
                                      });
                                    } else if (_model
                                            .textField4Controller.text ==
                                        '3') {
                                      _model.aqui3 =
                                          await queryCredenciaisRecordOnce(
                                        queryBuilder: (credenciaisRecord) =>
                                            credenciaisRecord
                                                .where(
                                                  'plataforma',
                                                  isEqualTo: 'APP',
                                                )
                                                .where(
                                                  'escola',
                                                  isEqualTo: _model
                                                      .textField5Controller
                                                      .text,
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.aqui3!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'codigos': functions.juntarlistas(
                                                _model.aqui3?.codigos?.toList(),
                                                _model.codigos.toList()),
                                          },
                                        ),
                                      });
                                    }

                                    await launchUrl(Uri(
                                        scheme: 'mailto',
                                        path: _model.textField4Controller.text,
                                        query: {
                                          'subject': 'CÓDIGOS LEMBRARE',
                                          'body':
                                              '${_model.textFieldnroController.text} códigos unicos foram gerados para a plataforma ${() {
                                            if (_model.dropDown20Value == '1') {
                                              return 'Banco de Dados Lembrare';
                                            } else if (_model.dropDown20Value ==
                                                '2') {
                                              return 'Aplicativo Lembrare, escola ${_model.escolaaqui?.escolanome}';
                                            } else if (_model.dropDown20Value ==
                                                '3') {
                                              return 'Página institucional Lembrare, escola ${_model.escolaaqui?.escolanome}';
                                            } else {
                                              return ' ';
                                            }
                                          }()}. Seguem os códigos gerados:${functions.listaemstring(_model.codigos.toList())}',
                                        }
                                            .entries
                                            .map((MapEntry<String, String> e) =>
                                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                            .join('&')));
                                  }

                                  setState(() {});
                                },
                                text: '  Gerar novos códigos e enviar para:  ',
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Container(
                                    width: 10.0,
                                    child: TextFormField(
                                      controller: _model.textField4Controller,
                                      focusNode: _model.textField4FocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                            ),
                                        hintText: 'email...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 20.0,
                                          ),
                                      validator: _model
                                          .textField4ControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (valueOrDefault<bool>(
                          () {
                            if ((_model.textFieldnroController.text != '0') &&
                                (_model.textFieldnroController.text != null &&
                                    _model.textFieldnroController.text != '') &&
                                (_model.dropDown20Value == '1')) {
                              return true;
                            } else if ((_model.textFieldnroController.text !=
                                    '0') &&
                                (_model.textFieldnroController.text != null &&
                                    _model.textFieldnroController.text != '') &&
                                (_model.dropDown20Value == '2') &&
                                (_model.dropDown21Value != null &&
                                    _model.dropDown21Value != '')) {
                              return true;
                            } else if ((_model.textFieldnroController.text !=
                                    '0') &&
                                (_model.textFieldnroController.text != null &&
                                    _model.textFieldnroController.text != '') &&
                                (_model.dropDown20Value == '3') &&
                                (_model.dropDown21Value != null &&
                                    _model.dropDown21Value != '')) {
                              return true;
                            } else {
                              return false;
                            }
                          }(),
                          false,
                        ))
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: '  Enviar códigos para usuários:  ',
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Container(
                                    width: 10.0,
                                    child: TextFormField(
                                      controller: _model.textField5Controller,
                                      focusNode: _model.textField5FocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                            ),
                                        hintText:
                                            '${_model.textFieldnroController.text} emails separados por ; (ponto e vírgula)',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 20.0,
                                          ),
                                      keyboardType: TextInputType.multiline,
                                      validator: _model
                                          .textField5ControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ]
                          .divide(SizedBox(height: 20.0))
                          .around(SizedBox(height: 20.0)),
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
