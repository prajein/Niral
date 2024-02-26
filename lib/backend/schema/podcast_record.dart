import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PodcastRecord extends FirestoreRecord {
  PodcastRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  bool hasSubtitle() => _subtitle != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "fromGrp" field.
  DocumentReference? _fromGrp;
  DocumentReference? get fromGrp => _fromGrp;
  bool hasFromGrp() => _fromGrp != null;

  // "fromUser" field.
  DocumentReference? _fromUser;
  DocumentReference? get fromUser => _fromUser;
  bool hasFromUser() => _fromUser != null;

  // "PostedTime" field.
  DateTime? _postedTime;
  DateTime? get postedTime => _postedTime;
  bool hasPostedTime() => _postedTime != null;

  // "Likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "can_show_user" field.
  bool? _canShowUser;
  bool get canShowUser => _canShowUser ?? false;
  bool hasCanShowUser() => _canShowUser != null;

  // "Podcast" field.
  String? _podcast;
  String get podcast => _podcast ?? '';
  bool hasPodcast() => _podcast != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _subtitle = snapshotData['Subtitle'] as String?;
    _image = snapshotData['image'] as String?;
    _fromGrp = snapshotData['fromGrp'] as DocumentReference?;
    _fromUser = snapshotData['fromUser'] as DocumentReference?;
    _postedTime = snapshotData['PostedTime'] as DateTime?;
    _likes = castToType<int>(snapshotData['Likes']);
    _canShowUser = snapshotData['can_show_user'] as bool?;
    _podcast = snapshotData['Podcast'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Podcast');

  static Stream<PodcastRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PodcastRecord.fromSnapshot(s));

  static Future<PodcastRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PodcastRecord.fromSnapshot(s));

  static PodcastRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PodcastRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PodcastRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PodcastRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PodcastRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PodcastRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPodcastRecordData({
  String? title,
  String? subtitle,
  String? image,
  DocumentReference? fromGrp,
  DocumentReference? fromUser,
  DateTime? postedTime,
  int? likes,
  bool? canShowUser,
  String? podcast,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Subtitle': subtitle,
      'image': image,
      'fromGrp': fromGrp,
      'fromUser': fromUser,
      'PostedTime': postedTime,
      'Likes': likes,
      'can_show_user': canShowUser,
      'Podcast': podcast,
    }.withoutNulls,
  );

  return firestoreData;
}

class PodcastRecordDocumentEquality implements Equality<PodcastRecord> {
  const PodcastRecordDocumentEquality();

  @override
  bool equals(PodcastRecord? e1, PodcastRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle &&
        e1?.image == e2?.image &&
        e1?.fromGrp == e2?.fromGrp &&
        e1?.fromUser == e2?.fromUser &&
        e1?.postedTime == e2?.postedTime &&
        e1?.likes == e2?.likes &&
        e1?.canShowUser == e2?.canShowUser &&
        e1?.podcast == e2?.podcast;
  }

  @override
  int hash(PodcastRecord? e) => const ListEquality().hash([
        e?.title,
        e?.subtitle,
        e?.image,
        e?.fromGrp,
        e?.fromUser,
        e?.postedTime,
        e?.likes,
        e?.canShowUser,
        e?.podcast
      ]);

  @override
  bool isValidKey(Object? o) => o is PodcastRecord;
}
