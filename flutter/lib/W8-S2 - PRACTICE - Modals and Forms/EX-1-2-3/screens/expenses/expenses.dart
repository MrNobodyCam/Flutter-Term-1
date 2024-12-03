import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  Expense? _lastRemovedExpense;
  int index = 0;
  void onExpenseRemoved(Expense expense) {
    setState(() {
      // for (Expense index in _registeredExpenses) {
      //   if (expense == index) {
      //     _lastRemovedExpense = index;
      //   }
      // }
      _lastRemovedExpense = expense;
      index = _registeredExpenses.indexOf(expense);
      // print(index);
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              // for (Expense size in _registeredExpenses) {
              //   if (_registeredExpenses.indexOf(size) == index) {
              //     _registeredExpenses.insert(_lastRemovedExpense!,index);
              //   }
              // }
              _registeredExpenses.insert(index, _lastRemovedExpense!);
              // _registeredExpenses.add(_lastRemovedExpense!);
            });
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onCreated: onExpenseCreated,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _registeredExpenses.isEmpty
          ? const Center(
              child: Text(
                'No expense found. Start adding some!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          : ExpensesList(
              expenses: _registeredExpenses,
              onExpenseRemoved: onExpenseRemoved,
            ),
    );
  }
}
