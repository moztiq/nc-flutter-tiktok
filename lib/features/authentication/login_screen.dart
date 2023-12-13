import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/constants/gaps.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';
import 'package:nc_flutter_tiktok/features/authentication/login_form_screen.dart';
import 'package:nc_flutter_tiktok/features/authentication/widgets/auth_button.dart';
import 'package:nc_flutter_tiktok/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop('Hello');
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                S.of(context).loginTitle('TikTok'),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Gaps.v20,
              Opacity(
                opacity: 0.7,
                child: const Text(
                  'Manage your account, check notifications, comment on videos, and more.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ),
              Gaps.v40,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.user),
                text: "Use email and password",
                onTap: () => _onEmailLoginTap(context),
              ),
              Gaps.v16,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.apple),
                text: "Continue with Apple",
                onTap: () => _onEmailLoginTap(context),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
            ),
            Gaps.h5,
            GestureDetector(
              onTap: () => _onSignUpTap(context),
              child: Text(
                'Sign up',
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
  }
}
