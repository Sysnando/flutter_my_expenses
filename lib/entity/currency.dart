class Currency {
  final double amount;

  get() {
    return '\$' + this.amount.toString();
  }
  
  Currency(this.amount);
}