import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _onBoard = false;
  bool get onBoard => _onBoard;
  set onBoard(bool _value) {
    _onBoard = _value;
  }

  bool _grpcreated = false;
  bool get grpcreated => _grpcreated;
  set grpcreated(bool _value) {
    _grpcreated = _value;
  }

  dynamic _value;
  dynamic get value => _value;
  set value(dynamic _value) {
    _value = _value;
  }

  List<MessageTypeStruct> _messages = [];
  List<MessageTypeStruct> get messages => _messages;
  set messages(List<MessageTypeStruct> _value) {
    _messages = _value;
  }

  void addToMessages(MessageTypeStruct _value) {
    _messages.add(_value);
  }

  void removeFromMessages(MessageTypeStruct _value) {
    _messages.remove(_value);
  }

  void removeAtIndexFromMessages(int _index) {
    _messages.removeAt(_index);
  }

  void updateMessagesAtIndex(
    int _index,
    MessageTypeStruct Function(MessageTypeStruct) updateFn,
  ) {
    _messages[_index] = updateFn(_messages[_index]);
  }

  void insertAtIndexInMessages(int _index, MessageTypeStruct _value) {
    _messages.insert(_index, _value);
  }

  DateTime? _selecteddate;
  DateTime? get selecteddate => _selecteddate;
  set selecteddate(DateTime? _value) {
    _selecteddate = _value;
  }

  DocumentReference? _CreatedGrp;
  DocumentReference? get CreatedGrp => _CreatedGrp;
  set CreatedGrp(DocumentReference? _value) {
    _CreatedGrp = _value;
  }

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;
  set isAdmin(bool _value) {
    _isAdmin = _value;
  }

  bool _isLiked = false;
  bool get isLiked => _isLiked;
  set isLiked(bool _value) {
    _isLiked = _value;
  }

  bool _isMicOn = false;
  bool get isMicOn => _isMicOn;
  set isMicOn(bool _value) {
    _isMicOn = _value;
  }

  List<String> _Gratitude = [];
  List<String> get Gratitude => _Gratitude;
  set Gratitude(List<String> _value) {
    _Gratitude = _value;
  }

  void addToGratitude(String _value) {
    _Gratitude.add(_value);
  }

  void removeFromGratitude(String _value) {
    _Gratitude.remove(_value);
  }

  void removeAtIndexFromGratitude(int _index) {
    _Gratitude.removeAt(_index);
  }

  void updateGratitudeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Gratitude[_index] = updateFn(_Gratitude[_index]);
  }

  void insertAtIndexInGratitude(int _index, String _value) {
    _Gratitude.insert(_index, _value);
  }

  String _currentday = '';
  String get currentday => _currentday;
  set currentday(String _value) {
    _currentday = _value;
  }

  String _ContactNum = '';
  String get ContactNum => _ContactNum;
  set ContactNum(String _value) {
    _ContactNum = _value;
  }

  final _userSupportGroupManager =
      StreamRequestManager<List<SupportGroupsRecord>>();
  Stream<List<SupportGroupsRecord>> userSupportGroup({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<SupportGroupsRecord>> Function() requestFn,
  }) =>
      _userSupportGroupManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserSupportGroupCache() => _userSupportGroupManager.clear();
  void clearUserSupportGroupCacheKey(String? uniqueKey) =>
      _userSupportGroupManager.clearRequest(uniqueKey);
}
