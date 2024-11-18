import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

Widget menuList(BuildContext context, WidgetRef ref, String role) {
  List<Map<String, dynamic>> menuList = [
    {
      'role': ['PARTICIPANT', 'EVENT_ORGANIZER', 'SUPERADMIN', 'RECEPTIONIST'],
      'menu': 'Perbarui Profil',
      'destination': '/profile-update',
    },
    {
      'role': ['PARTICIPANT', 'EVENT_ORGANIZER'],
      'menu': 'Dompet Digital',
      'destination': '/digital-tickets',
    },
    {
      'role': ['PARTICIPANT'],
      'menu': 'Riwayat',
      'destination': '/history',
    },
    {
      'role': ['EVENT_ORGANIZER', 'SUPERADMIN', 'RECEPTIONIST', 'PARTICIPANT'],
      'menu': 'Ubah Kata Sandi',
      'destination': '/change-password',
    },
  ];

  List<Map<String, dynamic>> filteredMenuList =
      menuList.where((menu) => menu['role'].contains(role)).toList();

  return Container(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Column(
      children: filteredMenuList.map((menuItem) {
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                menuItem['menu'],
                style: const TextStyle(
                  color: ghostBlack,
                ),
              ),
              const HeroIcon(HeroIcons.chevronRight,
                  color: ghostBlack, size: 20),
            ],
          ),
          onTap: () {
            ref.read(routerProvider).push(menuItem['destination']);
          },
        );
      }).toList(),
    ),
  );
}
