import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportarerroRecord extends FirestoreRecord {
  ReportarerroRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "questcode" field.
  String? _questcode;
  String get questcode => _questcode ?? '';
  bool hasQuestcode() => _questcode != null;

  // "erros" field.
  List<String>? _erros;
  List<String> get erros => _erros ?? const [];
  bool hasErros() => _erros != null;

  // "errook" field.
  List<bool>? _errook;
  List<bool> get errook => _errook ?? const [];
  bool hasErrook() => _errook != null;

  void _initializeFields() {
    _questcode = snapshotData['questcode'] as String?;
    _erros = getDataList(snapshotData['erros']);
    _errook = getDataList(snapshotData['errook']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reportarerro');

  static Stream<ReportarerroRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportarerroRecord.fromSnapshot(s));

  static Future<ReportarerroRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportarerroRecord.fromSnapshot(s));

  static ReportarerroRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportarerroRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportarerroRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportarerroRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportarerroRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportarerroRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportarerroRecordData({
  String? questcode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'questcode': questcode,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportarerroRecordDocumentEquality
    implements Equality<ReportarerroRecord> {
  const ReportarerroRecordDocumentEquality();

  @override
  bool equals(ReportarerroRecord? e1, ReportarerroRecord? e2) {
    const listEquality = ListEquality();
    return e1?.questcode == e2?.questcode &&
        listEquality.equals(e1?.erros, e2?.erros) &&
        listEquality.equals(e1?.errook, e2?.errook);
  }

  @override
  int hash(ReportarerroRecord? e) =>
      const ListEquality().hash([e?.questcode, e?.erros, e?.errook]);

  @override
  bool isValidKey(Object? o) => o is ReportarerroRecord;
}
