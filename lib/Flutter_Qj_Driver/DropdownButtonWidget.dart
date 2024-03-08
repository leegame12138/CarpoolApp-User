import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownMenu].


class DropdownMenuExample extends StatefulWidget {
  var list;

  DropdownMenuExample(this.list,{super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();

}


class _DropdownMenuExampleState extends State<DropdownMenuExample> {

@override
  void initState() {
  String dropdownValue;
    super.initState();
  }
  @override

  Widget build(BuildContext context) {

    List<String> list = widget.list;
    String dropdownValue;

    return DropdownMenu<String>(
      width: 220,
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
