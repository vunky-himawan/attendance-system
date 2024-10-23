import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:flutter/material.dart';

Widget divider(BuildContext context, {Color? color}) {
  return Divider(
    color: color ?? ghost,
    thickness: 0.5,
  );
}
