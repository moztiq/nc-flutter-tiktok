import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nc_flutter_tiktok/constants/gaps.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';
import 'package:nc_flutter_tiktok/features/authentication/repos/authentication_repo.dart';
import 'package:nc_flutter_tiktok/features/authentication/view_models/signup_view_model.dart';
import 'package:nc_flutter_tiktok/features/authentication/widgets/form_button.dart';

class BirthdayScreen extends ConsumerStatefulWidget {
  const BirthdayScreen({super.key});

  @override
  BirthdayScreenState createState() => BirthdayScreenState();
}

class BirthdayScreenState extends ConsumerState<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    super.initState(); // 먼저 호출

    DateTime nowDate = DateTime.now();
    initialDate = DateTime(nowDate.year - 12, nowDate.month, nowDate.day);

    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose(); // 나중에 호출
  }

  void _onNextTap() {
    print(ref.read(signUpForm));
    ref.read(signUpProvider.notifier).signUp();
    // context.goNamed(InterestsScreen.routeName);
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "When's your birthday?",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v10,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            Gaps.v24,
            FormButton(
              disabled: ref.watch(signUpProvider).isLoading,
              onTap: _onNextTap,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextFieldDate,
            maximumDate: initialDate,
            initialDateTime: initialDate,
          ),
        ),
      ),
    );
  }
}
