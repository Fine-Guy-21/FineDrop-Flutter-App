import 'package:finedrop/model/color.dart';
import 'package:flutter/material.dart';
import 'package:finedrop/model/user.dart';
import 'package:finedrop/Pages/boostsPage.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  final UserProfile user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  void _onButtonTap() {
    setState(() {
      widget.user.userPoints += widget.user.pointPerTap.toDouble();
      widget.user.depleteEnergy();
      widget.user.pointsForNextLevel();
      widget.user.startEnergyReplenishment();
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
          const SizedBox(height: 15),

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
                  Tooltip(
                    message: 'Points per tap',
                    child: Container(
                      width: screenWidth * (30 / 100),
                      height: screenHeight * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.surfaceColor,
                        border:
                            Border.all(color: AppColors.primaryColor, width: 1),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Point Per Tap",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${widget.user.pointPerTap.toInt()}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // child: Column(
                    ),
                  ),

                  // nl
                  Tooltip(
                      message: 'Next Level',
                      child: Container(
                        width: screenWidth * (30 / 100),
                        height: screenHeight * 0.09,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.surfaceColor,
                          border: Border.all(
                              color: AppColors.primaryColor, width: 1),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Next Level",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${widget.user.nextLevel.toInt()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),

                  // pph
                  Tooltip(
                    message: 'Profit per hour',
                    child: Container(
                      width: screenWidth * (30 / 100),
                      height: screenHeight * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.surfaceColor,
                        border:
                            Border.all(color: AppColors.primaryColor, width: 1),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Profit Per Hour",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${widget.user.profitPerHour.toInt()}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
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
                          '${widget.user.userPoints.toInt()}',
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
                          value:
                              (widget.user.userPoints / widget.user.nextLevel),
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
                              '${widget.user.mineEnergy.toInt()}/${widget.user.maxMineEnergy.toInt()}',
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
                              user: widget.user),
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
