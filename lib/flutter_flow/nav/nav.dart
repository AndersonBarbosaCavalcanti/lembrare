import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

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
          appStateNotifier.loggedIn ? MenuWidget() : LoginecadastroWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? MenuWidget() : LoginecadastroWidget(),
          routes: [
            FFRoute(
              name: 'loginecadastro',
              path: 'loginecadastro',
              builder: (context, params) => LoginecadastroWidget(),
            ),
            FFRoute(
              name: 'decks',
              path: 'decks',
              requireAuth: true,
              builder: (context, params) => DecksWidget(
                escolacode: params.getParam('escolacode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'subdecks',
              path: 'subdecks',
              requireAuth: true,
              builder: (context, params) => SubdecksWidget(
                deckcode: params.getParam('deckcode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'esqueciasenha',
              path: 'esqueciasenha',
              requireAuth: true,
              builder: (context, params) => EsqueciasenhaWidget(),
            ),
            FFRoute(
              name: 'Escolas',
              path: 'escolas',
              builder: (context, params) => EscolasWidget(),
            ),
            FFRoute(
              name: 'subsubdecks',
              path: 'subsubdecks',
              requireAuth: true,
              builder: (context, params) => SubsubdecksWidget(
                subcode: params.getParam('subcode', ParamType.String),
                deckcode: params.getParam('deckcode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'questoes1',
              path: 'questoes1',
              builder: (context, params) => Questoes1Widget(
                deckcode: params.getParam('deckcode', ParamType.String),
                subcode: params.getParam('subcode', ParamType.String),
                subsubcode: params.getParam('subsubcode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'novaquestao',
              path: 'novaquestao',
              builder: (context, params) => NovaquestaoWidget(
                deckcode: params.getParam('deckcode', ParamType.String),
                subcode: params.getParam('subcode', ParamType.String),
                subsubcode: params.getParam('subsubcode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'menu',
              path: 'menu',
              builder: (context, params) => MenuWidget(),
            ),
            FFRoute(
              name: 'EscolasCopy',
              path: 'escolasCopy',
              builder: (context, params) => EscolasCopyWidget(),
            ),
            FFRoute(
              name: 'arvoreEscola',
              path: 'arvoreEscola',
              builder: (context, params) => ArvoreEscolaWidget(
                escola: params.getParam('escola', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'decksCopy',
              path: 'decksCopy',
              requireAuth: true,
              builder: (context, params) => DecksCopyWidget(),
            ),
            FFRoute(
              name: 'arvoreDeck',
              path: 'arvoredeck',
              builder: (context, params) => ArvoreDeckWidget(
                deckcode: params.getParam('deckcode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'editarquestao',
              path: 'editarquestao',
              builder: (context, params) => EditarquestaoWidget(
                questcode: params.getParam('questcode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'pesquisadeck',
              path: 'pesquisadeck',
              requireAuth: true,
              builder: (context, params) => PesquisadeckWidget(),
            ),
            FFRoute(
              name: 'deckescola',
              path: 'deckescola',
              builder: (context, params) => DeckescolaWidget(
                escola: params.getParam('escola', ParamType.bool),
                code: params.getParam('code', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'questoesdesativado',
              path: 'questoesdesativado',
              builder: (context, params) => QuestoesdesativadoWidget(),
            ),
            FFRoute(
              name: 'Escolasdesativado',
              path: 'escolasdesativado',
              builder: (context, params) => EscolasdesativadoWidget(),
            ),
            FFRoute(
              name: 'arvoreEscoladesativado',
              path: 'arvoreEscoladesativado',
              builder: (context, params) => ArvoreEscoladesativadoWidget(
                escola: params.getParam('escola', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'desativados',
              path: 'desativados',
              builder: (context, params) => DesativadosWidget(),
            ),
            FFRoute(
              name: 'arvoreDeckdesativado',
              path: 'arvoredeckdesativado',
              builder: (context, params) => ArvoreDeckdesativadoWidget(
                deckcode: params.getParam('deckcode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'deckdesativado',
              path: 'deckdesativado',
              requireAuth: true,
              builder: (context, params) => DeckdesativadoWidget(),
            ),
            FFRoute(
              name: 'arvoresubdeckcdesativado',
              path: 'arvoresubdeckdesativado',
              builder: (context, params) => ArvoresubdeckcdesativadoWidget(
                subcode: params.getParam('subcode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'subdeckdesativado',
              path: 'subdeckdesativado',
              requireAuth: true,
              builder: (context, params) => SubdeckdesativadoWidget(),
            ),
            FFRoute(
              name: 'assuntodesativado',
              path: 'assuntodesativado',
              requireAuth: true,
              builder: (context, params) => AssuntodesativadoWidget(),
            ),
            FFRoute(
              name: 'codigos',
              path: 'codigos',
              builder: (context, params) => CodigosWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
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
            return '/loginecadastro';
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
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/logolembrare_512x512.png',
                    fit: BoxFit.cover,
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
