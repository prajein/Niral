import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AICompanionChatsRecord extends FirestoreRecord {
  AICompanionChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "GenerateRef" field.
  DocumentReference? _generateRef;
  DocumentReference? get generateRef => _generateRef;
  bool hasGenerateRef() => _generateRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _generateRef = snapshotData['GenerateRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AI_Companion_Chats');

  static Stream<AICompanionChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AICompanionChatsRecord.fromSnapshot(s));

  static Future<AICompanionChatsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AICompanionChatsRecord.fromSnapshot(s));

  static AICompanionChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AICompanionChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AICompanionChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AICompanionChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AICompanionChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AICompanionChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAICompanionChatsRecordData({
  DocumentReference? generateRef,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'GenerateRef': generateRef,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AICompanionChatsRecordDocumentEquality
    implements Equality<AICompanionChatsRecord> {
  const AICompanionChatsRecordDocumentEquality();

  @override
  bool equals(AICompanionChatsRecord? e1, AICompanionChatsRecord? e2) {
    return e1?.generateRef == e2?.generateRef && e1?.userRef == e2?.userRef;
  }

  @override
  int hash(AICompanionChatsRecord? e) =>
      const ListEquality().hash([e?.generateRef, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is AICompanionChatsRecord;
}
