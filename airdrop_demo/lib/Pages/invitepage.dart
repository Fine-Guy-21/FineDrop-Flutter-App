import 'package:airdrop_demo/model/color.dart';
import 'package:airdrop_demo/model/user.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({super.key});

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  late final UserProfile _user = UserProfile()..userName = 'FineGuy';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;
    return SafeArea(
        child: Center(
            child: Column(
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
        
        Container(
          margin: const EdgeInsets.fromLTRB(6, 10, 6, 5),
          padding: const EdgeInsets.all(8.0),
          width: screenWidth,
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
                'Invite Friends',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Invite your friends to join the app and earn rewards',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor, // Button color
                  foregroundColor: AppColors.surfaceColor, // Text color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  elevation: 5, // Shadow effect
                ),
                child: const Text('Invite'),
              ),
            ],
          ),
        ),

        Container(
            margin: const EdgeInsets.fromLTRB(6, 10, 6, 5),
            padding: const EdgeInsets.all(8.0),
            width: screenWidth,
            height: screenHeight * (63 / 100),
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
            child:  Column(
              children: [
               const Text(
                  'Invited Friends',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.textPrimary,
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => const ListTile(
                      title:  Text('Joey'),
                      subtitle: Text('Joined on 2022-01-01'),
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),

              
              ],
            ))
      ],
    )));
  }
}
