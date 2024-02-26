import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportGroupsRecord extends FirestoreRecord {
  SupportGroupsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Groupname" field.
  String? _groupname;
  String get groupname => _groupname ?? '';
  bool hasGroupname() => _groupname != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "numberofmembers" field.
  int? _numberofmembers;
  int get numberofmembers => _numberofmembers ?? 0;
  bool hasNumberofmembers() => _numberofmembers != null;

  // "AdminRecord" field.
  DocumentReference? _adminRecord;
  DocumentReference? get adminRecord => _adminRecord;
  bool hasAdminRecord() => _adminRecord != null;

  // "MemberRecord" field.
  List<DocumentReference>? _memberRecord;
  List<DocumentReference> get memberRecord => _memberRecord ?? const [];
  bool hasMemberRecord() => _memberRecord != null;

  // "Interest" field.
  List<String>? _interest;
  List<String> get interest => _interest ?? const [];
  bool hasInterest() => _interest != null;

  // "GroupIcon" field.
  String? _groupIcon;
  String get groupIcon => _groupIcon ?? '';
  bool hasGroupIcon() => _groupIcon != null;

  // "NGOrgname" field.
  String? _nGOrgname;
  String get nGOrgname => _nGOrgname ?? '';
  bool hasNGOrgname() => _nGOrgname != null;

  // "websiteNGO" field.
  String? _websiteNGO;
  String get websiteNGO => _websiteNGO ?? '';
  bool hasWebsiteNGO() => _websiteNGO != null;

  // "isNGOrg" field.
  bool? _isNGOrg;
  bool get isNGOrg => _isNGOrg ?? false;
  bool hasIsNGOrg() => _isNGOrg != null;

  // "AouraPoints" field.
  int? _aouraPoints;
  int get aouraPoints => _aouraPoints ?? 0;
  bool hasAouraPoints() => _aouraPoints != null;

  // "GrpSize" field.
  String? _grpSize;
  String get grpSize => _grpSize ?? '';
  bool hasGrpSize() => _grpSize != null;

  // "isVerified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "GroupID" field.
  int? _groupID;
  int get groupID => _groupID ?? 0;
  bool hasGroupID() => _groupID != null;

  // "groupchatref" field.
  DocumentReference? _groupchatref;
  DocumentReference? get groupchatref => _groupchatref;
  bool hasGroupchatref() => _groupchatref != null;

  void _initializeFields() {
    _groupname = snapshotData['Groupname'] as String?;
    _description = snapshotData['description'] as String?;
    _numberofmembers = castToType<int>(snapshotData['numberofmembers']);
    _adminRecord = snapshotData['AdminRecord'] as DocumentReference?;
    _memberRecord = getDataList(snapshotData['MemberRecord']);
    _interest = getDataList(snapshotData['Interest']);
    _groupIcon = snapshotData['GroupIcon'] as String?;
    _nGOrgname = snapshotData['NGOrgname'] as String?;
    _websiteNGO = snapshotData['websiteNGO'] as String?;
    _isNGOrg = snapshotData['isNGOrg'] as bool?;
    _aouraPoints = castToType<int>(snapshotData['AouraPoints']);
    _grpSize = snapshotData['GrpSize'] as String?;
    _isVerified = snapshotData['isVerified'] as bool?;
    _groupID = castToType<int>(snapshotData['GroupID']);
    _groupchatref = snapshotData['groupchatref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SupportGroups');

  static Stream<SupportGroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportGroupsRecord.fromSnapshot(s));

  static Future<SupportGroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportGroupsRecord.fromSnapshot(s));

  static SupportGroupsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportGroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportGroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportGroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportGroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportGroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportGroupsRecordData({
  String? groupname,
  String? description,
  int? numberofmembers,
  DocumentReference? adminRecord,
  String? groupIcon,
  String? nGOrgname,
  String? websiteNGO,
  bool? isNGOrg,
  int? aouraPoints,
  String? grpSize,
  bool? isVerified,
  int? groupID,
  DocumentReference? groupchatref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Groupname': groupname,
      'description': description,
      'numberofmembers': numberofmembers,
      'AdminRecord': adminRecord,
      'GroupIcon': groupIcon,
      'NGOrgname': nGOrgname,
      'websiteNGO': websiteNGO,
      'isNGOrg': isNGOrg,
      'AouraPoints': aouraPoints,
      'GrpSize': grpSize,
      'isVerified': isVerified,
      'GroupID': groupID,
      'groupchatref': groupchatref,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportGroupsRecordDocumentEquality
    implements Equality<SupportGroupsRecord> {
  const SupportGroupsRecordDocumentEquality();

  @override
  bool equals(SupportGroupsRecord? e1, SupportGroupsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.groupname == e2?.groupname &&
        e1?.description == e2?.description &&
        e1?.numberofmembers == e2?.numberofmembers &&
        e1?.adminRecord == e2?.adminRecord &&
        listEquality.equals(e1?.memberRecord, e2?.memberRecord) &&
        listEquality.equals(e1?.interest, e2?.interest) &&
        e1?.groupIcon == e2?.groupIcon &&
        e1?.nGOrgname == e2?.nGOrgname &&
        e1?.websiteNGO == e2?.websiteNGO &&
        e1?.isNGOrg == e2?.isNGOrg &&
        e1?.aouraPoints == e2?.aouraPoints &&
        e1?.grpSize == e2?.grpSize &&
        e1?.isVerified == e2?.isVerified &&
        e1?.groupID == e2?.groupID &&
        e1?.groupchatref == e2?.groupchatref;
  }

  @override
  int hash(SupportGroupsRecord? e) => const ListEquality().hash([
        e?.groupname,
        e?.description,
        e?.numberofmembers,
        e?.adminRecord,
        e?.memberRecord,
        e?.interest,
        e?.groupIcon,
        e?.nGOrgname,
        e?.websiteNGO,
        e?.isNGOrg,
        e?.aouraPoints,
        e?.grpSize,
        e?.isVerified,
        e?.groupID,
        e?.groupchatref
      ]);

  @override
  bool isValidKey(Object? o) => o is SupportGroupsRecord;
}
