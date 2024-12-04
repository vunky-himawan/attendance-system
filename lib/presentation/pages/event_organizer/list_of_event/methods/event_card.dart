import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

Widget eventCard({required WidgetRef ref, required title, required date, required imageUrl}) {
  return InkWell(
    onTap: () {
      ref.watch(routerProvider).push('/event-organizer/events/detail-event');
    },
    child: Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    imageUrl,
                    width: 75,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        date,
                        style: const TextStyle(
                          color: ghostBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(16),
            const Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeroIcon(
                      HeroIcons.pencilSquare,
                      color: ghostBlack,
                    ),
                    SizedBox(width: 4.0), // Jarak antara ikon dan teks
                    Text(
                      'Ubah',
                      style: TextStyle(
                        fontSize: 12,
                        color: ghostBlack,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20), // Jarak antar icon dan text
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeroIcon(
                      HeroIcons.trash,
                      color: primaryRed,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      'Hapus',
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryRed,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
