import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/constants/gaps.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';
import 'package:nc_flutter_tiktok/features/authentication/username_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/login_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/widgets/auth_button.dart';
import 'package:nc_flutter_tiktok/generated/l10n.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Localizations.localeOf(context));

    return OrientationBuilder(
      builder: (context, orientation) {
        // if (orientation == Orientation.landscape) {
        //   return Scaffold(
        //     body: Center(
        //       child: Text('Plz rotate ur phone'),
        //     ),
        //   );
        // }
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(
                Sizes.size40,
              ),
              child: Column(
                children: [
                  Gaps.v80,
                  Text(
                    S.of(context).signUpTitle('TikTok'),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Gaps.v20,
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      S.of(context).signUpSubTitle(0),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Gaps.v36,
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                            icon: const FaIcon(FontAwesomeIcons.user),
                            text: S.of(context).emailAndPasswordButton,
                            onTap: () => _onEmailTap(context),
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: AuthButton(
                            icon: const FaIcon(FontAwesomeIcons.apple),
                            text: S.of(context).appleButton,
                            onTap: () => _onEmailTap(context),
                          ),
                        ),
                      ],
                    ),
                  if (orientation == Orientation.portrait) ...[
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.user),
                      text: S.of(context).emailAndPasswordButton,
                      onTap: () => _onEmailTap(context),
                    ),
                    Gaps.v16,
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.apple),
                      text: S.of(context).appleButton,
                      onTap: () => _onEmailTap(context),
                    ),
                  ],
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).alreadyHaveAnAccount,
                ),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onLoginTap(context),
                  child: Text(
                    S.of(context).logIn('male'),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
