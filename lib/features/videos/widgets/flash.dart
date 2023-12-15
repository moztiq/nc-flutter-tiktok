import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Flash extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final FlashMode flashMode;
  final Function setFlashMode;

  const Flash({
    super.key,
    required this.flashMode,
    required this.setFlashMode,
    required this.isActive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: isActive ? Colors.amber.shade200 : Colors.white,
      icon: Icon(icon),
      onPressed: () => setFlashMode(flashMode),
    );
  }
}
