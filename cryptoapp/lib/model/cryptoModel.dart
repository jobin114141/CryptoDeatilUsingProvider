class Cryptomodel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? current_price;
  double? market_cap_rank;
  
  double? high_24h;
  double? low_24h;

  Cryptomodel(
      {this.id,
      this.symbol,
      this.name,
      this.image,
      this.current_price,
      this.market_cap_rank,
      
      this.high_24h,
      this.low_24h});

  factory Cryptomodel.fromJson(Map<String, dynamic> Json) => Cryptomodel(
        id: Json["id"],
        symbol: Json["symbol"],
        name: Json["name"],
        image: Json["image"],
        current_price: Json["current_price"],
        market_cap_rank: Json["market_cap_rank"],
        
        high_24h: Json["high_24h"],
        low_24h: Json["low_24h"],
      );
}
