import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_group/empty_state_simple/empty_state_simple_widget.dart';
import '/components/group_card_for_chat_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create_group/create_group_widget.dart';
import 'community_home_widget.dart' show CommunityHomeWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class CommunityHomeModel extends FlutterFlowModel<CommunityHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for GroupSearcher widget.
  FocusNode? groupSearcherFocusNode;
  TextEditingController? groupSearcherController;
  String? Function(BuildContext, String?)? groupSearcherControllerValidator;
  List<SupportGroupsRecord> simpleSearchResults = [];
  // State field(s) for NoSearch widget.

  PagingController<DocumentSnapshot?, SupportGroupsRecord>?
      noSearchPagingController;
  Query? noSearchPagingQuery;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    groupSearcherFocusNode?.dispose();
    groupSearcherController?.dispose();

    noSearchPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, SupportGroupsRecord>
      setNoSearchController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    noSearchPagingController ??= _createNoSearchController(query, parent);
    if (noSearchPagingQuery != query) {
      noSearchPagingQuery = query;
      noSearchPagingController?.refresh();
    }
    return noSearchPagingController!;
  }

  PagingController<DocumentSnapshot?, SupportGroupsRecord>
      _createNoSearchController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, SupportGroupsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => querySupportGroupsRecordPage(
          queryBuilder: (_) => noSearchPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }
}
