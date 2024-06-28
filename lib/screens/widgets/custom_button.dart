import 'package:flutter/material.dart';

import '../../constants.dart';

class MyButton extends Padding {
  MyButton({required String label, required VoidCallback onPressed})
      : super(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
          padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
          child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: darkBlue,
              elevation: 5.0,
              color: darkBlue,
              child: MaterialButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                height: 42.0,
                onPressed: onPressed,
                child: Text((label),
                    style: TextStyle(fontSize: 15.0, color: lightGray)),
              ))));
}
