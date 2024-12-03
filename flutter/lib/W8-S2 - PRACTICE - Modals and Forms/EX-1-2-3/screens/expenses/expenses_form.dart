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
        date: selectedDate!,
        category: Category.values.firstWhere(
          (e) => e.name == dropdownValue,
          orElse: () => Category.values.first,
        ));

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  void dateTimePick() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
    // setState(() {
    //   // DatePicker.showDatePicker(
    //   //   context,
    //   //   showTitleActions: true,
    //   //   currentTime: DateTime.now(),
    //   //   minTime: DateTime(2000),
    //   //   maxTime: DateTime(3000),
    //   //   onChanged: (val) {
    //   //     setState(() {
    //   //       selectedDate = DateTime.tryParse(val as String);
    //   //     });
    //   //   },
    //   // );
    //   // DateTimePicker(
    //   //   initialValue: null,
    //   //   firstDate: DateTime(2000),
    //   //   lastDate: DateTime(2100),
    //   //   onChanged: (val) {
    //   //     setState(() {
    //   //       selectedDate = DateTime.tryParse(val);
    //   //     });
    //   //   },
    //   // );
    // });
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
                  width: 300,
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
                width: 160,
                height: 50,
                child: Row(
                  children: [
                    if (selectedDate == null)
                      Text("No Date Selected")
                    else
                      (Text(
                          "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}")),
                    Container(
                      child: IconButton(
                        onPressed: dateTimePick,
                        icon: Icon(Icons.calendar_month),
                      ),
                    ),
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
