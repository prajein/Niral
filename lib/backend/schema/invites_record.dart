import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvitesRecord extends FirestoreRecord {
  InvitesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "SupportGrpInv" field.
  DocumentReference? _supportGrpInv;
  DocumentReference? get supportGrpInv => _supportGrpInv;
  bool hasSupportGrpInv() => _supportGrpInv != null;

  // "InvitedUsers" field.
  List<DocumentReference>? _invitedUsers;
  List<DocumentReference> get invitedUsers => _invitedUsers ?? const [];
  bool hasInvitedUsers() => _invitedUsers != null;

  void _initializeFields() {
    _supportGrpInv = snapshotData['SupportGrpInv'] as DocumentReference?;
    _invitedUsers = getDataList(snapshotData['InvitedUsers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('invites');

  static Stream<InvitesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvitesRecord.fromSnapshot(s));

  static Future<InvitesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvitesRecord.fromSnapshot(s));

  static InvitesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvitesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvitesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvitesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvitesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvitesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvitesRecordData({
  DocumentReference? supportGrpInv,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'SupportGrpInv': supportGrpInv,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvitesRecordDocumentEquality implements Equality<InvitesRecord> {
  const InvitesRecordDocumentEquality();

  @override
  bool equals(InvitesRecord? e1, InvitesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.supportGrpInv == e2?.supportGrpInv &&
        listEquality.equals(e1?.invitedUsers, e2?.invitedUsers);
  }

  @override
  int hash(InvitesRecord? e) =>
      const ListEquality().hash([e?.supportGrpInv, e?.invitedUsers]);

  @override
  bool isValidKey(Object? o) => o is InvitesRecord;
}
