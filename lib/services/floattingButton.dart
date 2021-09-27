import 'package:flutter/material.dart';

class FloattingButton extends StatelessWidget {
  final Widget widget;
  const FloattingButton({Key key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => widget));
        },
        // backgroundColor: Colors.red,
        child: Icon(Icons.edit));
  }
}
