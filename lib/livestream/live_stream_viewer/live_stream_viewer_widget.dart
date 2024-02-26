import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'live_stream_viewer_model.dart';
export 'live_stream_viewer_model.dart';

class LiveStreamViewerWidget extends StatefulWidget {
  const LiveStreamViewerWidget({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<LiveStreamViewerWidget> createState() => _LiveStreamViewerWidgetState();
}

class _LiveStreamViewerWidgetState extends State<LiveStreamViewerWidget> {
  late LiveStreamViewerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveStreamViewerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LiveStreamViewer'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FlutterFlowVideoPlayer(
            path: widget.url!,
            videoType: VideoType.network,
            height: 600.0,
            autoPlay: false,
            looping: true,
            showControls: true,
            allowFullScreen: true,
            allowPlaybackSpeedMenu: false,
          ),
        ),
      ),
    );
  }
}
