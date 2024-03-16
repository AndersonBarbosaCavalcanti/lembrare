import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBancoRecord extends FirestoreRecord {
  UserBancoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  bool hasCodigo() => _codigo != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _codigo = snapshotData['codigo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('UserBanco');

  static Stream<UserBancoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserBancoRecord.fromSnapshot(s));

  static Future<UserBancoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserBancoRecord.fromSnapshot(s));

  static UserBancoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserBancoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserBancoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserBancoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserBancoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserBancoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserBancoRecordData({
  String? email,
  String? photoUrl,
  DateTime? createdTime,
  String? displayName,
  String? phoneNumber,
  String? uid,
  String? codigo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'uid': uid,
      'codigo': codigo,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserBancoRecordDocumentEquality implements Equality<UserBancoRecord> {
  const UserBancoRecordDocumentEquality();

  @override
  bool equals(UserBancoRecord? e1, UserBancoRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.codigo == e2?.codigo;
  }

  @override
  int hash(UserBancoRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.createdTime,
        e?.displayName,
        e?.phoneNumber,
        e?.uid,
        e?.codigo
      ]);

  @override
  bool isValidKey(Object? o) => o is UserBancoRecord;
}
