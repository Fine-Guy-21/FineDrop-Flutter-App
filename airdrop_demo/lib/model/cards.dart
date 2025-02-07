class CardModel {
  final String title;
  final double profitPerHour;
  final int level;
  final String imageUrl;
  final double price;

  CardModel({
    required this.title,
    required this.profitPerHour,
    required this.level,
    required this.imageUrl,
    required this.price,
  });

void priceForNextLevel(price) {
  price = price * 1.5;
}
void incrementLevel(level) {
  level = level + 1;
}

void profitPerHourForNextLevel(profitPerHour) {
  profitPerHour = profitPerHour * 1.2;
}

}

final List<CardModel> cards = [
    
    CardModel(
      title: 'Coding Enthusiast',
      profitPerHour: 90,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=13912&format=png&color=000000',     
      price: 220,
    ),
    CardModel(
      title: 'Crypto Expert',
      profitPerHour: 120,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png&color=000000',
      price: 300,
    ),
    CardModel(
      title: 'Blockchain Developer',
      profitPerHour: 150,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=119026&format=png&color=000000',
      price: 400,
    ),
    CardModel(
      title: 'NFT Artist',
      profitPerHour: 180,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=2mIgusGquJFz&format=png&color=000000',
      price: 500,
    ),
    CardModel(
      title: 'DeFi Expert',
      profitPerHour: 210,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=19318&format=png&color=000000',
      price: 600,
    ),
    CardModel(
      title: 'Web3 Developer',
      profitPerHour: 240,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=63306&format=png&color=000000',
      price: 700,
    ),
    CardModel(
      title: 'Metaverse Creator',
      profitPerHour: 270,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png&color=000000',
      price: 800,
    ),
    CardModel(
      title: 'AI Specialist',
      profitPerHour: 300,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png&color=000000',
      price: 900,
    ),
    CardModel(
      title: 'Game Developer',
      profitPerHour: 330,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png&color=000000',
      price: 1000,
    ),
    CardModel(
      title: 'Cybersecurity Expert',
      profitPerHour: 360,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png&color=000000',
      price: 1100,
    ),
    CardModel(
      title: 'Quantum Computing Expert',
      profitPerHour: 390,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png&color=000000',
      price: 1200,
    ),
    CardModel(
      title: 'Space Explorer',
      profitPerHour: 420,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png&color=000000',
      price: 1300,
    ),
    CardModel(
      title: 'AI Robot',
      profitPerHour: 450,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png&color=000000',
      price: 1400,
    ),

  ];