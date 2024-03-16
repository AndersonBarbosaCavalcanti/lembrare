import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubsubRecord extends FirestoreRecord {
  SubsubRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "subsubnome" field.
  String? _subsubnome;
  String get subsubnome => _subsubnome ?? '';
  bool hasSubsubnome() => _subsubnome != null;

  // "subcode" field.
  String? _subcode;
  String get subcode => _subcode ?? '';
  bool hasSubcode() => _subcode != null;

  // "subsubcode" field.
  String? _subsubcode;
  String get subsubcode => _subsubcode ?? '';
  bool hasSubsubcode() => _subsubcode != null;

  // "desativado" field.
  bool? _desativado;
  bool get desativado => _desativado ?? false;
  bool hasDesativado() => _desativado != null;

  // "EMUSO" field.
  bool? _emuso;
  bool get emuso => _emuso ?? false;
  bool hasEmuso() => _emuso != null;

  void _initializeFields() {
    _subsubnome = snapshotData['subsubnome'] as String?;
    _subcode = snapshotData['subcode'] as String?;
    _subsubcode = snapshotData['subsubcode'] as String?;
    _desativado = snapshotData['desativado'] as bool?;
    _emuso = snapshotData['EMUSO'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subsub');

  static Stream<SubsubRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubsubRecord.fromSnapshot(s));

  static Future<SubsubRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubsubRecord.fromSnapshot(s));

  static SubsubRecord fromSnapshot(DocumentSnapshot snapshot) => SubsubRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubsubRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubsubRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubsubRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubsubRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubsubRecordData({
  String? subsubnome,
  String? subcode,
  String? subsubcode,
  bool? desativado,
  bool? emuso,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subsubnome': subsubnome,
      'subcode': subcode,
      'subsubcode': subsubcode,
      'desativado': desativado,
      'EMUSO': emuso,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubsubRecordDocumentEquality implements Equality<SubsubRecord> {
  const SubsubRecordDocumentEquality();

  @override
  bool equals(SubsubRecord? e1, SubsubRecord? e2) {
    return e1?.subsubnome == e2?.subsubnome &&
        e1?.subcode == e2?.subcode &&
        e1?.subsubcode == e2?.subsubcode &&
        e1?.desativado == e2?.desativado &&
        e1?.emuso == e2?.emuso;
  }

  @override
  int hash(SubsubRecord? e) => const ListEquality().hash(
      [e?.subsubnome, e?.subcode, e?.subsubcode, e?.desativado, e?.emuso]);

  @override
  bool isValidKey(Object? o) => o is SubsubRecord;
}
