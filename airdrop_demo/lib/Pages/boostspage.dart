import 'package:airdrop_demo/designs/color.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class EnergyBoost extends StatelessWidget {
  final UserProfile user;
  const EnergyBoost({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Welcome to boost & shops ",
          style: TextStyle(color: AppColors.textSecondary),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: AppColors.textSecondary),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                height: screenHeight * 0.95,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.secondaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    // User amount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Current User point
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.attach_money,
                                size: 30, color: Colors.yellow),
                            Text(
                              ' ${user.userPoints.toInt()}',
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 40,
                    ),

                    const Text(
                      'Free Daily Boost',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // Full Energy
                    Container(
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(8),
                      width: screenWidth * 0.88,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceColor,
                        border: Border.all(color: AppColors.secondaryColor, width: 1),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.5), // Shadow color
                            spreadRadius: 4, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: const Offset(
                                2, 3), // Offset in x and y direction
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(120),
                                    color: Colors.blue[900]),
                                child: Image.asset(
                                  'assets/ai-generated-8618574_1280.png',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                children: [
                                  Text('Full Energy',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black)),
                                  Text(
                                    '6/6 Available',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(AppColors.primaryColor),
                                  foregroundColor:
                                      WidgetStateProperty.all(AppColors.surfaceColor)),
                              child: const Text('Purchase')),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 40,
                    ),

                    const Text(
                      'Boosts',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // Multi tap
                    Container(
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(8),
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceColor,
                        border: Border.all(color: AppColors.secondaryColor, width: 2),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.5), // Shadow color
                            spreadRadius: 4, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: const Offset(
                                2, 3), // Offset in x and y direction
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(120),
                                    color: Colors.blue[900]
                                    ),
                                child: Image.asset(
                                  'assets/ai-generated-8618574_1280.png',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  const Text('Multi Tap',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black)),
                                  Text(
                                    '${user.pointPerTap}  1000\$',
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(AppColors.primaryColor),
                                  foregroundColor:
                                      WidgetStateProperty.all(AppColors.surfaceColor)),
                              child: const Text('Purchase')),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                  //Energy Limit
                    Container(
                      margin: const EdgeInsets.all(0),                      
                      padding: const EdgeInsets.all(8),
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceColor,
                        border: Border.all(color: AppColors.secondaryColor, width: 2),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.5), // Shadow color
                            spreadRadius: 4, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: const Offset(
                                2, 3), // Offset in x and y direction
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(120),
                                    color: Colors.blue[900]),
                                child: Image.asset(
                                  'assets/ai-generated-8618574_1280.png',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  const Text('Energy Limit',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black)),
                                  Text(
                                    '${user.maxMineEnergy}  1000\$',
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(AppColors.primaryColor),
                                  foregroundColor:
                                      WidgetStateProperty.all(AppColors.surfaceColor)),
                              child: const Text('Purchase')),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
