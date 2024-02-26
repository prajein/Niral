import '/components/upcoming_counselling_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'therapist_home_page_widget.dart' show TherapistHomePageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TherapistHomePageModel extends FlutterFlowModel<TherapistHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for UpcomingCounselling component.
  late UpcomingCounsellingModel upcomingCounsellingModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    upcomingCounsellingModel =
        createModel(context, () => UpcomingCounsellingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    upcomingCounsellingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
