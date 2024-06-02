class AccountManagement {
  Future<void> createAccount(String name, String email) async {
    // Simulate network request
    await Future.delayed(Duration(seconds: 2));
    print('Account created for $name with email $email');
  }
}
