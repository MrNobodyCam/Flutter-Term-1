class BankAccount {
  int id;
  String name;
  double balance = 0;

  BankAccount({required this.id, required this.name});

  void withdraw(double amount) {
    if (amount > balance) {
      throw Exception('Insufficient balance!');
    }
    balance -= amount;
  }

  void credit(double amount) {
    balance += amount;
  }
}

class Bank {
  String name;
  List<BankAccount> accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int id, String name) {
    for (var account in accounts) {
      if (account.id == id) {
        throw Exception('Account with ID $id already exists!');
      }
    }

    BankAccount newAccount = BankAccount(id: id, name: name);
    accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");

  BankAccount ronanAccount = myBank.createAccount(1, 'Ronan');
  BankAccount vichetAccount = myBank.createAccount(2, 'vichet');

  ronanAccount.credit(100);
  print('User ${ronanAccount.name}\'s balance: \$${ronanAccount.balance}');
  ronanAccount.withdraw(50);
  print('User ${ronanAccount.name}\'s balance: \$${ronanAccount.balance}');
  print('User ${vichetAccount.name}\'s balance: \$${vichetAccount.balance}');

  try {
    ronanAccount.withdraw(75);
  } catch (e) {
    print(e);
  }

  try {
    myBank.createAccount(1, 'Duplicate Ronan');
  } catch (e) {
    print(e);
  }
}
