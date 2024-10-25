import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Widget userInfo(BuildContext context, WidgetRef ref,
        {bool withNotification = true, bool withLogout = false}) =>
    Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/example.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'johndoe,',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Username',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (!withNotification && withLogout)
                Container(
                  width: 64,
                  height: 64,
                  child: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ),
              if (withNotification)
                GestureDetector(
                  onTap: () {
                    context.push('/notification');
                  },
                  child: Container(
                    width: 64,
                    height: 64,
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
