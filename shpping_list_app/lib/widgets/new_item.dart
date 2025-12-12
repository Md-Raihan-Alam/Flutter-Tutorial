import 'package:flutter/material.dart';
import "package:shpping_list_app/data/categories.dart";
import 'package:shpping_list_app/models/category.dart';
import 'package:shpping_list_app/models/grocery_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewItem extends StatefulWidget {
  const NewItem({super.key});
  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  // need key in FormField for accessing and validation
  final _formKey = GlobalKey<FormState>();
  var _enteredName = "";
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!
          .save(); // onSaved will be called, which will set the value of _enteredName
      setState(() {
        _isSending = true;
      });
      final url = Uri.https(
        "flutter-firebase-project-10ba6-default-rtdb.firebaseio.com",
        "shopping-list.json",
      );
      final response = await http.post(
        url,
        headers: {
          'Content-Type': "application/json",
        },
        body: json.encode(
          {
            "name": _enteredName,
            "quantity": _enteredQuantity,
            "category": _selectedCategory.title,
          },
        ),
      );
      final Map<String, dynamic> resData = json.decode(response.body);
      // print(response.body);
      // print(response.statusCode);
      if (!context.mounted) return;
      Navigator.of(context).pop(GroceryItem(
          id: resData['name'],
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory));
      // Navigator.of(context).pop(
      //   GroceryItem(
      //     id: DateTime.now().toString(),
      //     name: _enteredName,
      //     quantity: _enteredQuantity,
      //     category: _selectedCategory,
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  // Instead of FormField
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text("Item Name"),
                  ),
                  validator: (value) {
                    // Only in TextFormField
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return "Must be between 1 and 50 characters.";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredName = value!;
                  }),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Quantity"),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue:
                          _enteredQuantity.toString(), // Only in TextFormField
                      validator: (value) {
                        // Only in TextFormField
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          // exclamation mark need to tell flutter it won't be null
                          return "Must be a valid, positive number.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.parse(
                            value!); // diff between tryParse and parse is that parse will throw an error if it can't parse while tryParse will return null
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      // Instead of DropdownButton,
                      items: [
                        for (final category
                            in categories.entries) //entries turn map to list
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.title),
                              ],
                            ),
                          )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSending
                        ? null
                        : () {
                            _formKey.currentState!.reset();
                          },
                    child: const Text("Reset"),
                  ),
                  ElevatedButton(
                    onPressed: _isSending ? null : _saveItem,
                    child: _isSending
                        ? SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator())
                        : const Text("Add Item"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
