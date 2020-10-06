class Stock {
  final String symbol;
  final String company;
  final double price;
  final String change;

  Stock({this.symbol, this.company, this.price, this.change});

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
        company: json["description"],
        change: json["change"],
        symbol: json["symbol"],
        price: json["price"].toDouble());
  }
}
