import 'package:finedrop/model/color.dart';
import 'package:finedrop/model/user.dart';
import 'package:flutter/material.dart';
import 'package:finedrop/model/cards.dart';

class CardsPage extends StatefulWidget {
  final UserProfile user;
  const CardsPage({super.key, required this.user});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;
    return SafeArea(
        child: Center(
      child: Column(
        children: [
          // Main Area
          Container(
              margin: const EdgeInsets.fromLTRB(6, 10, 6, 15),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: screenWidth,
              height: screenHeight * 0.9,
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor, width: 2),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.70,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 13,
                      ),
                      itemCount: cardsData.length,
                      itemBuilder: (context, index) =>
                          _buildCard(cardsData[index]),
                    ),
                  ),
                ],
              )),
        ],
      ),
    ));
  }

  Widget _buildCard(CardModel card) {
    return Tooltip(
        message: card.title,
        textStyle: const TextStyle(color: Colors.white, fontSize: 13),
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryColor, width: 1),
        ),
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () => {
            setState(() {
              if (widget.user.userPoints >= card.price) {
                widget.user.userPoints -= card.price;
                widget.user.profitPerHour += card.profitPerHour;
                card.incrementLevel(card.level);
                card.profitPerHourForNextLevel(card.profitPerHour);
                card.priceForNextLevel(card.price);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Not enough points'),
                    backgroundColor:
                        Colors.red, // Optional: Customize the color
                    duration: Duration(
                        seconds: 2), // Optional: Duration of the SnackBar
                  ),
                );
              }
            })
          },
          child: Container(
            width: 160,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primaryColor, width: 5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    card.imageUrl,
                    height: 65,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        card.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${card.profitPerHour.toInt()}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'lvl ${card.level + 1}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Text(
                            '|',
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.attach_money,
                                color: Colors.yellow,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${card.price.toInt()}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
