import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nc_flutter_tiktok/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/login_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/repos/authentication_repo.dart';
import 'package:nc_flutter_tiktok/features/authentication/sign_up_screen.dart';
import 'package:nc_flutter_tiktok/features/inbox/views/activity_screen.dart';
import 'package:nc_flutter_tiktok/features/inbox/views/chat_detail_screen.dart';
import 'package:nc_flutter_tiktok/features/inbox/views/chats_screen.dart';
import 'package:nc_flutter_tiktok/features/onboarding/interests_screen.dart';
import 'package:nc_flutter_tiktok/features/videos/views/video_recording_screen.dart';

final routerProvider = Provider((ref) {
  // ref.watch(authState);
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn &&
          state.subloc != SignUpScreen.routeURL &&
          state.subloc != LoginScreen.routeURL) {
        return SignUpScreen.routeURL;
      }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: InterestsScreen.routeName,
        path: InterestsScreen.routeURL,
        builder: (context, state) => InterestsScreen(),
      ),
      GoRoute(
        name: MainNavigationScreen.routeName,
        path: "/:tab(home|discover|inbox|profile)",
        builder: (context, state) {
          final tab = state.params["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
      ),
      GoRoute(
        name: ActivityScreen.routeName,
        path: ActivityScreen.routeURL,
        builder: (context, state) => ActivityScreen(),
      ),
      GoRoute(
        name: ChatsScreen.routeName,
        path: ChatsScreen.routeURL,
        builder: (context, state) => ChatsScreen(),
        routes: [
          GoRoute(
            name: ChatDetailScreen.routeName,
            path: ChatDetailScreen.routeURL,
            builder: (context, state) {
              final chatId = state.params["chatId"]!;
              return ChatDetailScreen(chatId: chatId);
            },
          )
        ],
      ),
      GoRoute(
        name: VideoRecordingScreen.routeName,
        path: VideoRecordingScreen.routeURL,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: Duration(milliseconds: 200),
          child: VideoRecordingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final position =
                Tween(begin: Offset(0, 1), end: Offset.zero).animate(animation);
            return SlideTransition(position: position, child: child);
          },
        ),
      ),
    ],
  );
});
