import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubRecord extends FirestoreRecord {
  SubRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "subnome" field.
  String? _subnome;
  String get subnome => _subnome ?? '';
  bool hasSubnome() => _subnome != null;

  // "deckcode" field.
  String? _deckcode;
  String get deckcode => _deckcode ?? '';
  bool hasDeckcode() => _deckcode != null;

  // "subcode" field.
  String? _subcode;
  String get subcode => _subcode ?? '';
  bool hasSubcode() => _subcode != null;

  // "desativado" field.
  bool? _desativado;
  bool get desativado => _desativado ?? false;
  bool hasDesativado() => _desativado != null;

  void _initializeFields() {
    _subnome = snapshotData['subnome'] as String?;
    _deckcode = snapshotData['deckcode'] as String?;
    _subcode = snapshotData['subcode'] as String?;
    _desativado = snapshotData['desativado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sub');

  static Stream<SubRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubRecord.fromSnapshot(s));

  static Future<SubRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubRecord.fromSnapshot(s));

  static SubRecord fromSnapshot(DocumentSnapshot snapshot) => SubRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubRecordData({
  String? subnome,
  String? deckcode,
  String? subcode,
  bool? desativado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subnome': subnome,
      'deckcode': deckcode,
      'subcode': subcode,
      'desativado': desativado,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubRecordDocumentEquality implements Equality<SubRecord> {
  const SubRecordDocumentEquality();

  @override
  bool equals(SubRecord? e1, SubRecord? e2) {
    return e1?.subnome == e2?.subnome &&
        e1?.deckcode == e2?.deckcode &&
        e1?.subcode == e2?.subcode &&
        e1?.desativado == e2?.desativado;
  }

  @override
  int hash(SubRecord? e) => const ListEquality()
      .hash([e?.subnome, e?.deckcode, e?.subcode, e?.desativado]);

  @override
  bool isValidKey(Object? o) => o is SubRecord;
}
