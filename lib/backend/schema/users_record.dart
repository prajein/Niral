import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "Hobbies" field.
  List<String>? _hobbies;
  List<String> get hobbies => _hobbies ?? const [];
  bool hasHobbies() => _hobbies != null;

  // "AouraPoints" field.
  int? _aouraPoints;
  int get aouraPoints => _aouraPoints ?? 0;
  bool hasAouraPoints() => _aouraPoints != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "degree_of_harm" field.
  String? _degreeOfHarm;
  String get degreeOfHarm => _degreeOfHarm ?? '';
  bool hasDegreeOfHarm() => _degreeOfHarm != null;

  // "physical_injury_level" field.
  int? _physicalInjuryLevel;
  int get physicalInjuryLevel => _physicalInjuryLevel ?? 0;
  bool hasPhysicalInjuryLevel() => _physicalInjuryLevel != null;

  // "emotional_distress_level" field.
  int? _emotionalDistressLevel;
  int get emotionalDistressLevel => _emotionalDistressLevel ?? 0;
  bool hasEmotionalDistressLevel() => _emotionalDistressLevel != null;

  // "type_of_harm_encode" field.
  int? _typeOfHarmEncode;
  int get typeOfHarmEncode => _typeOfHarmEncode ?? 0;
  bool hasTypeOfHarmEncode() => _typeOfHarmEncode != null;

  // "goals" field.
  String? _goals;
  String get goals => _goals ?? '';
  bool hasGoals() => _goals != null;

  // "goal_achieved" field.
  int? _goalAchieved;
  int get goalAchieved => _goalAchieved ?? 0;
  bool hasGoalAchieved() => _goalAchieved != null;

  // "is_admin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "type_of_support" field.
  String? _typeOfSupport;
  String get typeOfSupport => _typeOfSupport ?? '';
  bool hasTypeOfSupport() => _typeOfSupport != null;

  // "digita_app_comfort" field.
  String? _digitaAppComfort;
  String get digitaAppComfort => _digitaAppComfort ?? '';
  bool hasDigitaAppComfort() => _digitaAppComfort != null;

  // "AgeInStr" field.
  String? _ageInStr;
  String get ageInStr => _ageInStr ?? '';
  bool hasAgeInStr() => _ageInStr != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _gender = snapshotData['gender'] as String?;
    _hobbies = getDataList(snapshotData['Hobbies']);
    _aouraPoints = castToType<int>(snapshotData['AouraPoints']);
    _age = castToType<int>(snapshotData['age']);
    _degreeOfHarm = snapshotData['degree_of_harm'] as String?;
    _physicalInjuryLevel =
        castToType<int>(snapshotData['physical_injury_level']);
    _emotionalDistressLevel =
        castToType<int>(snapshotData['emotional_distress_level']);
    _typeOfHarmEncode = castToType<int>(snapshotData['type_of_harm_encode']);
    _goals = snapshotData['goals'] as String?;
    _goalAchieved = castToType<int>(snapshotData['goal_achieved']);
    _isAdmin = snapshotData['is_admin'] as bool?;
    _typeOfSupport = snapshotData['type_of_support'] as String?;
    _digitaAppComfort = snapshotData['digita_app_comfort'] as String?;
    _ageInStr = snapshotData['AgeInStr'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? gender,
  int? aouraPoints,
  int? age,
  String? degreeOfHarm,
  int? physicalInjuryLevel,
  int? emotionalDistressLevel,
  int? typeOfHarmEncode,
  String? goals,
  int? goalAchieved,
  bool? isAdmin,
  String? typeOfSupport,
  String? digitaAppComfort,
  String? ageInStr,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'gender': gender,
      'AouraPoints': aouraPoints,
      'age': age,
      'degree_of_harm': degreeOfHarm,
      'physical_injury_level': physicalInjuryLevel,
      'emotional_distress_level': emotionalDistressLevel,
      'type_of_harm_encode': typeOfHarmEncode,
      'goals': goals,
      'goal_achieved': goalAchieved,
      'is_admin': isAdmin,
      'type_of_support': typeOfSupport,
      'digita_app_comfort': digitaAppComfort,
      'AgeInStr': ageInStr,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.gender == e2?.gender &&
        listEquality.equals(e1?.hobbies, e2?.hobbies) &&
        e1?.aouraPoints == e2?.aouraPoints &&
        e1?.age == e2?.age &&
        e1?.degreeOfHarm == e2?.degreeOfHarm &&
        e1?.physicalInjuryLevel == e2?.physicalInjuryLevel &&
        e1?.emotionalDistressLevel == e2?.emotionalDistressLevel &&
        e1?.typeOfHarmEncode == e2?.typeOfHarmEncode &&
        e1?.goals == e2?.goals &&
        e1?.goalAchieved == e2?.goalAchieved &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.typeOfSupport == e2?.typeOfSupport &&
        e1?.digitaAppComfort == e2?.digitaAppComfort &&
        e1?.ageInStr == e2?.ageInStr;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.gender,
        e?.hobbies,
        e?.aouraPoints,
        e?.age,
        e?.degreeOfHarm,
        e?.physicalInjuryLevel,
        e?.emotionalDistressLevel,
        e?.typeOfHarmEncode,
        e?.goals,
        e?.goalAchieved,
        e?.isAdmin,
        e?.typeOfSupport,
        e?.digitaAppComfort,
        e?.ageInStr
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
