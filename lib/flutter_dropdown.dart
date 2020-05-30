import 'package:flutter/material.dart';

enum DropDownType {
  FormField,
  PopUpMenu,
  Button,
}

class DropDown<T> extends StatefulWidget {
  final DropDownType dropDownType;
  final List<T> items;
  final T initialValue;
  final String hint;
  final Function onChange;

  DropDown({
    this.dropDownType = DropDownType.Button,
    this.items,
    this.initialValue,
    this.hint,
    this.onChange,
  }) : assert(dropDownType != null),
      assert(items != null),
      assert(onChange != null);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState<T> extends State<DropDown<T>> {
  
  T selectedValue;
  
  @override
  void initState() {
    selectedValue = widget.initialValue;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    switch (widget.dropDownType) {
      case DropDownType.FormField:
        return SizedBox();
      case DropDownType.PopUpMenu:
        return SizedBox();
      case DropDownType.Button:
      default:
        return DropdownButton<T>(
          onChanged: (T value) {
            selectedValue = value;
            setState(() {});
            widget.onChange(value);
          },
          value: selectedValue,
          items: widget.items.map<DropdownMenuItem<T>>((item) => buildDropDownItem(item)).toList(),
          hint: Text(widget.hint),
        );
    }
  }

  DropdownMenuItem<T> buildDropDownItem(T item) =>
      DropdownMenuItem<T>(
        child: (item is Widget) ? item : Text(item.toString()),
        value: item,
      );
}
