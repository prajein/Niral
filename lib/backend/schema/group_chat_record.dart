import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupChatRecord extends FirestoreRecord {
  GroupChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "img_msg" field.
  String? _imgMsg;
  String get imgMsg => _imgMsg ?? '';
  bool hasImgMsg() => _imgMsg != null;

  // "audio_msg" field.
  String? _audioMsg;
  String get audioMsg => _audioMsg ?? '';
  bool hasAudioMsg() => _audioMsg != null;

  // "video_msg" field.
  String? _videoMsg;
  String get videoMsg => _videoMsg ?? '';
  bool hasVideoMsg() => _videoMsg != null;

  // "Tasks" field.
  String? _tasks;
  String get tasks => _tasks ?? '';
  bool hasTasks() => _tasks != null;

  // "textmsg" field.
  String? _textmsg;
  String get textmsg => _textmsg ?? '';
  bool hasTextmsg() => _textmsg != null;

  // "fromuser" field.
  DocumentReference? _fromuser;
  DocumentReference? get fromuser => _fromuser;
  bool hasFromuser() => _fromuser != null;

  // "last_msg" field.
  String? _lastMsg;
  String get lastMsg => _lastMsg ?? '';
  bool hasLastMsg() => _lastMsg != null;

  // "fromgrp" field.
  DocumentReference? _fromgrp;
  DocumentReference? get fromgrp => _fromgrp;
  bool hasFromgrp() => _fromgrp != null;

  // "last_msg_time" field.
  DateTime? _lastMsgTime;
  DateTime? get lastMsgTime => _lastMsgTime;
  bool hasLastMsgTime() => _lastMsgTime != null;

  // "last_msg_sent" field.
  DocumentReference? _lastMsgSent;
  DocumentReference? get lastMsgSent => _lastMsgSent;
  bool hasLastMsgSent() => _lastMsgSent != null;

  // "last_msg_seen" field.
  List<DocumentReference>? _lastMsgSeen;
  List<DocumentReference> get lastMsgSeen => _lastMsgSeen ?? const [];
  bool hasLastMsgSeen() => _lastMsgSeen != null;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _imgMsg = snapshotData['img_msg'] as String?;
    _audioMsg = snapshotData['audio_msg'] as String?;
    _videoMsg = snapshotData['video_msg'] as String?;
    _tasks = snapshotData['Tasks'] as String?;
    _textmsg = snapshotData['textmsg'] as String?;
    _fromuser = snapshotData['fromuser'] as DocumentReference?;
    _lastMsg = snapshotData['last_msg'] as String?;
    _fromgrp = snapshotData['fromgrp'] as DocumentReference?;
    _lastMsgTime = snapshotData['last_msg_time'] as DateTime?;
    _lastMsgSent = snapshotData['last_msg_sent'] as DocumentReference?;
    _lastMsgSeen = getDataList(snapshotData['last_msg_seen']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('GroupChat');

  static Stream<GroupChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupChatRecord.fromSnapshot(s));

  static Future<GroupChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupChatRecord.fromSnapshot(s));

  static GroupChatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupChatRecordData({
  DateTime? timestamp,
  String? imgMsg,
  String? audioMsg,
  String? videoMsg,
  String? tasks,
  String? textmsg,
  DocumentReference? fromuser,
  String? lastMsg,
  DocumentReference? fromgrp,
  DateTime? lastMsgTime,
  DocumentReference? lastMsgSent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'img_msg': imgMsg,
      'audio_msg': audioMsg,
      'video_msg': videoMsg,
      'Tasks': tasks,
      'textmsg': textmsg,
      'fromuser': fromuser,
      'last_msg': lastMsg,
      'fromgrp': fromgrp,
      'last_msg_time': lastMsgTime,
      'last_msg_sent': lastMsgSent,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupChatRecordDocumentEquality implements Equality<GroupChatRecord> {
  const GroupChatRecordDocumentEquality();

  @override
  bool equals(GroupChatRecord? e1, GroupChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timestamp == e2?.timestamp &&
        e1?.imgMsg == e2?.imgMsg &&
        e1?.audioMsg == e2?.audioMsg &&
        e1?.videoMsg == e2?.videoMsg &&
        e1?.tasks == e2?.tasks &&
        e1?.textmsg == e2?.textmsg &&
        e1?.fromuser == e2?.fromuser &&
        e1?.lastMsg == e2?.lastMsg &&
        e1?.fromgrp == e2?.fromgrp &&
        e1?.lastMsgTime == e2?.lastMsgTime &&
        e1?.lastMsgSent == e2?.lastMsgSent &&
        listEquality.equals(e1?.lastMsgSeen, e2?.lastMsgSeen);
  }

  @override
  int hash(GroupChatRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.imgMsg,
        e?.audioMsg,
        e?.videoMsg,
        e?.tasks,
        e?.textmsg,
        e?.fromuser,
        e?.lastMsg,
        e?.fromgrp,
        e?.lastMsgTime,
        e?.lastMsgSent,
        e?.lastMsgSeen
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupChatRecord;
}
