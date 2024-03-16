import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EscolaRecord extends FirestoreRecord {
  EscolaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "escolacode" field.
  String? _escolacode;
  String get escolacode => _escolacode ?? '';
  bool hasEscolacode() => _escolacode != null;

  // "escolanome" field.
  String? _escolanome;
  String get escolanome => _escolanome ?? '';
  bool hasEscolanome() => _escolanome != null;

  // "desativado" field.
  bool? _desativado;
  bool get desativado => _desativado ?? false;
  bool hasDesativado() => _desativado != null;

  void _initializeFields() {
    _escolacode = snapshotData['escolacode'] as String?;
    _escolanome = snapshotData['escolanome'] as String?;
    _desativado = snapshotData['desativado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('escola');

  static Stream<EscolaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EscolaRecord.fromSnapshot(s));

  static Future<EscolaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EscolaRecord.fromSnapshot(s));

  static EscolaRecord fromSnapshot(DocumentSnapshot snapshot) => EscolaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EscolaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EscolaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EscolaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EscolaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEscolaRecordData({
  String? escolacode,
  String? escolanome,
  bool? desativado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'escolacode': escolacode,
      'escolanome': escolanome,
      'desativado': desativado,
    }.withoutNulls,
  );

  return firestoreData;
}

class EscolaRecordDocumentEquality implements Equality<EscolaRecord> {
  const EscolaRecordDocumentEquality();

  @override
  bool equals(EscolaRecord? e1, EscolaRecord? e2) {
    return e1?.escolacode == e2?.escolacode &&
        e1?.escolanome == e2?.escolanome &&
        e1?.desativado == e2?.desativado;
  }

  @override
  int hash(EscolaRecord? e) =>
      const ListEquality().hash([e?.escolacode, e?.escolanome, e?.desativado]);

  @override
  bool isValidKey(Object? o) => o is EscolaRecord;
}
