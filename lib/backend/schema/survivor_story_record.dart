import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurvivorStoryRecord extends FirestoreRecord {
  SurvivorStoryRecord._(
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

  // "Story" field.
  String? _story;
  String get story => _story ?? '';
  bool hasStory() => _story != null;

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

  // "AddLikes" field.
  DocumentReference? _addLikes;
  DocumentReference? get addLikes => _addLikes;
  bool hasAddLikes() => _addLikes != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _subtitle = snapshotData['Subtitle'] as String?;
    _story = snapshotData['Story'] as String?;
    _image = snapshotData['image'] as String?;
    _fromGrp = snapshotData['fromGrp'] as DocumentReference?;
    _fromUser = snapshotData['fromUser'] as DocumentReference?;
    _postedTime = snapshotData['PostedTime'] as DateTime?;
    _likes = castToType<int>(snapshotData['Likes']);
    _canShowUser = snapshotData['can_show_user'] as bool?;
    _addLikes = snapshotData['AddLikes'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SurvivorStory');

  static Stream<SurvivorStoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurvivorStoryRecord.fromSnapshot(s));

  static Future<SurvivorStoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurvivorStoryRecord.fromSnapshot(s));

  static SurvivorStoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SurvivorStoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurvivorStoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurvivorStoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurvivorStoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurvivorStoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurvivorStoryRecordData({
  String? title,
  String? subtitle,
  String? story,
  String? image,
  DocumentReference? fromGrp,
  DocumentReference? fromUser,
  DateTime? postedTime,
  int? likes,
  bool? canShowUser,
  DocumentReference? addLikes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Subtitle': subtitle,
      'Story': story,
      'image': image,
      'fromGrp': fromGrp,
      'fromUser': fromUser,
      'PostedTime': postedTime,
      'Likes': likes,
      'can_show_user': canShowUser,
      'AddLikes': addLikes,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurvivorStoryRecordDocumentEquality
    implements Equality<SurvivorStoryRecord> {
  const SurvivorStoryRecordDocumentEquality();

  @override
  bool equals(SurvivorStoryRecord? e1, SurvivorStoryRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle &&
        e1?.story == e2?.story &&
        e1?.image == e2?.image &&
        e1?.fromGrp == e2?.fromGrp &&
        e1?.fromUser == e2?.fromUser &&
        e1?.postedTime == e2?.postedTime &&
        e1?.likes == e2?.likes &&
        e1?.canShowUser == e2?.canShowUser &&
        e1?.addLikes == e2?.addLikes;
  }

  @override
  int hash(SurvivorStoryRecord? e) => const ListEquality().hash([
        e?.title,
        e?.subtitle,
        e?.story,
        e?.image,
        e?.fromGrp,
        e?.fromUser,
        e?.postedTime,
        e?.likes,
        e?.canShowUser,
        e?.addLikes
      ]);

  @override
  bool isValidKey(Object? o) => o is SurvivorStoryRecord;
}
