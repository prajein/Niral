import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/bamboo_reply_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bamboo_chat_model.dart';
export 'bamboo_chat_model.dart';

class BambooChatWidget extends StatefulWidget {
  const BambooChatWidget({super.key});

  @override
  State<BambooChatWidget> createState() => _BambooChatWidgetState();
}

class _BambooChatWidgetState extends State<BambooChatWidget>
    with TickerProviderStateMixin {
  late BambooChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'riveAnimationOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -22.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BambooChatModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'BambooChat'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BAMBOO_CHAT_BambooChat_ON_INIT_STATE');
      logFirebaseEvent('BambooChat_backend_call');

      var aICompanionChatsRecordReference =
          AICompanionChatsRecord.collection.doc();
      await aICompanionChatsRecordReference
          .set(createAICompanionChatsRecordData(
        userRef: currentUserReference,
      ));
      _model.geminichatSession = AICompanionChatsRecord.getDocumentFromData(
          createAICompanionChatsRecordData(
            userRef: currentUserReference,
          ),
          aICompanionChatsRecordReference);
      logFirebaseEvent('BambooChat_update_page_state');
      setState(() {
        _model.geminiChatSession = _model.geminichatSession?.reference;
        _model.bambooreplyquote = valueOrDefault<String>(
          functions.getRandomBambooQuote(),
          'I feel the rush in my sleep',
        );
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.keyboard_backspace_rounded,
                        color: FlutterFlowTheme.of(context).customColor2,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'BAMBOO_CHAT_keyboard_backspace_rounded_I');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'nv14csog' /* Bamboo */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nanum Pen Script',
                              color: FlutterFlowTheme.of(context).customColor2,
                              fontSize: 60.0,
                              fontWeight: FontWeight.w800,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Nanum Pen Script'),
                            ),
                      ),
                    ],
                  ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (_model.geminiresp != null &&
                              _model.geminiresp != '') {
                            return Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.bambooReplyModel1,
                                      updateCallback: () => setState(() {}),
                                      child: BambooReplyWidget(
                                        bambooResp: _model.geminiresp!,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.bambooReplyModel2,
                                      updateCallback: () => setState(() {}),
                                      child: BambooReplyWidget(
                                        bambooResp: valueOrDefault<String>(
                                          _model.bambooreplyquote,
                                          'Life is black, white, and a little bit of bamboo.',
                                        ),
                                        bambooTitle: 'Bamboo\'s Thoughts',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ].divide(SizedBox(height: 5.0)),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'BAMBOO_CHAT_Container_9pckmxsx_ON_TAP');
                        if (_model.isPetClicked == false) {
                          logFirebaseEvent('Container_update_page_state');
                          setState(() {
                            _model.isPetClicked = true;
                          });
                        } else {
                          logFirebaseEvent('Container_update_page_state');
                          setState(() {
                            _model.isPetClicked = false;
                          });
                        }
                      },
                      child: Container(
                        width: 320.0,
                        height: 320.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Builder(
                          builder: (context) {
                            if (_model.isPetClicked) {
                              return Container(
                                width: 240.0,
                                height: 340.0,
                                child: RiveAnimation.asset(
                                  'assets/rive_animations/panda_(1).riv',
                                  artboard: 'New Artboard',
                                  fit: BoxFit.cover,
                                  controllers: _model.riveAnimationControllers1,
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'riveAnimationOnPageLoadAnimation']!);
                            } else {
                              return Container(
                                width: 150.0,
                                height: 130.0,
                                child: RiveAnimation.asset(
                                  'assets/rive_animations/panda_(1).riv',
                                  artboard: 'New Artboard',
                                  fit: BoxFit.cover,
                                  controllers: _model.riveAnimationControllers2,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            constraints: BoxConstraints(
                              maxWidth: 300.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'efw86sum' /* Chat With Me */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .buttonOnboarding,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'u3st578s' /* Write me something....... */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor2,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.send_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'BAMBOO_CHAT_PAGE_send_sharp_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_backend_call');
                                        _model.finalGemini =
                                            await GeminiCall.call(
                                          userInput: _model.textController.text,
                                        );
                                        logFirebaseEvent(
                                            'IconButton_reset_form_fields');
                                        setState(() {
                                          _model.textController?.clear();
                                        });
                                        if ((_model.finalGemini?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'IconButton_update_page_state');
                                          setState(() {
                                            _model.geminiresp =
                                                valueOrDefault<String>(
                                              GeminiCall.geminioutput(
                                                (_model.finalGemini?.jsonBody ??
                                                    ''),
                                              ),
                                              'Sorry, I\'m sleeping right now',
                                            );
                                          });
                                          logFirebaseEvent(
                                              'IconButton_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 10000));
                                          logFirebaseEvent(
                                              'IconButton_update_page_state');
                                          setState(() {
                                            _model.geminiresp = '';
                                          });
                                        }

                                        setState(() {});
                                      },
                                    ),
                                  ].addToEnd(SizedBox(width: 5.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
