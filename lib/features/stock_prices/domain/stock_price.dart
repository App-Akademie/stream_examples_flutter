class StockPrice {
  final String symbol;
  final double price;

  StockPrice(this.symbol, this.price);

  @override
  String toString() {
    return '$symbol: \$${price.toStringAsFixed(2)}';
  }
}
