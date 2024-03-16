import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CredenciaisRecord extends FirestoreRecord {
  CredenciaisRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "plataforma" field.
  String? _plataforma;
  String get plataforma => _plataforma ?? '';
  bool hasPlataforma() => _plataforma != null;

  // "codigos" field.
  List<String>? _codigos;
  List<String> get codigos => _codigos ?? const [];
  bool hasCodigos() => _codigos != null;

  // "escola" field.
  String? _escola;
  String get escola => _escola ?? '';
  bool hasEscola() => _escola != null;

  void _initializeFields() {
    _plataforma = snapshotData['plataforma'] as String?;
    _codigos = getDataList(snapshotData['codigos']);
    _escola = snapshotData['escola'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CREDENCIAIS');

  static Stream<CredenciaisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CredenciaisRecord.fromSnapshot(s));

  static Future<CredenciaisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CredenciaisRecord.fromSnapshot(s));

  static CredenciaisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CredenciaisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CredenciaisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CredenciaisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CredenciaisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CredenciaisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCredenciaisRecordData({
  String? plataforma,
  String? escola,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'plataforma': plataforma,
      'escola': escola,
    }.withoutNulls,
  );

  return firestoreData;
}

class CredenciaisRecordDocumentEquality implements Equality<CredenciaisRecord> {
  const CredenciaisRecordDocumentEquality();

  @override
  bool equals(CredenciaisRecord? e1, CredenciaisRecord? e2) {
    const listEquality = ListEquality();
    return e1?.plataforma == e2?.plataforma &&
        listEquality.equals(e1?.codigos, e2?.codigos) &&
        e1?.escola == e2?.escola;
  }

  @override
  int hash(CredenciaisRecord? e) =>
      const ListEquality().hash([e?.plataforma, e?.codigos, e?.escola]);

  @override
  bool isValidKey(Object? o) => o is CredenciaisRecord;
}
