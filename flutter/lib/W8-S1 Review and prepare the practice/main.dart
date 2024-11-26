import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lutter/W8-S1%20Review%20and%20prepare%20the%20practice/Model/expense.dart';

void main() {
  Expense expense1 = Expense(
      title: "Ronan The best Book",
      amount: 15000.00,
      date: DateTime(2024, 12, 26),
      category: ExpenseType.FOOD);
  List<Expense> listExpense = [
    expense1,
    expense1,
    expense1,
    expense1,
    expense1,
    expense1,
    expense1,
    expense1,
    expense1,
    expense1
  ];
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Column(
          children: [
            AppBar(
              title: const Text(
                "Ronan-The-Best Expense App",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blue,
            ),
            Expanded(
              child: Container(
                color: Colors.blue.shade200,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    // Expense(title: "Kao Vichet", amount: 123, date: DateTime(2024), category: ExpenseType.FOOD);
                    // ExpenseItem(expense: expense1)
                    ExpenseList(expenseList: listExpense),
                  ],
                ),
              ),
            )
          ],
        ))),
  );
}

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy/MM/dd').format(expense.date);
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(expense.amount.toStringAsFixed(2)),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.movie),
                const SizedBox(
                  width: 6,
                ),
                Text(formattedDate),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenseList});
  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            ...expenseList.asMap().entries.map((entry) {
              final expense = entry.value;
              // final userAnswer = submission.getAnswerFor(question)?.questionAnswer ?? '';
              return ExpenseItem(expense: expense);
            }),
          ],
        )
      ],
    );
  }
}
