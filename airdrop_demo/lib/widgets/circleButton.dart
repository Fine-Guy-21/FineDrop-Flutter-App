import 'package:airdrop_demo/designs/color.dart';
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

  void _onButtonTap() {
    setState(() {
      widget.user.userPoints += widget.user.pointPerTap;
      widget.user.depleteEnergy();
      widget.user.pointsForNextLevel();
      widget.user.startEnergyReplenishment();
    });
  }

  @override
  Widget build(BuildContext context) {

        final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;

    return Center(
                  child: GestureDetector(
                    onTap: _onButtonTap,
                    child: Container(
                      width: screenWidth * 0.8, // Change size as needed
                      height: screenHeight * 0.45,
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: AppColors.surfaceColor,
                        gradient: RadialGradient(
                          colors:  [
                            AppColors.surfaceColor, // Inner color
                            AppColors.secondaryColor, // Outer color
                          ],
                          stops: [0.7, 1.0], // Control the gradient transition
                        ),
                        boxShadow:  [
                          BoxShadow(
                            color: AppColors.secondaryColor,
                            blurRadius: 30,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/ai-generated-8618574_1280.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                );
  }
}