import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestRecord extends FirestoreRecord {
  QuestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "questdesc" field.
  String? _questdesc;
  String get questdesc => _questdesc ?? '';
  bool hasQuestdesc() => _questdesc != null;

  // "questresp" field.
  String? _questresp;
  String get questresp => _questresp ?? '';
  bool hasQuestresp() => _questresp != null;

  // "deckcode" field.
  String? _deckcode;
  String get deckcode => _deckcode ?? '';
  bool hasDeckcode() => _deckcode != null;

  // "subcode" field.
  String? _subcode;
  String get subcode => _subcode ?? '';
  bool hasSubcode() => _subcode != null;

  // "subsubcode" field.
  String? _subsubcode;
  String get subsubcode => _subsubcode ?? '';
  bool hasSubsubcode() => _subsubcode != null;

  // "questcode" field.
  String? _questcode;
  String get questcode => _questcode ?? '';
  bool hasQuestcode() => _questcode != null;

  // "respostas" field.
  int? _respostas;
  int get respostas => _respostas ?? 0;
  bool hasRespostas() => _respostas != null;

  // "certos" field.
  int? _certos;
  int get certos => _certos ?? 0;
  bool hasCertos() => _certos != null;

  // "tipo" field.
  int? _tipo;
  int get tipo => _tipo ?? 0;
  bool hasTipo() => _tipo != null;

  // "imgpergunta" field.
  String? _imgpergunta;
  String get imgpergunta => _imgpergunta ?? '';
  bool hasImgpergunta() => _imgpergunta != null;

  // "imgresposta" field.
  String? _imgresposta;
  String get imgresposta => _imgresposta ?? '';
  bool hasImgresposta() => _imgresposta != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "alternativas" field.
  List<String>? _alternativas;
  List<String> get alternativas => _alternativas ?? const [];
  bool hasAlternativas() => _alternativas != null;

  // "complete" field.
  List<String>? _complete;
  List<String> get complete => _complete ?? const [];
  bool hasComplete() => _complete != null;

  // "explicacao" field.
  String? _explicacao;
  String get explicacao => _explicacao ?? '';
  bool hasExplicacao() => _explicacao != null;

  // "nivel" field.
  int? _nivel;
  int get nivel => _nivel ?? 0;
  bool hasNivel() => _nivel != null;

  // "desativado" field.
  bool? _desativado;
  bool get desativado => _desativado ?? false;
  bool hasDesativado() => _desativado != null;

  void _initializeFields() {
    _questdesc = snapshotData['questdesc'] as String?;
    _questresp = snapshotData['questresp'] as String?;
    _deckcode = snapshotData['deckcode'] as String?;
    _subcode = snapshotData['subcode'] as String?;
    _subsubcode = snapshotData['subsubcode'] as String?;
    _questcode = snapshotData['questcode'] as String?;
    _respostas = castToType<int>(snapshotData['respostas']);
    _certos = castToType<int>(snapshotData['certos']);
    _tipo = castToType<int>(snapshotData['tipo']);
    _imgpergunta = snapshotData['imgpergunta'] as String?;
    _imgresposta = snapshotData['imgresposta'] as String?;
    _titulo = snapshotData['titulo'] as String?;
    _alternativas = getDataList(snapshotData['alternativas']);
    _complete = getDataList(snapshotData['complete']);
    _explicacao = snapshotData['explicacao'] as String?;
    _nivel = castToType<int>(snapshotData['nivel']);
    _desativado = snapshotData['desativado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QUEST');

  static Stream<QuestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestRecord.fromSnapshot(s));

  static Future<QuestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestRecord.fromSnapshot(s));

  static QuestRecord fromSnapshot(DocumentSnapshot snapshot) => QuestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestRecordData({
  String? questdesc,
  String? questresp,
  String? deckcode,
  String? subcode,
  String? subsubcode,
  String? questcode,
  int? respostas,
  int? certos,
  int? tipo,
  String? imgpergunta,
  String? imgresposta,
  String? titulo,
  String? explicacao,
  int? nivel,
  bool? desativado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'questdesc': questdesc,
      'questresp': questresp,
      'deckcode': deckcode,
      'subcode': subcode,
      'subsubcode': subsubcode,
      'questcode': questcode,
      'respostas': respostas,
      'certos': certos,
      'tipo': tipo,
      'imgpergunta': imgpergunta,
      'imgresposta': imgresposta,
      'titulo': titulo,
      'explicacao': explicacao,
      'nivel': nivel,
      'desativado': desativado,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestRecordDocumentEquality implements Equality<QuestRecord> {
  const QuestRecordDocumentEquality();

  @override
  bool equals(QuestRecord? e1, QuestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.questdesc == e2?.questdesc &&
        e1?.questresp == e2?.questresp &&
        e1?.deckcode == e2?.deckcode &&
        e1?.subcode == e2?.subcode &&
        e1?.subsubcode == e2?.subsubcode &&
        e1?.questcode == e2?.questcode &&
        e1?.respostas == e2?.respostas &&
        e1?.certos == e2?.certos &&
        e1?.tipo == e2?.tipo &&
        e1?.imgpergunta == e2?.imgpergunta &&
        e1?.imgresposta == e2?.imgresposta &&
        e1?.titulo == e2?.titulo &&
        listEquality.equals(e1?.alternativas, e2?.alternativas) &&
        listEquality.equals(e1?.complete, e2?.complete) &&
        e1?.explicacao == e2?.explicacao &&
        e1?.nivel == e2?.nivel &&
        e1?.desativado == e2?.desativado;
  }

  @override
  int hash(QuestRecord? e) => const ListEquality().hash([
        e?.questdesc,
        e?.questresp,
        e?.deckcode,
        e?.subcode,
        e?.subsubcode,
        e?.questcode,
        e?.respostas,
        e?.certos,
        e?.tipo,
        e?.imgpergunta,
        e?.imgresposta,
        e?.titulo,
        e?.alternativas,
        e?.complete,
        e?.explicacao,
        e?.nivel,
        e?.desativado
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestRecord;
}
