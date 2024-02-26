import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GenerateRecord extends FirestoreRecord {
  GenerateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prompt" field.
  String? _prompt;
  String get prompt => _prompt ?? '';
  bool hasPrompt() => _prompt != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  bool hasResponse() => _response != null;

  // "createTime" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "status" field.
  Status? _status;
  Status? get status => _status;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _prompt = snapshotData['prompt'] as String?;
    _response = snapshotData['response'] as String?;
    _createTime = snapshotData['createTime'] as DateTime?;
    _status = deserializeEnum<Status>(snapshotData['status']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('generate')
          : FirebaseFirestore.instance.collectionGroup('generate');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('generate').doc(id);

  static Stream<GenerateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GenerateRecord.fromSnapshot(s));

  static Future<GenerateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GenerateRecord.fromSnapshot(s));

  static GenerateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GenerateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GenerateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GenerateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GenerateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GenerateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGenerateRecordData({
  String? prompt,
  String? response,
  DateTime? createTime,
  Status? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prompt': prompt,
      'response': response,
      'createTime': createTime,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class GenerateRecordDocumentEquality implements Equality<GenerateRecord> {
  const GenerateRecordDocumentEquality();

  @override
  bool equals(GenerateRecord? e1, GenerateRecord? e2) {
    return e1?.prompt == e2?.prompt &&
        e1?.response == e2?.response &&
        e1?.createTime == e2?.createTime &&
        e1?.status == e2?.status;
  }

  @override
  int hash(GenerateRecord? e) => const ListEquality()
      .hash([e?.prompt, e?.response, e?.createTime, e?.status]);

  @override
  bool isValidKey(Object? o) => o is GenerateRecord;
}
