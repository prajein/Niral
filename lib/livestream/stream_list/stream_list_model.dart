import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/livestream/bottomsheet_live_stream/bottomsheet_live_stream_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'stream_list_widget.dart' show StreamListWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StreamListModel extends FlutterFlowModel<StreamListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getLiveStream)] action in listContainer widget.
  ApiCallResponse? livestreamID;
  // Stores action output result for [Backend Call - API (getPastLiveStream)] action in listContainer widget.
  ApiCallResponse? apiResultix4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
