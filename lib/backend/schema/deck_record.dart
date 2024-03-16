import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeckRecord extends FirestoreRecord {
  DeckRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "decknome" field.
  String? _decknome;
  String get decknome => _decknome ?? '';
  bool hasDecknome() => _decknome != null;

  // "deckcode" field.
  String? _deckcode;
  String get deckcode => _deckcode ?? '';
  bool hasDeckcode() => _deckcode != null;

  // "escola" field.
  List<String>? _escola;
  List<String> get escola => _escola ?? const [];
  bool hasEscola() => _escola != null;

  // "desativado" field.
  bool? _desativado;
  bool get desativado => _desativado ?? false;
  bool hasDesativado() => _desativado != null;

  void _initializeFields() {
    _decknome = snapshotData['decknome'] as String?;
    _deckcode = snapshotData['deckcode'] as String?;
    _escola = getDataList(snapshotData['escola']);
    _desativado = snapshotData['desativado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deck');

  static Stream<DeckRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeckRecord.fromSnapshot(s));

  static Future<DeckRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeckRecord.fromSnapshot(s));

  static DeckRecord fromSnapshot(DocumentSnapshot snapshot) => DeckRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeckRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeckRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeckRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeckRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeckRecordData({
  String? decknome,
  String? deckcode,
  bool? desativado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'decknome': decknome,
      'deckcode': deckcode,
      'desativado': desativado,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeckRecordDocumentEquality implements Equality<DeckRecord> {
  const DeckRecordDocumentEquality();

  @override
  bool equals(DeckRecord? e1, DeckRecord? e2) {
    const listEquality = ListEquality();
    return e1?.decknome == e2?.decknome &&
        e1?.deckcode == e2?.deckcode &&
        listEquality.equals(e1?.escola, e2?.escola) &&
        e1?.desativado == e2?.desativado;
  }

  @override
  int hash(DeckRecord? e) => const ListEquality()
      .hash([e?.decknome, e?.deckcode, e?.escola, e?.desativado]);

  @override
  bool isValidKey(Object? o) => o is DeckRecord;
}
