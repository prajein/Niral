import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PicturesRecord extends FirestoreRecord {
  PicturesRecord._(
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

  // "is_liked" field.
  bool? _isLiked;
  bool get isLiked => _isLiked ?? false;
  bool hasIsLiked() => _isLiked != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _subtitle = snapshotData['Subtitle'] as String?;
    _image = snapshotData['image'] as String?;
    _fromGrp = snapshotData['fromGrp'] as DocumentReference?;
    _fromUser = snapshotData['fromUser'] as DocumentReference?;
    _postedTime = snapshotData['PostedTime'] as DateTime?;
    _likes = castToType<int>(snapshotData['Likes']);
    _canShowUser = snapshotData['can_show_user'] as bool?;
    _isLiked = snapshotData['is_liked'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Pictures');

  static Stream<PicturesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PicturesRecord.fromSnapshot(s));

  static Future<PicturesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PicturesRecord.fromSnapshot(s));

  static PicturesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PicturesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PicturesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PicturesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PicturesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PicturesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPicturesRecordData({
  String? title,
  String? subtitle,
  String? image,
  DocumentReference? fromGrp,
  DocumentReference? fromUser,
  DateTime? postedTime,
  int? likes,
  bool? canShowUser,
  bool? isLiked,
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
      'is_liked': isLiked,
    }.withoutNulls,
  );

  return firestoreData;
}

class PicturesRecordDocumentEquality implements Equality<PicturesRecord> {
  const PicturesRecordDocumentEquality();

  @override
  bool equals(PicturesRecord? e1, PicturesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle &&
        e1?.image == e2?.image &&
        e1?.fromGrp == e2?.fromGrp &&
        e1?.fromUser == e2?.fromUser &&
        e1?.postedTime == e2?.postedTime &&
        e1?.likes == e2?.likes &&
        e1?.canShowUser == e2?.canShowUser &&
        e1?.isLiked == e2?.isLiked;
  }

  @override
  int hash(PicturesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.subtitle,
        e?.image,
        e?.fromGrp,
        e?.fromUser,
        e?.postedTime,
        e?.likes,
        e?.canShowUser,
        e?.isLiked
      ]);

  @override
  bool isValidKey(Object? o) => o is PicturesRecord;
}
