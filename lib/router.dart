import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nc_flutter_tiktok/features/authentication/email_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/login_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/sign_up_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/username_screen.dart';
import 'package:nc_flutter_tiktok/features/users/user_profile_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: SignUpScreen.routeName,
    path: SignUpScreen.routeURL,
    builder: (context, state) => SignUpScreen(),
    routes: [
      GoRoute(
        name: UsernameScreen.routeName,
        path: UsernameScreen.routeURL,
        builder: (context, state) => UsernameScreen(),
        routes: [
          GoRoute(
            name: EmailScreen.routeName,
            path: EmailScreen.routeURL,
            builder: (context, state) {
              final args = state.extra as EmailScreenArgs;
              return EmailScreen(username: args.username);
            },
          ),
        ],
      ),
    ],
  ),
  // GoRoute(
  //   name: 'username_screen',
  //   path: UsernameScreen.routeName,
  //   pageBuilder: (context, state) {
  //     return CustomTransitionPage(
  //       // transitionDuration: Duration(
  //       //   seconds: 1,
  //       // ),
  //       child: UsernameScreen(),
  //       transitionsBuilder: (BuildContext context, Animation<double> animation,
  //           Animation<double> secondaryAnimation, Widget child) {
  //         return FadeTransition(
  //           opacity: animation,
  //           child: ScaleTransition(scale: animation, child: child),
  //         );
  //       },
  //     );
  //   },
  // ),
  GoRoute(
    path: LoginScreen.routeName,
    builder: (context, state) => LoginScreen(),
  ),

  GoRoute(
    path: "/users/:username",
    builder: (context, state) {
      final username = state.params['username'];
      final tab = state.queryParams['show'];
      return UserProfileScreen(username: username!, tab: tab!);
    },
  )
]);
