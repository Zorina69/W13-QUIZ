import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.tabId});

  final String tabId;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

    // Inputs
  final _nameController = TextEditingController();

  void searchItem(){
    setState(() {
      if(_nameController.isNotEmpty){
        return ListTile(
          leading: Container(width: 15, height: 15, color: grocery.category.color),
          title: Text(grocery.name),
          trailing: Text(grocery.quantity.toString()),
        );
      }
    });

  }

  void listItem(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Search Your Grocery"),
      // ),
      body: 
      TextFormField(
        controller: _nameController,
        onChanged: (value) => listItem(),
        maxLength: 50,
        decoration: const InputDecoration(label: Text('Search Here')),
      ),
    );
  }
}