import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowCardCustomWidget extends StatelessWidget {
  final store;
  final String text;

  const RowCardCustomWidget(
      {super.key, required this.text, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                text,
                style: GoogleFonts.adamina(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                store,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
