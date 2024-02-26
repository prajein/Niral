import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/task_show_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'acutal_home_widget.dart' show AcutalHomeWidget;
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AcutalHomeModel extends FlutterFlowModel<AcutalHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList = [
    'Close eye',
    'Open eye',
    'Idle',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];
  // State field(s) for morning_task widget.
  bool? morningTaskValue;
  // State field(s) for task1_completed widget.
  bool? task1CompletedValue;
  // State field(s) for task2_completed widget.
  bool? task2CompletedValue;
  // State field(s) for task3_completed widget.
  bool? task3CompletedValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    riveAnimationAnimationsList.forEach((name) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    });
  }

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
