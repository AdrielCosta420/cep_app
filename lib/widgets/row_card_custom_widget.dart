// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RowCardCustomWidget extends StatelessWidget {
  final String title;
  final String value;

  const RowCardCustomWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text(title)),
          Expanded(
            flex: 1,
            child: Text(value),
          ),
        ],
      ),
    ));
  }
}
