class Currency {
  final double amount;

  get() {
    return '\$' + this.amount.toStringAsFixed(2);
  }
  
  Currency(this.amount);
}