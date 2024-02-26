import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : Onboarding1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : Onboarding1Widget(),
        ),
        FFRoute(
          name: 'auth_2_ForgotPassword',
          path: '/auth2ForgotPassword',
          builder: (context, params) => Auth2ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'auth_2_createProfile',
          path: '/auth2CreateProfile',
          builder: (context, params) => Auth2CreateProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_Profile',
          path: '/auth2Profile',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'auth_2_Profile')
              : Auth2ProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_EditProfile',
          path: '/auth2EditProfile',
          builder: (context, params) => Auth2EditProfileWidget(),
        ),
        FFRoute(
          name: 'reportPage',
          path: '/reportPage',
          builder: (context, params) => ReportPageWidget(),
        ),
        FFRoute(
          name: 'onboarding1',
          path: '/onboarding1',
          builder: (context, params) => Onboarding1Widget(),
        ),
        FFRoute(
          name: 'accountAuthCreate',
          path: '/accountAuthCreate',
          builder: (context, params) => AccountAuthCreateWidget(),
        ),
        FFRoute(
          name: 'CreateAccount4',
          path: '/createAccount4',
          builder: (context, params) => CreateAccount4Widget(),
        ),
        FFRoute(
          name: 'Login4',
          path: '/login4',
          builder: (context, params) => Login4Widget(),
        ),
        FFRoute(
          name: 'CommunityHome',
          path: '/communityHome',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'CommunityHome')
              : CommunityHomeWidget(),
        ),
        FFRoute(
          name: 'chat_2_Details',
          path: '/chat2Details',
          asyncParams: {
            'grpRef':
                getDoc(['SupportGroups'], SupportGroupsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsWidget(
            grpRef: params.getParam('grpRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'chat_2_InviteUsers',
          path: '/chat2InviteUsers',
          asyncParams: {
            'supgrpref':
                getDoc(['SupportGroups'], SupportGroupsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2InviteUsersWidget(
            supgrpref: params.getParam('supgrpref', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          asyncParams: {
            'chatMessage': getDoc(['GroupChat'], GroupChatRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam('chatMessage', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'counselling_scheduling',
          path: '/counsellingScheduling',
          builder: (context, params) => CounsellingSchedulingWidget(),
        ),
        FFRoute(
          name: 'meditate',
          path: '/meditate',
          builder: (context, params) => MeditateWidget(),
        ),
        FFRoute(
          name: 'therapist_home_page',
          path: '/therapistHomePage',
          builder: (context, params) => TherapistHomePageWidget(),
        ),
        FFRoute(
          name: 'StreamList',
          path: '/streamList',
          builder: (context, params) => StreamListWidget(),
        ),
        FFRoute(
          name: 'livestreamer',
          path: '/livestreamer',
          builder: (context, params) => LivestreamerWidget(
            streamname: params.getParam('streamname', ParamType.String),
            streamdescription:
                params.getParam('streamdescription', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'LiveStreamViewer',
          path: '/liveStreamViewer',
          builder: (context, params) => LiveStreamViewerWidget(
            url: params.getParam('url', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'acutalHome',
          path: '/acutalHome',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'acutalHome')
              : AcutalHomeWidget(),
        ),
        FFRoute(
          name: 'SkipSurvey',
          path: '/skipSurvey',
          builder: (context, params) => SkipSurveyWidget(),
        ),
        FFRoute(
          name: 'supportHub',
          path: '/supportHub',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'supportHub')
              : SupportHubWidget(),
        ),
        FFRoute(
          name: 'GroupProfile',
          path: '/groupProfile',
          builder: (context, params) => GroupProfileWidget(
            supportGroupID: params.getParam('supportGroupID',
                ParamType.DocumentReference, false, ['SupportGroups']),
          ),
        ),
        FFRoute(
          name: 'ArtGallery',
          path: '/artGallery',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ArtGallery')
              : ArtGalleryWidget(),
        ),
        FFRoute(
          name: 'PicturesPage',
          path: '/picturesPage',
          builder: (context, params) => PicturesPageWidget(),
        ),
        FFRoute(
          name: 'SurvivorStory',
          path: '/survivorStory',
          asyncParams: {
            'groupref':
                getDoc(['SupportGroups'], SupportGroupsRecord.fromSnapshot),
          },
          builder: (context, params) => SurvivorStoryWidget(
            title: params.getParam('title', ParamType.String),
            subtitle: params.getParam('subtitle', ParamType.String),
            story: params.getParam('story', ParamType.String),
            image: params.getParam('image', ParamType.String),
            groupref: params.getParam('groupref', ParamType.Document),
            postedtime: params.getParam('postedtime', ParamType.DateTime),
          ),
        ),
        FFRoute(
          name: 'Details24QuizPage',
          path: '/details24QuizPage',
          builder: (context, params) => Details24QuizPageWidget(),
        ),
        FFRoute(
          name: 'NiralWay',
          path: '/niralWay',
          builder: (context, params) => NiralWayWidget(),
        ),
        FFRoute(
          name: 'dailyroutine',
          path: '/dailyroutine',
          builder: (context, params) => DailyroutineWidget(
            completedTaskNum:
                params.getParam('completedTaskNum', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'gratitude',
          path: '/gratitude',
          builder: (context, params) => GratitudeWidget(),
        ),
        FFRoute(
          name: 'MusicPage',
          path: '/musicPage',
          builder: (context, params) => MusicPageWidget(),
        ),
        FFRoute(
          name: 'Documents',
          path: '/documents',
          builder: (context, params) => DocumentsWidget(),
        ),
        FFRoute(
          name: 'Campaings',
          path: '/campaings',
          builder: (context, params) => CampaingsWidget(),
        ),
        FFRoute(
          name: 'affirmations',
          path: '/affirmations',
          builder: (context, params) => AffirmationsWidget(),
        ),
        FFRoute(
          name: 'Blogspage',
          path: '/blogspage',
          asyncParams: {
            'blogs': getDoc(['Blogs'], BlogsRecord.fromSnapshot),
          },
          builder: (context, params) => BlogspageWidget(
            blogs: params.getParam('blogs', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'BambooChat',
          path: '/bambooChat',
          builder: (context, params) => BambooChatWidget(),
        ),
        FFRoute(
          name: 'findsafeplace',
          path: '/findsafeplace',
          builder: (context, params) => FindsafeplaceWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitRipple(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
