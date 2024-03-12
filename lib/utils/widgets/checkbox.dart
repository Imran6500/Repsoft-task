import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../resources/r.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: _isChecked
              ? R.color.primaryColor
              : R.color.checkBoxColor, // Checked color
        ),
        child: _isChecked
            ? const Icon(
                Icons.check,
                size: 16.0,
                color: Colors.white, // Checkmark color
              )
            : null,
      ),
    );
  }
}
