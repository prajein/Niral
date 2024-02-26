import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CampaingsRecord extends FirestoreRecord {
  CampaingsRecord._(
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

  // "EventDate" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  bool hasPlace() => _place != null;

  // "Content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _subtitle = snapshotData['Subtitle'] as String?;
    _image = snapshotData['image'] as String?;
    _fromGrp = snapshotData['fromGrp'] as DocumentReference?;
    _fromUser = snapshotData['fromUser'] as DocumentReference?;
    _postedTime = snapshotData['PostedTime'] as DateTime?;
    _likes = castToType<int>(snapshotData['Likes']);
    _canShowUser = snapshotData['can_show_user'] as bool?;
    _eventDate = snapshotData['EventDate'] as DateTime?;
    _place = snapshotData['place'] as String?;
    _content = snapshotData['Content'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Campaings');

  static Stream<CampaingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CampaingsRecord.fromSnapshot(s));

  static Future<CampaingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CampaingsRecord.fromSnapshot(s));

  static CampaingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CampaingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CampaingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CampaingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CampaingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CampaingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCampaingsRecordData({
  String? title,
  String? subtitle,
  String? image,
  DocumentReference? fromGrp,
  DocumentReference? fromUser,
  DateTime? postedTime,
  int? likes,
  bool? canShowUser,
  DateTime? eventDate,
  String? place,
  String? content,
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
      'EventDate': eventDate,
      'place': place,
      'Content': content,
    }.withoutNulls,
  );

  return firestoreData;
}

class CampaingsRecordDocumentEquality implements Equality<CampaingsRecord> {
  const CampaingsRecordDocumentEquality();

  @override
  bool equals(CampaingsRecord? e1, CampaingsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle &&
        e1?.image == e2?.image &&
        e1?.fromGrp == e2?.fromGrp &&
        e1?.fromUser == e2?.fromUser &&
        e1?.postedTime == e2?.postedTime &&
        e1?.likes == e2?.likes &&
        e1?.canShowUser == e2?.canShowUser &&
        e1?.eventDate == e2?.eventDate &&
        e1?.place == e2?.place &&
        e1?.content == e2?.content;
  }

  @override
  int hash(CampaingsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.subtitle,
        e?.image,
        e?.fromGrp,
        e?.fromUser,
        e?.postedTime,
        e?.likes,
        e?.canShowUser,
        e?.eventDate,
        e?.place,
        e?.content
      ]);

  @override
  bool isValidKey(Object? o) => o is CampaingsRecord;
}
