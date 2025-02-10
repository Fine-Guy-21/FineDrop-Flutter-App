// ignore_for_file: deprecated_member_use
import 'package:airdrop_demo/model/color.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';

class EnergyBoost extends StatefulWidget {
  final UserProfile user;
  const EnergyBoost({super.key, required this.user});

  @override
  State<EnergyBoost> createState() => _EnergyBoostState();
}

class _EnergyBoostState extends State<EnergyBoost> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    // final screenWidth = MediaQuery.of(context).size.width - 30;

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
              padding: const EdgeInsets.all(15),
              child: Center(
                  child: Container(
                height: screenHeight * 0.98,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.secondaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              ' ${widget.user.userPoints.toInt()}',
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
                      width: double.infinity,
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceColor,
                        border:
                            Border.all(color: AppColors.primaryColor, width: 2),
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
                              //Image Container
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
                              // Text Conatainer
                              Column(
                                children: [
                                  const Text('Full Energy',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    '${widget.user.fullenergy}/${widget.user.maxfullenergy} Available',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          //button

                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  var res = widget.user.useboostenergy();

                                  if (res) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Energy Boosted'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Come Back Tomorrow'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      AppColors.primaryColor),
                                  foregroundColor: WidgetStateProperty.all(
                                      AppColors.surfaceColor)),
                              child: const Text('Use')),
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
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceColor,
                        border:
                            Border.all(color: AppColors.primaryColor, width: 2),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Multi Tap',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.attach_money,
                                        size: 15,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        ' ${widget.user.multitapPrice.toInt()}  | ',
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        'Lvl ${widget.user.multitaplevel}',
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  var res = widget.user.mutlitapIncrement();
                                  if (res) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Center(
                                            child:
                                                Text('Purchased Succesfully')),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize
                                                .min, // Adjusts the row size to fit its children
                                            children: [
                                              Text('Not enough '),
                                              Icon(
                                                Icons.attach_money,
                                                size: 20,
                                                color: Colors.yellow,
                                              ), // The money icon
                                            ],
                                          ),
                                        ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      AppColors.primaryColor),
                                  foregroundColor: WidgetStateProperty.all(
                                      AppColors.surfaceColor)),
                              child: const Text('Buy')),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Energy Limit
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceColor,
                        border:
                            Border.all(color: AppColors.primaryColor, width: 2),
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
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.attach_money,
                                        size: 15,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        '${widget.user.energylimitPrice.toInt()}   | ',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        'Lvl ${widget.user.energylimitlevel}',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  var res = widget.user.energyLimitIncrement();
                                   if (res) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Center(
                                            child:
                                                Text('Purchased Succesfully')),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize
                                                .min, // Adjusts the row size to fit its children
                                            children: [
                                              Text('Not enough '),
                                              Icon(
                                                Icons.attach_money,
                                                size: 20,
                                                color: Colors.yellow,
                                              ), // The money icon
                                            ],
                                          ),
                                        ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      AppColors.primaryColor),
                                  foregroundColor: WidgetStateProperty.all(
                                      AppColors.surfaceColor)),
                              child: const Text('Buy')),
                        ],
                      ),
                    ),
                  ],
                ),
              )))),
    );
  }
}
