import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DropdownButtonExample extends StatefulWidget {
  final List<String> list;

  const DropdownButtonExample(this.list,{super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}


class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = "Value";


  @override
  void initState() {
    super.initState();
     dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Container(child: const Icon(Icons.arrow_downward)),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}