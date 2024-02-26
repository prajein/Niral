import '/components/places_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'findsafeplace_widget.dart' show FindsafeplaceWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FindsafeplaceModel extends FlutterFlowModel<FindsafeplaceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PlacesCard component.
  late PlacesCardModel placesCardModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    placesCardModel = createModel(context, () => PlacesCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    placesCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
