import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StreamsRecord extends FirestoreRecord {
  StreamsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "stream_name" field.
  String? _streamName;
  String get streamName => _streamName ?? '';
  bool hasStreamName() => _streamName != null;

  // "is_live" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  bool hasIsLive() => _isLive != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "stream_description" field.
  String? _streamDescription;
  String get streamDescription => _streamDescription ?? '';
  bool hasStreamDescription() => _streamDescription != null;

  void _initializeFields() {
    _streamName = snapshotData['stream_name'] as String?;
    _isLive = snapshotData['is_live'] as bool?;
    _url = snapshotData['url'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _streamDescription = snapshotData['stream_description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streams');

  static Stream<StreamsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StreamsRecord.fromSnapshot(s));

  static Future<StreamsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StreamsRecord.fromSnapshot(s));

  static StreamsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StreamsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StreamsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StreamsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StreamsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StreamsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStreamsRecordData({
  String? streamName,
  bool? isLive,
  String? url,
  DateTime? time,
  String? streamDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'stream_name': streamName,
      'is_live': isLive,
      'url': url,
      'time': time,
      'stream_description': streamDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class StreamsRecordDocumentEquality implements Equality<StreamsRecord> {
  const StreamsRecordDocumentEquality();

  @override
  bool equals(StreamsRecord? e1, StreamsRecord? e2) {
    return e1?.streamName == e2?.streamName &&
        e1?.isLive == e2?.isLive &&
        e1?.url == e2?.url &&
        e1?.time == e2?.time &&
        e1?.streamDescription == e2?.streamDescription;
  }

  @override
  int hash(StreamsRecord? e) => const ListEquality()
      .hash([e?.streamName, e?.isLive, e?.url, e?.time, e?.streamDescription]);

  @override
  bool isValidKey(Object? o) => o is StreamsRecord;
}
