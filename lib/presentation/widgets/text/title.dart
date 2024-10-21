import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget title(BuildContext context, WidgetRef ref, String title) => Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    );
