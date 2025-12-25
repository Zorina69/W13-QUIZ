import 'package:flutter/material.dart';
import './grocery_list.dart';
import './search.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';
import './grocery_form.dart';

class GroceryDetail extends StatefulWidget {
  const GroceryDetail({super.key, required this.tabId});

  final String tabId;

  @override
  State<GroceryDetail> createState() => _GroceryDetailState();
}

enum GroceryTab { groceryTab, SearchTab }

class _GroceryDetailState extends State<GroceryDetail> {

  void onCreate() async {
      // Navigate to the form screen using the Navigator push
      Grocery? newGrocery = await Navigator.push<Grocery>(
        context,
        MaterialPageRoute(builder: (context) => const GroceryForm()),
      );
      if (newGrocery != null) {
        setState(() {
          dummyGroceryItems.add(newGrocery);
        });
      }
    }

  GroceryTab _currentTab = GroceryTab.groceryTab;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          GroceryList(tabId: widget.tabId),
          Search(tabId: widget.tabId),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        selectedItemColor: Colors.red,
        onTap: (index){
          setState(() {
            _currentTab = GroceryTab.values[index];
          });
        },
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'Grocery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), 
            label: 'Search'),
        ], 
      ),
    );
  }
}