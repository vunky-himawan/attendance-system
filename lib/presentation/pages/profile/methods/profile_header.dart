import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';

Widget profileHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              image: DecorationImage(
                image: AssetImage('assets/example.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          verticalSpace(5),
          const Text(
            'Howdy,',
            style: TextStyle(color: ghost),
          ),
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
