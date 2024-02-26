import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'invite_accept_card_model.dart';
export 'invite_accept_card_model.dart';

class InviteAcceptCardWidget extends StatefulWidget {
  const InviteAcceptCardWidget({
    super.key,
    required this.invite,
  });

  final InvitesRecord? invite;

  @override
  State<InviteAcceptCardWidget> createState() => _InviteAcceptCardWidgetState();
}

class _InviteAcceptCardWidgetState extends State<InviteAcceptCardWidget> {
  late InviteAcceptCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InviteAcceptCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: Color(0x2F1D2429),
              offset: Offset(0.0, 3.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.mail_outline_outlined,
                color: FlutterFlowTheme.of(context).primary,
                size: 32.0,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<SupportGroupsRecord>(
                        stream: SupportGroupsRecord.getDocument(
                            widget.invite!.supportGrpInv!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRipple(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          final textSupportGroupsRecord = snapshot.data!;
                          return Text(
                            textSupportGroupsRecord.groupname,
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          );
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '025y5gt5' /*  Invite To Join The Group */,
                          ),
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderRadius: 8.0,
                  borderWidth: 2.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.remove_red_eye_sharp,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'INVITE_ACCEPT_CARD_remove_red_eye_sharp_');
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed(
                      'GroupProfile',
                      queryParameters: {
                        'supportGroupID': serializeParam(
                          widget.invite?.supportGrpInv,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderRadius: 8.0,
                  borderWidth: 2.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'INVITE_ACCEPT_CARD_cancel_rounded_ICN_ON');
                    logFirebaseEvent('IconButton_backend_call');
                    await widget.invite!.reference.delete();
                  },
                ),
              ),
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderRadius: 8.0,
                borderWidth: 2.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.check,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('INVITE_ACCEPT_CARD_COMP_check_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_backend_call');

                  await widget.invite!.supportGrpInv!.update({
                    ...mapToFirestore(
                      {
                        'MemberRecord':
                            FieldValue.arrayUnion([currentUserReference]),
                        'numberofmembers': FieldValue.increment(1),
                      },
                    ),
                  });
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed('CommunityHome');

                  logFirebaseEvent('IconButton_backend_call');
                  await widget.invite!.reference.delete();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
