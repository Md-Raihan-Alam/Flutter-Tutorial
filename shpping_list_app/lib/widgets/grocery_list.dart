import 'package:flutter/material.dart';
import 'package:shpping_list_app/data/categories.dart';
import 'package:shpping_list_app/models/grocery_item.dart';
import 'package:shpping_list_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _error;
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      "flutter-firebase-project-10ba6-default-rtdb.firebaseio.com",
      "shopping-list.json",
    );

    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        setState(() {
          _error = "Failed to fetch data, Please try again later";
        });
      }

      final data = json.decode(response.body);

      if (data == null || data is! Map<String, dynamic>) {
        return;
      }

      if (response.body == "null") {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final List<GroceryItem> loadedItems = [];

      for (final item in data.entries) {
        final categoryName = item.value['category'];
        final matchedCategory = categories.entries.firstWhere(
          (catItem) => catItem.value.title == categoryName,
          orElse: () => throw Exception("Unknown category: $categoryName"),
        );

        loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value["name"],
          quantity: item.value["quantity"],
          category: matchedCategory.value,
        ));
      }

      setState(() {
        _groceryItems = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error = "Something went again, try later";
      });
    }
  }

  void _addItem() async {
    // final newItem = await Navigator.of(context).push<GroceryItem>(
    //     MaterialPageRoute(builder: (ctx) => const NewItem()));
    // if (newItem == null) {
    //   return;
    // }
    // setState(() {
    //   _groceryItems.add(newItem);
    // });
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));
    // _loadItems();
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    final url = Uri.https(
      "flutter-firebase-project-10ba6-default-rtdb.firebaseio.com",
      "shopping-list/${item.id}.json",
    );
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
        // _error = "Failed to delete item, Please try again later";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: const Text("No items yet. Add some!"),
    );

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_groceryItems.isEmpty) {
      content = const Center(
        child: Text("No items yet. Add some!"),
      );
    }
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }
    if (_error != null) {
      content = Center(child: Text(_error!));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Groceries"),
          actions: [
            IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: content);
  }
}
