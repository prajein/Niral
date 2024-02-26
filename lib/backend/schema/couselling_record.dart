import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CousellingRecord extends FirestoreRecord {
  CousellingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_contact_info" field.
  String? _userContactInfo;
  String get userContactInfo => _userContactInfo ?? '';
  bool hasUserContactInfo() => _userContactInfo != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date_and_time" field.
  DateTime? _dateAndTime;
  DateTime? get dateAndTime => _dateAndTime;
  bool hasDateAndTime() => _dateAndTime != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "counsellingremarks" field.
  String? _counsellingremarks;
  String get counsellingremarks => _counsellingremarks ?? '';
  bool hasCounsellingremarks() => _counsellingremarks != null;

  void _initializeFields() {
    _userName = snapshotData['user_name'] as String?;
    _userContactInfo = snapshotData['user_contact_info'] as String?;
    _description = snapshotData['description'] as String?;
    _dateAndTime = snapshotData['date_and_time'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _counsellingremarks = snapshotData['counsellingremarks'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Couselling');

  static Stream<CousellingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CousellingRecord.fromSnapshot(s));

  static Future<CousellingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CousellingRecord.fromSnapshot(s));

  static CousellingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CousellingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CousellingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CousellingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CousellingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CousellingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCousellingRecordData({
  String? userName,
  String? userContactInfo,
  String? description,
  DateTime? dateAndTime,
  DocumentReference? userRef,
  String? counsellingremarks,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_name': userName,
      'user_contact_info': userContactInfo,
      'description': description,
      'date_and_time': dateAndTime,
      'user_ref': userRef,
      'counsellingremarks': counsellingremarks,
    }.withoutNulls,
  );

  return firestoreData;
}

class CousellingRecordDocumentEquality implements Equality<CousellingRecord> {
  const CousellingRecordDocumentEquality();

  @override
  bool equals(CousellingRecord? e1, CousellingRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.userContactInfo == e2?.userContactInfo &&
        e1?.description == e2?.description &&
        e1?.dateAndTime == e2?.dateAndTime &&
        e1?.userRef == e2?.userRef &&
        e1?.counsellingremarks == e2?.counsellingremarks;
  }

  @override
  int hash(CousellingRecord? e) => const ListEquality().hash([
        e?.userName,
        e?.userContactInfo,
        e?.description,
        e?.dateAndTime,
        e?.userRef,
        e?.counsellingremarks
      ]);

  @override
  bool isValidKey(Object? o) => o is CousellingRecord;
}
