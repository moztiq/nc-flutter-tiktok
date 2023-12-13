import 'package:go_router/go_router.dart';
import 'package:nc_flutter_tiktok/features/authentication/email_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/login_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/sign_up_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/username_screen.dart';
import 'package:nc_flutter_tiktok/features/users/user_profile_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: SignUpScreen.routeName,
    builder: (context, state) => SignUpScreen(),
  ),
  GoRoute(
    path: UsernameScreen.routeName,
    builder: (context, state) => UsernameScreen(),
  ),
  GoRoute(
    path: LoginScreen.routeName,
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: EmailScreen.routeName,
    builder: (context, state) {
      final args = state.extra as EmailScreenArgs;
      return EmailScreen(username: args.username);
    },
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
