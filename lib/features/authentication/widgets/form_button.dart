import 'package:flutter/material.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final GestureTapCallback onTap;

  const FormButton({
    super.key,
    required this.disabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.size5),
            color: disabled
                ? Colors.grey.shade300
                : Theme.of(context).primaryColor,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16,
          ),
          duration: const Duration(
            milliseconds: 200,
          ),
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              color: disabled ? Colors.grey.shade400 : Colors.white,
              fontSize: Sizes.size18,
              fontWeight: FontWeight.w600,
            ),
            duration: const Duration(
              milliseconds: 200,
            ),
            child: Text(
              'Next',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
