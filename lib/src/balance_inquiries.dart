class BalanceInquiries {
  Future<double> getBalance(String account) async {
    // Simulate network request
    await Future.delayed(Duration(seconds: 2));
    return 1000.0; // Return a dummy balance
  }
}
