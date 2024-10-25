import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:flutter/material.dart';

Widget label(BuildContext context, String status) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(
        color: status == 'Berhasil' ? primaryGreen : primaryRed,
      ),
      borderRadius: BorderRadius.circular(8),
      color: status == 'Berhasil' ? greenWhite : redWhite,
    ),
    child: Text(
      status,
      style: TextStyle(
        fontSize: 12,
        color: status == 'Berhasil' ? darkGreen : darkRed,
      ),
    ),
  );
}
