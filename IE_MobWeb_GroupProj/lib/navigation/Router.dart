import 'package:fitizens/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

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
      GoRoute(
        name: 'camera',
        path: '/camera',
        builder: (context, state) => CameraScreen(),
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
