import 'package:flutter/material.dart';
import 'package:flutter_assignments/small_challenge/ui/groceries/grocery_form.dart';

import '../../models/grocery.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key, required this.initGroceryList});
  final List<Grocery> initGroceryList;
  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<Grocery> groceryList = [];

  @override
  void initState() {
    super.initState();
    groceryList = widget.initGroceryList;
  }

  Future<void> onCreate() async {
    Grocery? newGrocery = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewItem()),
    );

    if (newGrocery != null) {
      setState(() {
        groceryList.add(newGrocery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (groceryList.isNotEmpty) {
      //  1 - Display groceries with an Item builder and  LIst Tile
      content = ListView.builder(
        itemCount: groceryList.length,
        itemBuilder: (context, index) =>
            GroceryTile(grocery: groceryList[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    //  2 - Display groceries with an Item builder and  LIst Tile
    return ListTile(
      leading: Container(width: 15, height: 15, color: grocery.category.color),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}
