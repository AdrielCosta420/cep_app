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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 219, 113, 113),
            Color.fromARGB(255, 194, 105, 117),
          ],
        ),
      ),
      child: Card(
        shadowColor: Colors.grey,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
              Expanded(
                flex: 1,
                child: Text(
                  value,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
