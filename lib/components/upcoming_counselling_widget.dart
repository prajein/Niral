import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upcoming_counselling_model.dart';
export 'upcoming_counselling_model.dart';

class UpcomingCounsellingWidget extends StatefulWidget {
  const UpcomingCounsellingWidget({super.key});

  @override
  State<UpcomingCounsellingWidget> createState() =>
      _UpcomingCounsellingWidgetState();
}

class _UpcomingCounsellingWidgetState extends State<UpcomingCounsellingWidget> {
  late UpcomingCounsellingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpcomingCounsellingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 111.0,
      constraints: BoxConstraints(
        maxWidth: 600.0,
        maxHeight: 200.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x337E7E7E),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'wygrc88j' /* Your upcoming counselling sess... */,
              ),
              style: FlutterFlowTheme.of(context).bodyLarge,
            ),
            StreamBuilder<List<CousellingRecord>>(
              stream: queryCousellingRecord(
                queryBuilder: (cousellingRecord) => cousellingRecord
                    .where(
                      'date_and_time',
                      isGreaterThanOrEqualTo: getCurrentTimestamp,
                    )
                    .where(
                      'user_ref',
                      isEqualTo: currentUserReference,
                    )
                    .orderBy('date_and_time', descending: true),
              ),
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
                List<CousellingRecord> listViewCousellingRecordList =
                    snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewCousellingRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewCousellingRecord =
                        listViewCousellingRecordList[listViewIndex];
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listViewCousellingRecord.reference.id,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          listViewCousellingRecord.description,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
