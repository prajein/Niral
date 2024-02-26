import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostedRefRecord extends FirestoreRecord {
  PostedRefRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "FromGrp" field.
  DocumentReference? _fromGrp;
  DocumentReference? get fromGrp => _fromGrp;
  bool hasFromGrp() => _fromGrp != null;

  // "FromUser" field.
  DocumentReference? _fromUser;
  DocumentReference? get fromUser => _fromUser;
  bool hasFromUser() => _fromUser != null;

  // "WhatPost" field.
  String? _whatPost;
  String get whatPost => _whatPost ?? '';
  bool hasWhatPost() => _whatPost != null;

  void _initializeFields() {
    _fromGrp = snapshotData['FromGrp'] as DocumentReference?;
    _fromUser = snapshotData['FromUser'] as DocumentReference?;
    _whatPost = snapshotData['WhatPost'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PostedRef');

  static Stream<PostedRefRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostedRefRecord.fromSnapshot(s));

  static Future<PostedRefRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostedRefRecord.fromSnapshot(s));

  static PostedRefRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostedRefRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostedRefRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostedRefRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostedRefRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostedRefRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostedRefRecordData({
  DocumentReference? fromGrp,
  DocumentReference? fromUser,
  String? whatPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FromGrp': fromGrp,
      'FromUser': fromUser,
      'WhatPost': whatPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostedRefRecordDocumentEquality implements Equality<PostedRefRecord> {
  const PostedRefRecordDocumentEquality();

  @override
  bool equals(PostedRefRecord? e1, PostedRefRecord? e2) {
    return e1?.fromGrp == e2?.fromGrp &&
        e1?.fromUser == e2?.fromUser &&
        e1?.whatPost == e2?.whatPost;
  }

  @override
  int hash(PostedRefRecord? e) =>
      const ListEquality().hash([e?.fromGrp, e?.fromUser, e?.whatPost]);

  @override
  bool isValidKey(Object? o) => o is PostedRefRecord;
}
