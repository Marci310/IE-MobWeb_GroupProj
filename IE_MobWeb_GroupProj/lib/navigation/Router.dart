import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

// AppRouter
// An AppRouter is a class that creates a GoRouter instance.
// The GoRouter instance is used to navigate between the different screens in the app.
// Each screen is given a name and path, and a builder function that returns
// the screen given the context and state.
// Routes include: main, newvideo, viewsaves, viewrecording, viewpreviousvideos
// The AppRouter also has an errorPageBuilder function that returns a MaterialPage

class AppRouter {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/main',
    routes: [
      GoRoute(
        name: 'main',
        path: '/main',
        builder: (context, state) => ScanScreen(),
      ),
      GoRoute(
        name: 'newvideo',
        path: '/newvideo',
        builder: (context, state) => VideoFeedScreen(),
      ),
      GoRoute(
        name: 'viewsaves',
        path: '/viewsaves',
        builder: (context, state) => LoadDataScreen(),
      ),
      GoRoute(
        name: 'viewrecording',
        path: '/viewrecording',
        builder: (context, state) => PlaybackScreen(),
      ),
      GoRoute(
        name: 'viewpreviousvideos',
        path: '/viewprev',
        builder: (context, state) => FileViewerScreen(),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(
              child: Text(state.error.toString()),
            ),
          ));
    },
  );
}
