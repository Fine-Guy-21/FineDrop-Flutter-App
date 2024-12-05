import 'package:airdrop_demo/model/user.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final UserProfile user;
  const CircleButton({super.key, required this.user});

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool isSelected = false;

  void _toggleButton() {
    setState(() {
      widget.user.userPoints+=widget.user.pointPerTap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleButton,
      child: Container(
        width: 250.0, // Change size as needed
        height: 250.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blue : Colors.grey, // Change color based on state
        ),
        child: ClipOval(
          child: Image.asset(
                      'assets/ai-generated-8618574_1280.png',
                      fit: BoxFit.contain,
                    ),
        ),
      ),
    );
  }
}