import 'package:flutter/material.dart';

class ItemAhadethDetails extends StatelessWidget {
  String content;

  ItemAhadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
