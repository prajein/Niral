import '/backend/backend.dart';
import '/chat_group/empty_state_simple/empty_state_simple_widget.dart';
import '/components/card_blog_widget.dart';
import '/components/picture_card_widget.dart';
import '/components/surivor_story_card_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'art_gallery_model.dart';
export 'art_gallery_model.dart';

class ArtGalleryWidget extends StatefulWidget {
  const ArtGalleryWidget({super.key});

  @override
  State<ArtGalleryWidget> createState() => _ArtGalleryWidgetState();
}

class _ArtGalleryWidgetState extends State<ArtGalleryWidget>
    with TickerProviderStateMixin {
  late ArtGalleryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArtGalleryModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ArtGallery'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 6,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        backgroundColor: () {
          if (_model.tabBarCurrentIndex == 2) {
            return FlutterFlowTheme.of(context).primary;
          } else if (_model.tabBarCurrentIndex == 3) {
            return FlutterFlowTheme.of(context).tertiary;
          } else {
            return FlutterFlowTheme.of(context).primaryBackground;
          }
        }(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 60.0, 15.0, 15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'ze49qdly' /* Art Gallery */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 25.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 1.0, 5.0, 0.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: FlutterFlowButtonTabBar(
                        useToggleButtonStyle: false,
                        isScrollable: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                        unselectedLabelStyle: TextStyle(),
                        labelColor: FlutterFlowTheme.of(context).customColor3,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).customColor2,
                        backgroundColor:
                            FlutterFlowTheme.of(context).customColor1,
                        unselectedBackgroundColor:
                            FlutterFlowTheme.of(context).alternate,
                        borderColor: FlutterFlowTheme.of(context).tertiary,
                        unselectedBorderColor:
                            FlutterFlowTheme.of(context).tertiary,
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        elevation: 1.0,
                        labelPadding: EdgeInsetsDirectional.fromSTEB(
                            18.0, 0.0, 18.0, 0.0),
                        buttonMargin:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        padding: EdgeInsets.all(2.0),
                        tabs: [
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'g6pls0c5' /* Survivor
 Stories */
                              ,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              '5k5gum6e' /* Pictures */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              's1vmw31p' /* Music */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              '0l1c5ty5' /* Podcast */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              '7zbbb8mr' /* Blogs */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'pocbanfs' /* Campaings */,
                            ),
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {}
                          ][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: StreamBuilder<List<SurvivorStoryRecord>>(
                              stream: querySurvivorStoryRecord(
                                queryBuilder: (survivorStoryRecord) =>
                                    survivorStoryRecord.orderBy('PostedTime',
                                        descending: true),
                                limit: 10,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<SurvivorStoryRecord>
                                    swipeableStackSurvivorStoryRecordList =
                                    snapshot.data!;
                                if (swipeableStackSurvivorStoryRecordList
                                    .isEmpty) {
                                  return EmptyStateSimpleWidget(
                                    body:
                                        'No Survivor Stories have been posted.',
                                    title: 'No Activity',
                                  );
                                }
                                return FlutterFlowSwipeableStack(
                                  onSwipeFn: (index) {},
                                  onLeftSwipe: (index) {},
                                  onRightSwipe: (index) {},
                                  onUpSwipe: (index) {},
                                  onDownSwipe: (index) {},
                                  itemBuilder: (context, swipeableStackIndex) {
                                    final swipeableStackSurvivorStoryRecord =
                                        swipeableStackSurvivorStoryRecordList[
                                            swipeableStackIndex];
                                    return SurivorStoryCardWidget(
                                      key: Key(
                                          'Keycq6_${swipeableStackIndex}_of_${swipeableStackSurvivorStoryRecordList.length}'),
                                      parameter3: dateTimeFormat(
                                        'relative',
                                        swipeableStackSurvivorStoryRecord
                                            .postedTime!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      parameter4:
                                          swipeableStackSurvivorStoryRecord
                                              .image,
                                      parameter5:
                                          swipeableStackSurvivorStoryRecord
                                              .title,
                                      parameter6:
                                          swipeableStackSurvivorStoryRecord
                                              .subtitle,
                                      parameter8:
                                          swipeableStackSurvivorStoryRecord
                                              .fromUser,
                                      parameter10:
                                          swipeableStackSurvivorStoryRecord
                                              .canShowUser,
                                      parameter11:
                                          swipeableStackSurvivorStoryRecord
                                              .story,
                                      parameter12:
                                          swipeableStackSurvivorStoryRecord
                                              .fromGrp,
                                      parameter14:
                                          swipeableStackSurvivorStoryRecord
                                              .postedTime,
                                      likedref:
                                          swipeableStackSurvivorStoryRecord,
                                      numOfLikes:
                                          swipeableStackSurvivorStoryRecord
                                              .likes,
                                    );
                                  },
                                  itemCount:
                                      swipeableStackSurvivorStoryRecordList
                                          .length,
                                  controller: _model.swipeableStackController,
                                  loop: true,
                                  cardDisplayCount: 2,
                                  scale: 0.92,
                                  maxAngle: 30.0,
                                  cardPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 25.0),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 75.0),
                            child: StreamBuilder<List<PicturesRecord>>(
                              stream: queryPicturesRecord(
                                queryBuilder: (picturesRecord) => picturesRecord
                                    .orderBy('PostedTime', descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<PicturesRecord>
                                    carouselPicturesRecordList = snapshot.data!;
                                if (carouselPicturesRecordList.isEmpty) {
                                  return EmptyStateSimpleWidget(
                                    body: 'No Pictures have been posted yet.',
                                    title: 'No Activity',
                                  );
                                }
                                return Container(
                                  width: double.infinity,
                                  height: 180.0,
                                  child: CarouselSlider.builder(
                                    itemCount:
                                        carouselPicturesRecordList.length,
                                    itemBuilder: (context, carouselIndex, _) {
                                      final carouselPicturesRecord =
                                          carouselPicturesRecordList[
                                              carouselIndex];
                                      return PictureCardWidget(
                                        key: Key(
                                            'Keyvib_${carouselIndex}_of_${carouselPicturesRecordList.length}'),
                                        title: valueOrDefault<String>(
                                          carouselPicturesRecord.title,
                                          'Na',
                                        ),
                                        subtitle: valueOrDefault<String>(
                                          carouselPicturesRecord.subtitle,
                                          'Na',
                                        ),
                                        parameter3:
                                            carouselPicturesRecord.image,
                                        picturesRef: carouselPicturesRecord,
                                        likes: carouselPicturesRecord.likes,
                                      );
                                    },
                                    carouselController:
                                        _model.carouselController1 ??=
                                            CarouselController(),
                                    options: CarouselOptions(
                                      initialPage: min(
                                          1,
                                          carouselPicturesRecordList.length -
                                              1),
                                      viewportFraction: 0.88,
                                      disableCenter: true,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.25,
                                      enableInfiniteScroll: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: false,
                                      onPageChanged: (index, _) =>
                                          _model.carouselCurrentIndex1 = index,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FutureBuilder<List<MusicRecord>>(
                                  future: queryMusicRecordOnce(
                                    queryBuilder: (musicRecord) => musicRecord
                                        .orderBy('Likes', descending: true),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRipple(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MusicRecord> containerMusicRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final containerMusicRecord =
                                        containerMusicRecordList.isNotEmpty
                                            ? containerMusicRecordList.first
                                            : null;
                                    return Container(
                                      width: double.infinity,
                                      height: 318.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 50.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    100.0,
                                                                    15.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'vxe2pkop' /* Featured Song of the Day */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 24.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  50.0,
                                                                  15.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'qzokhdhw' /* Join the hype! Hear the song e... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      18.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    FutureBuilder<
                                                        SupportGroupsRecord>(
                                                      future: SupportGroupsRecord
                                                          .getDocumentOnce(
                                                              containerMusicRecord!
                                                                  .fromGrp!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final audioPlayerSupportGroupsRecord =
                                                            snapshot.data!;
                                                        return FlutterFlowAudioPlayer(
                                                          audio: Audio.network(
                                                            'https://filesamples.com/samples/audio/mp3/sample3.mp3',
                                                            metas: Metas(
                                                              id: 'sample3.mp3-8e47fe91',
                                                              title:
                                                                  'Top Track Of The Day - ${audioPlayerSupportGroupsRecord.groupname}',
                                                            ),
                                                          ),
                                                          titleTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleLargeFamily,
                                                                    fontSize:
                                                                        18.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleLargeFamily),
                                                                  ),
                                                          playbackDurationTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          playbackButtonColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          activeTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          elevation: 4.0,
                                                          playInBackground:
                                                              PlayInBackground
                                                                  .enabled,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'qc9yk2nb' /* Also Listen to */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 20.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 5.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 125.0,
                                          height: 125.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/7010834_3318330.jpg',
                                                    width: 300.0,
                                                    height: 98.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '4pl8yykj' /* Daily Music */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 125.0,
                                          height: 125.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/7878675_3776501.jpg',
                                                    width: 300.0,
                                                    height: 98.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nuozv7lf' /* Meditation Music */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 125.0,
                                          height: 125.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/9924548_4319382.jpg',
                                                    width: 300.0,
                                                    height: 98.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mzf400d0' /* Healing music */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 125.0,
                                          height: 125.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/837618_preview.jpg',
                                                    width: 300.0,
                                                    height: 98.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5thi8r5q' /* Motivation music */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'x04o8ugw' /* Listen to these songs made by ... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                StreamBuilder<List<MusicRecord>>(
                                  stream: queryMusicRecord(
                                    queryBuilder: (musicRecord) =>
                                        musicRecord.orderBy('PostedTime'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRipple(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MusicRecord> listViewMusicRecordList =
                                        snapshot.data!;
                                    if (listViewMusicRecordList.isEmpty) {
                                      return EmptyStateSimpleWidget(
                                        body: 'No musics have been posted yet.',
                                        title: 'No activity',
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewMusicRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewMusicRecord =
                                            listViewMusicRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: StreamBuilder<
                                              SupportGroupsRecord>(
                                            stream:
                                                SupportGroupsRecord.getDocument(
                                                    listViewMusicRecord
                                                        .fromGrp!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final audioPlayerSupportGroupsRecord =
                                                  snapshot.data!;
                                              return FlutterFlowAudioPlayer(
                                                audio: Audio.network(
                                                  listViewMusicRecord.music,
                                                  metas: Metas(
                                                    id: 'sample3.mp3-03d45531',
                                                    title:
                                                        '${listViewMusicRecord.title} - ${audioPlayerSupportGroupsRecord.groupname}',
                                                  ),
                                                ),
                                                titleTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                                playbackDurationTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                playbackButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                elevation: 4.0,
                                                playInBackground:
                                                    PlayInBackground.enabled,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FutureBuilder<List<MusicRecord>>(
                                  future: queryMusicRecordOnce(
                                    queryBuilder: (musicRecord) => musicRecord
                                        .orderBy('Likes', descending: true),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRipple(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MusicRecord> containerMusicRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final containerMusicRecord =
                                        containerMusicRecordList.isNotEmpty
                                            ? containerMusicRecordList.first
                                            : null;
                                    return Container(
                                      width: double.infinity,
                                      height: 318.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 50.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    100.0,
                                                                    15.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'vzl0ku2q' /* Listen To Podcast */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 24.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  50.0,
                                                                  15.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'tqcpvwln' /* You are not the only one. We a... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      18.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    FutureBuilder<
                                                        SupportGroupsRecord>(
                                                      future: SupportGroupsRecord
                                                          .getDocumentOnce(
                                                              containerMusicRecord!
                                                                  .fromGrp!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final audioPlayerSupportGroupsRecord =
                                                            snapshot.data!;
                                                        return FlutterFlowAudioPlayer(
                                                          audio: Audio.network(
                                                            'https://ia801906.us.archive.org/15/items/the-fat-rat-rise-up/TheFatRat%20-%20Rise%20Up.mp3',
                                                            metas: Metas(
                                                              id: 'TheFatRat%20-%20Rise%20Up.mp3-8df87603',
                                                              title:
                                                                  'Top Podcast of the day - ${audioPlayerSupportGroupsRecord.groupname}',
                                                            ),
                                                          ),
                                                          titleTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleLargeFamily,
                                                                    fontSize:
                                                                        18.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleLargeFamily),
                                                                  ),
                                                          playbackDurationTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          playbackButtonColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          activeTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          elevation: 4.0,
                                                          playInBackground:
                                                              PlayInBackground
                                                                  .enabled,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ggil1tw9' /* Listen to these podcasts made ... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                StreamBuilder<List<MusicRecord>>(
                                  stream: queryMusicRecord(
                                    queryBuilder: (musicRecord) =>
                                        musicRecord.orderBy('PostedTime'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRipple(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MusicRecord> listViewMusicRecordList =
                                        snapshot.data!;
                                    if (listViewMusicRecordList.isEmpty) {
                                      return EmptyStateSimpleWidget(
                                        body:
                                            'No podcasts have been posted yet.',
                                        title: 'No activity',
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewMusicRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewMusicRecord =
                                            listViewMusicRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: StreamBuilder<
                                              SupportGroupsRecord>(
                                            stream:
                                                SupportGroupsRecord.getDocument(
                                                    listViewMusicRecord
                                                        .fromGrp!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final audioPlayerSupportGroupsRecord =
                                                  snapshot.data!;
                                              return FlutterFlowAudioPlayer(
                                                audio: Audio.network(
                                                  listViewMusicRecord.music,
                                                  metas: Metas(
                                                    id: 'sample3.mp3-9403d734',
                                                    title:
                                                        '${listViewMusicRecord.title} - ${audioPlayerSupportGroupsRecord.groupname}',
                                                  ),
                                                ),
                                                titleTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                                playbackDurationTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                playbackButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                elevation: 4.0,
                                                playInBackground:
                                                    PlayInBackground.enabled,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: StreamBuilder<List<BlogsRecord>>(
                              stream: queryBlogsRecord(
                                queryBuilder: (blogsRecord) => blogsRecord
                                    .orderBy('Likes', descending: true)
                                    .orderBy('PostedTime', descending: true),
                                limit: 20,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<BlogsRecord> listViewBlogsRecordList =
                                    snapshot.data!;
                                if (listViewBlogsRecordList.isEmpty) {
                                  return EmptyStateSimpleWidget(
                                    body: 'No blogs have been posted yet.',
                                    title: 'No activity',
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewBlogsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewBlogsRecord =
                                        listViewBlogsRecordList[listViewIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ART_GALLERY_Container_cbbr6wbg_ON_TAP');
                                        logFirebaseEvent(
                                            'CardBlog_navigate_to');

                                        context.pushNamed(
                                          'Blogspage',
                                          queryParameters: {
                                            'blogs': serializeParam(
                                              listViewBlogsRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'blogs': listViewBlogsRecord,
                                          },
                                        );
                                      },
                                      child: CardBlogWidget(
                                        key: Key(
                                            'Keycbb_${listViewIndex}_of_${listViewBlogsRecordList.length}'),
                                        blogPostRef: listViewBlogsRecord,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: StreamBuilder<List<CampaingsRecord>>(
                              stream: queryCampaingsRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<CampaingsRecord>
                                    carouselCampaingsRecordList =
                                    snapshot.data!;
                                if (carouselCampaingsRecordList.isEmpty) {
                                  return EmptyStateSimpleWidget(
                                    body: 'No Campaings have been posted yet.',
                                    title: 'No activity',
                                  );
                                }
                                return Container(
                                  width: double.infinity,
                                  height: 180.0,
                                  child: CarouselSlider.builder(
                                    itemCount:
                                        carouselCampaingsRecordList.length,
                                    itemBuilder: (context, carouselIndex, _) {
                                      final carouselCampaingsRecord =
                                          carouselCampaingsRecordList[
                                              carouselIndex];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        carouselCampaingsRecord
                                                            .title,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 230.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 12.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 5.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            child:
                                                                Image.network(
                                                              carouselCampaingsRecord
                                                                  .image,
                                                              width: double
                                                                  .infinity,
                                                              height: 230.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  child: ExpandableNotifier(
                                                    initialExpanded: false,
                                                    child: ExpandablePanel(
                                                      header: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          carouselCampaingsRecord
                                                              .subtitle,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      collapsed: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            carouselCampaingsRecord
                                                                .content,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                        ),
                                                      ),
                                                      expanded: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '6a274k1u' /* By protecting and preserving o... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: true,
                                                        tapBodyToCollapse: true,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: false,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                height: 12.0,
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'imfuv7gj' /* Place */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  carouselCampaingsRecord.place,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    carouselController:
                                        _model.carouselController2 ??=
                                            CarouselController(),
                                    options: CarouselOptions(
                                      initialPage: min(
                                          1,
                                          carouselCampaingsRecordList.length -
                                              1),
                                      viewportFraction: 0.95,
                                      disableCenter: true,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.07,
                                      enableInfiniteScroll: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: false,
                                      onPageChanged: (index, _) =>
                                          _model.carouselCurrentIndex2 = index,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
