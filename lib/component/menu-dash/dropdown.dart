import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  // List of items for the dropdown
  final List<String> _items = ["Alat 1", "Alat 2", "Alat 3", "Alat 4"];

  // Selected item
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Example"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Pilih Alat:",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              // DropdownButton widget
              DropdownButton<String>(
                value: _selectedItem,
                hint: const Text("Pilih item"),
                isExpanded: true,
                items: _items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },
              ),
              const SizedBox(height: 24.0),
              // Display selected item
              Text(
                _selectedItem == null
                    ? "Belum ada item yang dipilih"
                    : "Item yang dipilih: $_selectedItem",
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
