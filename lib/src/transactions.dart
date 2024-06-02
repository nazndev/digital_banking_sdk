class Transactions {
  Future<void> transferMoney(double amount, String fromAccount, String toAccount) async {
    // Simulate network request
    await Future.delayed(Duration(seconds: 2));
    print('Transferred $amount from $fromAccount to $toAccount');
  }
}
