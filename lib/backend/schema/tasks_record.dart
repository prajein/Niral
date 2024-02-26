import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "task1_name" field.
  String? _task1Name;
  String get task1Name => _task1Name ?? '';
  bool hasTask1Name() => _task1Name != null;

  // "task1_info" field.
  String? _task1Info;
  String get task1Info => _task1Info ?? '';
  bool hasTask1Info() => _task1Info != null;

  // "task2_name" field.
  String? _task2Name;
  String get task2Name => _task2Name ?? '';
  bool hasTask2Name() => _task2Name != null;

  // "task2_info" field.
  String? _task2Info;
  String get task2Info => _task2Info ?? '';
  bool hasTask2Info() => _task2Info != null;

  // "task3_name" field.
  String? _task3Name;
  String get task3Name => _task3Name ?? '';
  bool hasTask3Name() => _task3Name != null;

  // "task3_info" field.
  String? _task3Info;
  String get task3Info => _task3Info ?? '';
  bool hasTask3Info() => _task3Info != null;

  // "task1_points" field.
  int? _task1Points;
  int get task1Points => _task1Points ?? 0;
  bool hasTask1Points() => _task1Points != null;

  // "task2_points" field.
  int? _task2Points;
  int get task2Points => _task2Points ?? 0;
  bool hasTask2Points() => _task2Points != null;

  // "task3_points" field.
  int? _task3Points;
  int get task3Points => _task3Points ?? 0;
  bool hasTask3Points() => _task3Points != null;

  // "quotes" field.
  String? _quotes;
  String get quotes => _quotes ?? '';
  bool hasQuotes() => _quotes != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "task1_completed" field.
  bool? _task1Completed;
  bool get task1Completed => _task1Completed ?? false;
  bool hasTask1Completed() => _task1Completed != null;

  // "task2_completed" field.
  bool? _task2Completed;
  bool get task2Completed => _task2Completed ?? false;
  bool hasTask2Completed() => _task2Completed != null;

  // "task3_completed" field.
  bool? _task3Completed;
  bool get task3Completed => _task3Completed ?? false;
  bool hasTask3Completed() => _task3Completed != null;

  // "morning_task" field.
  String? _morningTask;
  String get morningTask => _morningTask ?? '';
  bool hasMorningTask() => _morningTask != null;

  // "morning_description" field.
  String? _morningDescription;
  String get morningDescription => _morningDescription ?? '';
  bool hasMorningDescription() => _morningDescription != null;

  // "morning_task_completed" field.
  bool? _morningTaskCompleted;
  bool get morningTaskCompleted => _morningTaskCompleted ?? false;
  bool hasMorningTaskCompleted() => _morningTaskCompleted != null;

  // "completedTaskNumber" field.
  int? _completedTaskNumber;
  int get completedTaskNumber => _completedTaskNumber ?? 0;
  bool hasCompletedTaskNumber() => _completedTaskNumber != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _task1Name = snapshotData['task1_name'] as String?;
    _task1Info = snapshotData['task1_info'] as String?;
    _task2Name = snapshotData['task2_name'] as String?;
    _task2Info = snapshotData['task2_info'] as String?;
    _task3Name = snapshotData['task3_name'] as String?;
    _task3Info = snapshotData['task3_info'] as String?;
    _task1Points = castToType<int>(snapshotData['task1_points']);
    _task2Points = castToType<int>(snapshotData['task2_points']);
    _task3Points = castToType<int>(snapshotData['task3_points']);
    _quotes = snapshotData['quotes'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _task1Completed = snapshotData['task1_completed'] as bool?;
    _task2Completed = snapshotData['task2_completed'] as bool?;
    _task3Completed = snapshotData['task3_completed'] as bool?;
    _morningTask = snapshotData['morning_task'] as String?;
    _morningDescription = snapshotData['morning_description'] as String?;
    _morningTaskCompleted = snapshotData['morning_task_completed'] as bool?;
    _completedTaskNumber = castToType<int>(snapshotData['completedTaskNumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  DateTime? date,
  String? task1Name,
  String? task1Info,
  String? task2Name,
  String? task2Info,
  String? task3Name,
  String? task3Info,
  int? task1Points,
  int? task2Points,
  int? task3Points,
  String? quotes,
  DocumentReference? user,
  bool? task1Completed,
  bool? task2Completed,
  bool? task3Completed,
  String? morningTask,
  String? morningDescription,
  bool? morningTaskCompleted,
  int? completedTaskNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'task1_name': task1Name,
      'task1_info': task1Info,
      'task2_name': task2Name,
      'task2_info': task2Info,
      'task3_name': task3Name,
      'task3_info': task3Info,
      'task1_points': task1Points,
      'task2_points': task2Points,
      'task3_points': task3Points,
      'quotes': quotes,
      'user': user,
      'task1_completed': task1Completed,
      'task2_completed': task2Completed,
      'task3_completed': task3Completed,
      'morning_task': morningTask,
      'morning_description': morningDescription,
      'morning_task_completed': morningTaskCompleted,
      'completedTaskNumber': completedTaskNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.task1Name == e2?.task1Name &&
        e1?.task1Info == e2?.task1Info &&
        e1?.task2Name == e2?.task2Name &&
        e1?.task2Info == e2?.task2Info &&
        e1?.task3Name == e2?.task3Name &&
        e1?.task3Info == e2?.task3Info &&
        e1?.task1Points == e2?.task1Points &&
        e1?.task2Points == e2?.task2Points &&
        e1?.task3Points == e2?.task3Points &&
        e1?.quotes == e2?.quotes &&
        e1?.user == e2?.user &&
        e1?.task1Completed == e2?.task1Completed &&
        e1?.task2Completed == e2?.task2Completed &&
        e1?.task3Completed == e2?.task3Completed &&
        e1?.morningTask == e2?.morningTask &&
        e1?.morningDescription == e2?.morningDescription &&
        e1?.morningTaskCompleted == e2?.morningTaskCompleted &&
        e1?.completedTaskNumber == e2?.completedTaskNumber;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.date,
        e?.task1Name,
        e?.task1Info,
        e?.task2Name,
        e?.task2Info,
        e?.task3Name,
        e?.task3Info,
        e?.task1Points,
        e?.task2Points,
        e?.task3Points,
        e?.quotes,
        e?.user,
        e?.task1Completed,
        e?.task2Completed,
        e?.task3Completed,
        e?.morningTask,
        e?.morningDescription,
        e?.morningTaskCompleted,
        e?.completedTaskNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
