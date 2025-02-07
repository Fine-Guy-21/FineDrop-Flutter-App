import 'package:airdrop_demo/designs/color.dart';
import 'package:flutter/material.dart';
import 'package:airdrop_demo/model/user.dart';
import 'package:airdrop_demo/Pages/boostsPage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserProfile _user = UserProfile()..userName = 'FineGuy';

  void _onButtonTap() {
    setState(() {
      _user.userPoints += _user.pointPerTap;
      _user.depleteEnergy();
      _user.pointsForNextLevel();
      _user.startEnergyReplenishment();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          // as an App Bar
          Center(
            child: Container(
              height: screenHeight * (9 / 100),
              width: screenWidth,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.surfaceColor,
                  border: Border.all(color: AppColors.primaryColor, width: 1)),
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
                  )
                ],
                totalRepeatCount: 2,
              ),
            ),
          ),

          const SizedBox(height: 5),

          // Statistics Bar
          Center(
            child: Container(
              padding: const EdgeInsets.all(6),
              height: screenHeight * (15 / 100),
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: AppColors.secondaryColor,
                border: Border.all(color: AppColors.primaryColor, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ppt
                  Container(
                    width: screenWidth * (30 / 100),
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.surfaceColor,
                      border:
                          Border.all(color: AppColors.primaryColor, width: 1),
                    ),
                    child: Text(
                      "Points Per Tap \n ${_user.pointPerTap}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),

                  // nl
                  Container(
                    width: screenWidth * (30 / 100),
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.surfaceColor,
                      border:
                          Border.all(color: AppColors.primaryColor, width: 1),
                    ),
                    child: Text(
                      "Next level \n ${_user.nextLevel}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),

                  // pph
                  Container(
                    width: screenWidth * (30 / 100),
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.surfaceColor,
                      border:
                          Border.all(color: AppColors.primaryColor, width: 1),
                    ),
                    child: Text(
                      "Profit per hour \n ${_user.profitPerHour}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 5),

          // Main action area
          Container(
            margin: const EdgeInsets.fromLTRB(6, 15, 6, 15),
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: screenWidth,
            height: screenHeight * (70 / 100),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primaryColor, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // User balance & progress bar
                Column(
                  children: [
                    // Current User point
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.attach_money,
                            size: 30, color: Colors.yellow),
                        Text(
                          '${_user.userPoints}',
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        )
                      ],
                    ),

                    // User amount Progress Bar
                    SizedBox(
                      width: screenWidth * (75 / 100),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: LinearProgressIndicator(
                          value: (_user.userPoints / _user.nextLevel),
                          backgroundColor: AppColors.surfaceColor,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),

                // Tappable area ( Gesture Detector)
                Center(
                  child: GestureDetector(
                    onTap: _onButtonTap,
                    child: Container(
                      width: screenWidth * 0.8, // Change size as needed
                      height: screenHeight * 0.45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: AppColors.surfaceColor,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.surfaceColor, // Inner color
                            AppColors.secondaryColor, // Outer color
                          ],
                          stops: [0.7, 1.0], // Control the gradient transition
                        ),
                        boxShadow: [
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
                ),

                // Energy & Boost ( New Navigation Page required with back button )
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.architecture_rounded,
                          color: AppColors.textSecondary,
                          size: 30,
                        ),
                        StreamBuilder(
                          stream: Stream.periodic(
                              const Duration(milliseconds: 1200), (t) => t),
                          builder: (ctx, v) {
                            return Text(
                              '${_user.mineEnergy}/${_user.maxMineEnergy}',
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.white),
                            );
                          },
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                      child: ElevatedButton(
                          onPressed: () => _openEnergyBoostPage(
                              context: context,
                              fullscreenDialogue: true,
                              user: _user),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                          ),
                          child: const Text(
                            'Boost',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void _openEnergyBoostPage(
      {required BuildContext context,
      bool fullscreenDialogue = false,
      required UserProfile user}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialogue,
        builder: (context) => EnergyBoost(user: user),
      ),
    );
  }
}
