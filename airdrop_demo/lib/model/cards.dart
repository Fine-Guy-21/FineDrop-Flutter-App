class CardModel {
  String title;
  double profitPerHour;
  int level;
  String imageUrl;
  double price;

  CardModel({
    required this.title,
    required this.profitPerHour,
    required this.level,
    required this.imageUrl,
    required this.price,
  });

  void priceForNextLevel(double oldPrice) {
    price = oldPrice * 1.5;
  }

  void incrementLevel(int oldLevel) {
    level = oldLevel + 1;
  }

  void profitPerHourForNextLevel(double oldProfitPerHour) {
    profitPerHour = oldProfitPerHour * 1.2;
  }

  // Convert a CardModel instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'profitPerHour': profitPerHour,
      'level': level,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  // Create a CardModel instance from a JSON object
  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      title: json['title'],
      profitPerHour: json['profitPerHour'].toDouble(),
      level: json['level'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
    );
  }
}


final List<CardModel> cards = [
    
    CardModel(
      title: 'Coding Enthusiast',
      profitPerHour: 90,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=l0UsZRTvcGel&format=png&color=000000',     
      price: 220,
    ),
    CardModel(
      title: 'Crypto Expert',
      profitPerHour: 120,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=FTifzX1R9L50&format=png&color=000000',
      price: 300,
    ),
    CardModel(
      title: 'Blockchain Developer',
      profitPerHour: 150,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=FHQYz1px0h83&format=png&color=000000',
      price: 400,
    ),
    CardModel(
      title: 'NFT Artist',
      profitPerHour: 180,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=V4tgjfG0kSwY&format=png&color=000000',
      price: 500,
    ),
    CardModel(
      title: 'DeFi Expert',
      profitPerHour: 210,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=E9E7pTmioS0q&format=png&color=000000',
      price: 600,
    ),
    CardModel(
      title: 'Web3 Developer',
      profitPerHour: 240,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=e2r7vNlIEGCx&format=png&color=000000',
      price: 700,
    ),
    CardModel(
      title: 'Metaverse Creator',
      profitPerHour: 270,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=fL5cWET9Paxh&format=png&color=000000',
      price: 800,
    ),
    CardModel(
      title: 'AI Specialist',
      profitPerHour: 300,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=6az9wbEz5UKE&format=png&color=000000',
      price: 900,
    ),
    CardModel(
      title: 'Game Developer',
      profitPerHour: 330,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=SrX1UAxClVFN&format=png&color=000000',
      price: 1000,
    ),
    CardModel(
      title: 'Cybersecurity Expert',
      profitPerHour: 360,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=YhicuoJvXeaI&format=png&color=000000',
      price: 1100,
    ),
    CardModel(
      title: 'Quantum Computing Expert',
      profitPerHour: 390,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=dAIe2P09btNH&format=png&color=000000',
      price: 1200,
    ),
    CardModel(
      title: 'Space Explorer',
      profitPerHour: 420,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=eulnKXXLCS2i&format=png&color=000000',
      price: 1300,
    ),
    CardModel(
      title: 'AI Robot',
      profitPerHour: 450,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=GBu1KXnCZZ8j&format=png&color=000000',
      price: 1400,
    ),
    CardModel(
      title: 'AI Avatar',
      profitPerHour: 480,
      level: 0,
      imageUrl: 'https://img.icons8.com/?size=100&id=6az9wbEz5UKE&format=png&color=000000',
      price: 1500,
    ),

  ];