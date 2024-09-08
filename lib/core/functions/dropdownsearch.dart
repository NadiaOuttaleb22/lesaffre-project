import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Dropdownsearch extends StatefulWidget {
  final String title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropDownSelectedName;
  final TextEditingController dropDownSelectedId;

  const Dropdownsearch(
      {super.key,
      required this.title,
      required this.listdata,
      required this.dropDownSelectedName,
      required this.dropDownSelectedId});

  @override
  State<Dropdownsearch> createState() => _DropdownsearchState();
}

class _DropdownsearchState extends State<Dropdownsearch> {
  void showDropDownSearch() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        maxSelectedItems: 3,
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata,
        onSelected: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropDownSelectedName.text = selectedListItem.name;
          widget.dropDownSelectedId.text = selectedListItem.value!;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropDownSelectedName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        contentPadding:
            const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
        hintText: widget.dropDownSelectedName.text == ""
            ? widget.title
            : widget.dropDownSelectedName.text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
