import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  String dropdownValue = Category.values.first.name;
  List<String> category = Category.values.map((e) => e.name).toList();

  DateTime? selectedDate;

  String get title => _titleController.text;

  void dropdownCallback(String? SelectedValue) {
    if (SelectedValue is String) {
      setState(() {
        dropdownValue = SelectedValue;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectedDate!, //  TODO :  For now it s a fake data
        category: Category.values.firstWhere(
          (e) => e.name == dropdownValue,
          orElse: () => Category.values.first,
        )); //  TODO :  For now it s a fake data

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              SizedBox(
                  width: 270,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: _valueController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        prefix: Text('\$ '),
                        label: Text('Amount'),
                      ),
                    ),
                  )),
              Spacer(),
              SizedBox(
                width: 180,
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Theme(
                        data: ThemeData(
                            inputDecorationTheme: InputDecorationTheme(
                          border: InputBorder.none,
                        )),
                        child: DateTimePicker(
                          initialValue: null,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          dateHintText: 'No Data Selected',
                          // decoration: InputDecoration(border: under),
                          onChanged: (val) {
                            setState(() {
                              selectedDate = DateTime.tryParse(val);
                            });
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please select a date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Icon(Icons.calendar_month),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                  value: dropdownValue,
                  items: category.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newvalue) {
                    if (newvalue != null) {
                      setState(() {
                        dropdownValue = newvalue;
                      });
                    }
                  }),
              Spacer(),
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: onAdd, child: const Text('Save Expense')),
            ],
          )
        ],
      ),
    );
  }
}
