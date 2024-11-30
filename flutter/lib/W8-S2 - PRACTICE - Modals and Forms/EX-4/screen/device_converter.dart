import 'package:flutter/material.dart';

enum Device { euro, riels, dong }

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  String dropdownValue = Device.values.first.name;
  List<String> device = Device.values.map((e) => e.name).toList();
  final _valueController = TextEditingController();
  double amountDevice = 0.0;
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );
  void Convert() {
    double amount = double.tryParse(_valueController.text) ?? 0.0;
    setState(() {
      switch (dropdownValue) {
        case "euro":
          {
            amountDevice = amount * 0.95;
            break;
          }
        case "riels":
          {
            amountDevice = amount * 4100;
            break;
          }
        case "dong":
          {
            amountDevice = amount * 25346.49;
            break;
          }
        default:
          {
            amountDevice = 0;
            break;
          }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _valueController.addListener(Convert);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
              controller: _valueController,
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          const Text("Device:"),
          DropdownButton(
              value: dropdownValue,
              items: device.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    dropdownValue = newValue;
                    Convert();
                  });
                }
              }),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text('$amountDevice'))
        ],
      )),
    );
  }
}