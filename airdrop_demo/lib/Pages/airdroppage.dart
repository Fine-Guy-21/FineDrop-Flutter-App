// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:airdrop_demo/model/color.dart';
import 'package:airdrop_demo/model/user.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AirdropPage extends StatefulWidget {
  const AirdropPage({super.key});

  @override
  State<AirdropPage> createState() => _AirdropPageState();
}

class _AirdropPageState extends State<AirdropPage> {
  late final UserProfile _user = UserProfile()..userName = 'FineGuy';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Bar
            Container(
              height: screenHeight * (9 / 100),
              width: screenWidth,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.surfaceColor,
                border: Border.all(color: AppColors.primaryColor, width: 1),
              ),
              child: AnimatedTextKit(
                onTap: () => {},
                animatedTexts: [
                  TyperAnimatedText(
                    'Hello, ${_user.userName}',
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.start,
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
              ),
            ),

            const SizedBox(height: 20),

            // Description
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Exclusive FineDrop Event 🎉",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  // AI-Generated Airdrop Description
                  Text(
                    "Claim your free airdrop! Powered by AI, we distribute rewards "
                    "to early adopters. Connect your TON wallet now and be part of the future.",
                    style: TextStyle(
                      color: AppColors.textPrimary.withOpacity(0.8),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  // Connect TON Wallet Button
                  ElevatedButton(
                    onPressed: () {
                      debugPrint("Connect TON Wallet clicked!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor, // Custom green
                      foregroundColor: AppColors.textSecondary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Connect Your TON Wallet",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            //Why Us
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Why FineDrop ❓",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),
                  // Additional Information
                  Text(
                    "🔹 Instant rewards\n"
                    "🔹 No gas fees on claim\n"
                    "🔹 Limited-time event",
                    style: TextStyle(
                      color: AppColors.textPrimary.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
