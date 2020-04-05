class Currency {
  final double amount;

  get(int round) {
    return '\$' + this.amount.toStringAsFixed(round);
  }
  
  Currency(this.amount);
}